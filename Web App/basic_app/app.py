from flask import Flask, get_flashed_messages, render_template, request, redirect, session, url_for, flash, jsonify, json
import pyodbc
import config

app = Flask(__name__)
app.secret_key = 'supersecretkey'

# Try connecting using provided SQL Server login credentials
def authenticate_sql_login(username, password):
    try:
        conn = pyodbc.connect(
            f"DRIVER={{ODBC Driver 17 for SQL Server}};"
            f"SERVER={config.SQL_SERVER};"
            f"DATABASE={config.SQL_DATABASE};"
            f"UID={username};"
            f"PWD={password}",
            timeout=5
        )
        conn.close()
        return True
    except Exception as e:
        print(f"[AUTH FAIL] {e}")
        return False



def sql_connection(username, password):
    return pyodbc.connect(f"DRIVER={{ODBC Driver 17 for SQL Server}};"
            f"SERVER={config.SQL_SERVER};"
            f"DATABASE={config.SQL_DATABASE};"
            f"UID={username};"
            f"PWD={password};"
            f"MaxRows={{10000}};")



@app.route('/update_student', methods=['POST'])
def update_student():
    pass


@app.route('/delete_instructor', methods=['POST'])
def delete_instructor():
    proc = "EXEC Delete_Ins ?"
    ins_id = request.form.get('instructor_id')
    conn = sql_connection('group3', '123')
    cursor = conn.cursor()
    cursor.execute(proc, ins_id)
    row = cursor.fetchone()
    message = row[0] if row else 'No message returned'
    conn.commit()
    cursor.close()
    conn.close()

    flash(message)

    return redirect(url_for('admin_panel'))

@app.route('/')
def home():
    return redirect(url_for('login'))


@app.route('/login', methods=['GET', 'POST'])
def login():
    msg = ''
    if request.method == 'POST':
        action = request.form['action']
        username = request.form['username']
        password = request.form['password']

        if action == 'admin':
            if username == 'group3':
                if authenticate_sql_login(username, password):
                    print('Connected to DB server')
                    session['username'] = username
                    session['role'] = 'admin'
                    session['password'] = password

                    return redirect(url_for('admin_panel'))

                else:
                    msg = 'Invalid SQL Server credentials.'
            
            else:
                msg = 'You are not an admin! Please enter admin credentials.'

        if action == 'student':
                sql_query = f"SELECT * from Track inner join Student on Student.Track_ID = Track.Track_ID and Student.Stu_Email = '{username}'"
                conn = sql_connection('group3', '123')  
                cursor = conn.cursor()
                cursor.execute(sql_query)                
                rows = cursor.fetchmany(1)       

                if rows:
                    columns = [desc[0] for desc in cursor.description]
                    formatted_rows = [dict(zip(columns, row)) for row in rows]
                    session['query_result'] = {'rows': formatted_rows, 'columns': columns}
                    cursor.close()

                    return redirect(url_for('student_panel'))   
                                     

                else:
                    msg = 'Invalid SQL Server credentials.'
                    return render_template('login.html', msg=msg)
        
        if action == 'instructor':
            sql_query = f'''
            SELECT *
            from Instructor, Instructor_Course, Course
            where Instructor.Ins_Email = '{username}'
            and Instructor.Ins_ID = Instructor_Course.Ins_ID
            and Course.Course_ID = Instructor_Course.Course_ID          
            '''
            conn = sql_connection('group3', '123')  
            cursor = conn.cursor()
            cursor.execute(sql_query)                
            rows = cursor.fetchmany(20)       

            if rows:
                columns = [desc[0] for desc in cursor.description]
                formatted_rows = [dict(zip(columns, row)) for row in rows]
                session['query_result'] = {'rows': formatted_rows, 'columns': columns}
                cursor.close()

                return redirect(url_for('instructor_panel'))   
                                    

            else:
                msg = 'Invalid SQL Server credentials.'
                return render_template('login.html', msg=msg)
                
        
        else:
            msg = 'You are not a user! Please enter user credentials.'

    return render_template('login.html', msg=msg)


@app.route('/admin', methods=['GET', 'POST'])
def admin_panel():
    if 'username' not in session or session.get('role') != 'admin':
        return redirect(url_for('login'))
    
    username = session.get('username')
    result = ''
    msg = ''              

    return render_template('admin_panel.html', username=username, result=result, msg=msg)


@app.route('/insert_new_instructor', methods=['POST'])
def insert_new_instructor():
    message = ''
    proc = "EXEC insert_new_instructor ?, ?, ?, ?, ?, ?"
    username = session.get('username')
    instructor_name = request.form.get('instructor_name')
    instructor_email = request.form.get('instructor_email')
    address = request.form.get('address')
    if address == "":
        address = None
    salary = request.form.get('salary')
    birth_date = request.form.get('birth_date')
    gender = request.form.get('gender')

    params = (instructor_name, gender[0], instructor_email, salary, birth_date, address)
    conn = sql_connection(username, session['password']) 
    cursor = conn.cursor()
    cursor.execute(proc, params)
    row = cursor.fetchone()

    message = row[0] if row else 'No message returned'
    
    conn.commit()
    cursor.close()
    conn.close()

    flash(message)

    return render_template('admin_panel.html', username=username)


@app.route('/insert_new_student', methods=['POST'])
def insert_new_student():
    msg = ''
    proc = "EXEC add_student ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?"
    student_name = request.form.get('student_name')
    student_email = request.form.get('student_email')
    state = request.form.get('state')
    city = request.form.get('city')
    street = request.form.get('street')
    linkedin = request.form.get('linkedin')
    intake = request.form.get('intake')
    track = request.form.get('track')
    Branch = request.form.get('Branch')
    birth_date = request.form.get('birth_date')
    gender = request.form.get('gender')

    params = (student_name, gender, student_email, state, city, street, birth_date, linkedin, intake, track, Branch)
    conn = sql_connection('group3', '123')
    cursor = conn.cursor()
    cursor.execute(proc, params)
    row = cursor.fetchone()
    message = row[0] if row else 'No message returned'
    
    conn.commit()
    cursor.close()
    conn.close()

    flash(message)

    return redirect(url_for('admin_panel'))

@app.route('/delete_student', methods=['POST'])
def delete_student():
    proc = "EXEC Delete_Student ?"
    ins_id = request.form.get('student')
    conn = sql_connection('group3', '123')
    cursor = conn.cursor()
    cursor.execute(proc, ins_id)
    row = cursor.fetchone()
    message = row[0] if row else 'No message returned'
    conn.commit()
    cursor.close()
    conn.close()

    flash(message)

    return redirect(url_for('admin_panel'))


@app.route('/student', methods=['GET', 'POST'])
def student_panel(): 
    query_results = session.get('query_result')
    
    username = query_results['rows'][0]['Stu_Name']
    id = query_results['rows'][0]['Student_ID']
    city = query_results['rows'][0]['City']
    email = query_results['rows'][0]['Stu_Email']
    bdate = query_results['rows'][0]['Stu_BirthDate']
    linkedin = query_results['rows'][0]['Stu_Linkedin']
    state = query_results['rows'][0]['Stu_State']
    street = query_results['rows'][0]['Street']
    track = query_results['rows'][0]['Track_Name']


    sql_query = f"SELECT * from Stu_Exam where Student_ID = {id} and Stu_Grade is not null"
    conn = sql_connection('student_user', '123')
    cursor=conn.cursor()
    cursor.execute(sql_query)
    rows = cursor.fetchmany(100)

    taken_exams = {}

    if rows:
        columns = [desc[0] for desc in cursor.description]
        formatted_rows = [dict(zip(columns, row)) for row in rows]
        session['query_result2'] = {'rows': formatted_rows, 'columns': columns}
        query_results2 = session.get('query_result2')
        for row in query_results2['rows']:
            taken_exams[row['Exam_ID']] = row['Stu_Grade']

    sql_query = f"SELECT * from Stu_Exam, Exam where Student_ID = {id} and Stu_Grade is null and Stu_Exam.Exam_ID = Exam.Exam_ID"
    cursor.execute(sql_query)
    rows = cursor.fetchmany(100)

    left_exams = {}

    if rows:        
        columns = [desc[0] for desc in cursor.description]
        formatted_rows = [dict(zip(columns, row)) for row in rows]
        session['query_result3'] = {'rows': formatted_rows, 'columns': columns}
        query_results3 = session.get('query_result3')
        for row in query_results3['rows']:
            left_exams[row['Exam_ID']] = row['Exam_Duration']
    
    cursor.close()
    conn.close()
    print("DONE")
    return render_template('student_panel.html', username=username, id=id, city=city, email=email, bdate=bdate, linkedin=linkedin, state=state, street=street, taken_exams=taken_exams, left_exams=left_exams, track=track)


@app.route('/get_exam', methods=['GET', 'POST'])
def get_exam():
    exam_id = request.form.get('exam_id')
    dur = request.form.get('duration')
    proc = "EXEC display_Exam_Q ?"
    conn = sql_connection('student_user', '123')
    cursor=conn.cursor()
    cursor.execute(proc, exam_id)
    rows = cursor.fetchmany(100)

    exam = {}

    if rows:
        columns = [desc[0] for desc in cursor.description]
        formatted_rows = [dict(zip(columns, row)) for row in rows]
        session['query_result4'] = {'rows': formatted_rows, 'columns': columns}
        query_results4 = session.get('query_result4')
  
        q_id = 0
        choices = []
        prev_q = ''

        for row in query_results4['rows']:
            if row['Question_ID'] != q_id:
                if len(choices) > 0:
                    exam[prev_q].append(choices)
                    choices = []
                                
                q_id = row['Question_ID']
                exam[row['Question Header']] = []
                prev_q = row['Question Header']

                if row['Choice'] == None:
                    choices.append('True')
                    choices.append('False')
                    exam[row['Question Header']].append(choices)
                    choices = []
            
                else:
                    choices.append(row['Choice'])
            
            else:
                choices.append(row['Choice'])
        if len(choices) > 0:
            exam[prev_q].append(choices)
            choices = []

        return render_template('take_exam.html', exam=exam, exam_id=exam_id, dur=dur)
    
    else:
         return render_template('student_panel.html', exam=exam)

@app.route('/submit_test', methods=['POST'])
def submit_test():
    data = request.get_json()
    exam_id = data.get('exam_id')
    for key, value in data.items():        
        if key == 'exam_id':
            continue

        sql = f"SELECT Question_ID from Question where CONVERT(VARCHAR(MAX), Qst_Header) = '{key}'"
        conn = sql_connection('student_user', '123')
        cursor=conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchmany(1)
        
        if rows:
            sql2 = "EXEC answer_question ?, ?, ?, ?"
            print(rows[0][0], session.get('query_result')['rows'][0]['Student_ID'], type(value))
            params = [session.get('query_result')['rows'][0]['Student_ID'], exam_id, rows[0][0], f"{value}"]
            cursor.execute(sql2, params)
            conn.commit()

    sql = "EXEC correct_exam ?, ?"
    
    cursor.execute(sql, (session.get('query_result')['rows'][0]['Student_ID'], exam_id))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({"status": "success"})



@app.route('/update_stu_state', methods=['POST'])
def update_stu_state():
    student_id = session.get('query_result')['rows'][0]['Student_ID']
    proc = "EXEC UpdateStudent ?, @Stu_State=?"
    param = request.form.get('field')
    params = (student_id, param)

    conn = sql_connection('student_user', '123')
    cursor = conn.cursor()
    cursor.execute(proc, params)

    row = cursor.fetchone()

    message = row[0] if row else 'No message returned'
    
    conn.commit()
    cursor.close()
    conn.close()

    flash(message)

    return redirect(url_for('student_panel'))  


@app.route('/update_stu_city', methods=['POST'])
def update_stu_city():
    student_id = session.get('query_result')['rows'][0]['Student_ID']
    proc = "EXEC UpdateStudent ?, @City=?"
    param = request.form.get('field')
    params = (student_id, param)

    conn = sql_connection('student_user', '123')
    cursor = conn.cursor()
    cursor.execute(proc, params)

    row = cursor.fetchone()

    message = row[0] if row else 'No message returned'
    
    conn.commit()
    cursor.close()
    conn.close()

    flash(message)

    return redirect(url_for('student_panel'))



@app.route('/update_stu_street', methods=['POST'])
def update_stu_street():
    student_id = session.get('query_result')['rows'][0]['Student_ID']
    proc = "EXEC UpdateStudent ?, @Street=?"
    param = request.form.get('field')
    params = (student_id, param)

    conn = sql_connection('student_user', '123')
    cursor = conn.cursor()
    cursor.execute(proc, params)

    row = cursor.fetchone()

    message = row[0] if row else 'No message returned'
    
    conn.commit()
    cursor.close()
    conn.close()

    flash(message)

    return redirect(url_for('student_panel'))




@app.route('/update_stu_linkedin', methods=['POST'])
def update_stu_linkedin():
    student_id = session.get('query_result')['rows'][0]['Student_ID']
    proc = "EXEC UpdateStudent ?, @Stu_Linkedin=?"
    param = request.form.get('field')
    params = (student_id, param)

    conn = sql_connection('student_user', '123')
    cursor = conn.cursor()
    cursor.execute(proc, params)

    row = cursor.fetchone()

    message = row[0] if row else 'No message returned'
    
    conn.commit()
    cursor.close()
    conn.close()

    flash(message)

    return redirect(url_for('student_panel'))





@app.route('/instructor_panel', methods=['GET', 'POST'])
def instructor_panel():
    get_flashed_messages()

    query_results = session.get('query_result')
    
    id = query_results['rows'][0]['Ins_ID']
    username = query_results['rows'][0]['Ins_Name']
    address = query_results['rows'][0]['Ins_Address']
    email = query_results['rows'][0]['Ins_Email']
    bdate = query_results['rows'][0]['Ins_BirthDate']
    hdate = query_results['rows'][0]['Ins_HireDate']
    ldate = query_results['rows'][0]['Ins_LeaveDate']

    courses = []
    for row in query_results['rows']:
        courses.append(row['Crs_Name'])


    print("DONE")
    return render_template('instructor_panel.html', username=username, id=id, address=address, email=email, bdate=bdate, hdate=hdate, ldate=ldate, course=courses)





@app.route('/generate_exam', methods=['POST'])
def generate_exam():
    crs_name =  request.form.get('crs_name')
    print(crs_name)
    crs_id = 0

    for row in session.get('query_result')['rows']:
        if row['Crs_Name'] == crs_name:
            crs_id = row['Course_ID']

    print(crs_id)

    proc = "EXEC GenerateExam ?, ?, ?, ?, ?"
    ins_id = session.get('query_result')['rows'][0]['Ins_ID']
    mcq = request.form.get('MCQ')
    tf = request.form.get('TF')
    dur = request.form.get('duration')
    print(ins_id, mcq, tf, dur)

    params = (crs_id, dur, ins_id, mcq, tf)

    conn = sql_connection('instructor_user', '123')
    cursor = conn.cursor()
    cursor.execute(proc, params)

    row = cursor.fetchone()

    message = row[0] if row else 'No message returned'
    conn.commit()
    cursor.close()
    conn.close()

    flash(message)

    return redirect(url_for('instructor_panel'))



@app.route('/update_address', methods=['POST'])
def update_address():
    ins_id = session.get('query_result')['rows'][0]['Ins_ID']
    proc = "EXEC UpdateIns ?, @Ins_Address=?"
    param = request.form.get('field')
    params = (ins_id, param)

    conn = sql_connection('instructor_user', '123')
    cursor = conn.cursor()
    cursor.execute(proc, params)

    row = cursor.fetchone()

    message = row[0] if row else 'No message returned'
    
    conn.commit()
    cursor.close()
    conn.close()

    flash(message)

    return redirect(url_for('instructor_panel'))




@app.route('/submit2', methods=['POST'])
def submit2():
    sql_query = ''
    username = session.get('username')
    result = ''
    msg = ''
    rows = None
    columns = None
    sql_query = request.form.get('sql_query')  # Get the SQL query from the form
    if sql_query and sql_query.strip():
        print(sql_query)
        try:
            conn = sql_connection(username, session['password'])  
            cursor = conn.cursor()  # Initialize cursor here
            cursor.arraysize = 100000
            
            if sql_query.strip().lower().startswith('select'):
                cursor.execute(sql_query)
                rows = cursor.fetchmany(100)
                columns = [desc[0] for desc in cursor.description]
                formatted_rows = [dict(zip(columns, row)) for row in rows]
                #result = formatted_rows  # You can modify this based on your need (e.g., formatting)
                session['query_result'] = {'rows': formatted_rows, 'columns': columns, 'result': result, 'msg': msg}
                return redirect(url_for('query_results'))
            else:
                cursor.execute(sql_query)
                conn.commit()
                result = 'Query executed successfully.'

        except Exception as e:
            msg = f"Error executing query: {e}"

        finally:
            if cursor:
                cursor.close()
            if conn:
                conn.close()
        

    else:
        msg = "Please enter a valid SQL query."  
    return render_template('admin_panel.html', username=username, msg=msg, result=result)
    #return render_template('query_results.html', rows=rows, columns=columns, result=result, msg=msg)





@app.route('/logout', methods=['GET', 'POST'])
def logout():
    session.clear()
    return redirect(url_for('login'))



@app.route('/query_results')
def query_results():
    query_result = session.get('query_result')
    if query_result:
        rows = query_result['rows']
        columns = query_result['columns']
        result = query_result['result']
        msg = query_result['msg']

    else:
        rows = columns = result = msg = None

    return render_template('query_results.html', rows=rows, columns=columns, result=result, msg=msg)


if __name__ == '__main__':
    app.run(debug=True)

