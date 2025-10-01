function openInsert_ins_Form() {
  document.getElementById("insert_instructor_popupForm").style.display = "flex";
}

function closeInsert_ins_Form() {
  document.getElementById("insert_instructor_popupForm").style.display = "none";
}




function openDelete_ins_Form() {
  document.getElementById("delete_instructor_popupForm").style.display = "flex";
}

function closeDelete_ins_Form() {
  document.getElementById("delete_instructor_popupForm").style.display = "none";
}




function openInsert_stu_Form() {
  document.getElementById("insert_student_popupForm").style.display = "flex";
}

function closeInsert_stu_Form() {
  document.getElementById("insert_student_popupForm").style.display = "none";
}




function openDelete_stu_Form() {
  document.getElementById("delete_student_popupForm").style.display = "flex";
}

function closeDelete_stu_Form() {
  document.getElementById("delete_student_popupForm").style.display = "none";
}






function openUpdate_stu_state() {
  document.getElementById("stu_update_state").style.display = "flex";
}

function closeUpdate_stu_state() {
  document.getElementById("stu_update_state").style.display = "none";
}



function openUpdate_stu_city() {
  document.getElementById("stu_update_city").style.display = "flex";
}

function closeUpdate_stu_city() {
  document.getElementById("stu_update_city").style.display = "none";
}



function openUpdate_stu_street() {
  document.getElementById("stu_update_street").style.display = "flex";
}

function closeUpdate_stu_street() {
  document.getElementById("stu_update_street").style.display = "none";
}



function openUpdate_stu_LK() {
  document.getElementById("stu_update_lk").style.display = "flex";
}

function closeUpdate_stu_LK() {
  document.getElementById("stu_update_lk").style.display = "none";
}



function openUpdateAddress_ins() {
  document.getElementById("ins_update_address").style.display = "flex";
}

function closeUpdateAddress_ins() {
  document.getElementById("ins_update_address").style.display = "none";
}




function openGenerateExam(name) {
  document.getElementById("generate_exam").style.display = "flex";
  document.querySelector('#generate_exam input[name="crs_name"]').value = name;
}

function closeGenerateExam() {
  document.getElementById("generate_exam").style.display = "none";
}