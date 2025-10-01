ALTER TABLE stu_certificate 
ADD cert_date DATE;


-- Declare date range
DECLARE @StartDate DATE = '2024-08-30';
DECLARE @EndDate DATE = '2025-01-10';

-- Update each row with a random date
UPDATE stu_certificate
SET cert_date = DATEADD(DAY, 
    ABS(CHECKSUM(NEWID())) % (DATEDIFF(DAY, @StartDate, @EndDate) + 1),
    @StartDate);

