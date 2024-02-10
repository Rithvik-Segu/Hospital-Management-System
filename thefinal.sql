if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_patients_doctor_id')
alter table patients DROP
CONSTRAINT fk_patients_doctor_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_patients_insurance_id')
alter table patients DROP
CONSTRAINT fk_patients_insurance_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_doctors_doctor_specialization_id')
alter table doctors DROP
CONSTRAINT fk_doctors_doctor_specialization_id



if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_payment_bills_payment_method_id')
alter table payment_bills DROP
CONSTRAINT fk_payment_bills_payment_method_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_payment_bills_patient_id')
alter table payment_bills DROP
CONSTRAINT fk_payment_bills_patient_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_payment_bills_prescription_id')
alter table payment_bills DROP
CONSTRAINT fk_payment_bills_prescription_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_prescriptions_doctor_id')
alter table prescriptions DROP
CONSTRAINT fk_prescriptions_doctor_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_prescriptions_patient_id')
alter table prescriptions DROP
CONSTRAINT fk_prescriptions_patient_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_prescriptions_medicine_id')
alter table prescriptions DROP
CONSTRAINT fk_prescriptions_medicine_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_labs_patient_id')
alter table labs DROP
CONSTRAINT fk_labs_patient_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_labs_doctor_id')
alter table labs DROP
CONSTRAINT fk_labs_doctor_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='k_labs_lab_test_id')
alter table labs DROP
CONSTRAINT k_labs_lab_test_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_in_patients_patient_id')
alter table in_patients DROP
CONSTRAINT fk_in_patients_patient_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_in_patients_room_id')
alter table in_patients DROP
CONSTRAINT fk_in_patients_room_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_in_patients_lab_no')
alter table in_patients DROP
CONSTRAINT fk_in_patients_lab_no

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_out_patients_patient_id')
alter table out_patients DROP
CONSTRAINT fk_out_patients_patient_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_out_patients_lab_no')
alter table out_patients DROP
CONSTRAINT fk_out_patients_lab_no

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_appointments_patient_id')
alter table appointments DROP
CONSTRAINT fk_appointments_patient_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_appointments_doctor_id')
alter table appointments DROP
CONSTRAINT fk_appointments_doctor_id

if exists(select * from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
constraint_name='fk_covid_patient_id')
alter table covid DROP
CONSTRAINT fk_covid_patient_id

go 

DROP TABLE IF EXISTS patients

DROP TABLE IF EXISTS doctors

DROP TABLE IF EXISTS doctor_specialization


DROP TABLE IF EXISTS payment_bills

DROP TABLE IF EXISTS prescriptions

DROP TABLE IF EXISTS medicines

DROP TABLE IF EXISTS payment_methods

DROP TABLE IF EXISTS insurances

DROP TABLE IF EXISTS labs

DROP TABLE IF EXISTS in_patients

DROP TABLE IF EXISTS out_patients

DROP TABLE IF EXISTS rooms

DROP TABLE IF EXISTS appointments

DROP TABLE IF EXISTS lab_tests

DROP TABLE IF EXISTS covid


GO

CREATE TABLE patients (
  patient_id int IDENTITY NOT NULL,
  doctor_id int NOT NULL,
  insurance_id int NOT NULL,
  patient_firstname varchar(30) NOT NULL,
  patient_lastname varchar(30) NOT NULL,
  patient_address varchar(30) NOT NULL,
  patient_age int NOT NULL,
  patient_gender varchar(10) NOT NULL,
  patient_phone_number char(10) NOT NULL,
  CONSTRAINT pk_patients_patient_id PRIMARY KEY(patient_id)
)


CREATE TABLE doctors (
  doctor_id int IDENTITY NOT NULL,
  doctor_specialization_id int NOT NULL,
  doctor_firstname varchar(30) NOT NULL,
  doctor_lastname varchar(30) NOT NULL,
  doctor_age int NOT NULL,
  doctor_gender varchar(10) NOT NULL,
  doctor_address varchar(30) NOT NULL,
  CONSTRAINT pk_doctors_doctor_id primary key(doctor_id)
);



CREATE TABLE doctor_specialization (
  doctor_specialization_id int IDENTITY NOT NULL,
  doctor_specialization_charge int NOT NULL,
  doctor_specialization_name varchar(50) NOT NULL,
  CONSTRAINT pk_doctor_specialization_doctor_specialization_id primary key(doctor_specialization_id)
);



CREATE TABLE medicines (
  medicine_id int IDENTITY NOT NULL,
  medicine_name varchar(15) NOT NULL,
  medicine_price int NOT NULL,
  CONSTRAINT pk_medicines_medicine_id primary key(medicine_id)
);

CREATE TABLE payment_bills (
  payment_bill_id int IDENTITY NOT NULL,
  patient_id int NOT NULL,
  payment_method_id int NOT NULL,
  prescription_id int NOT NULL,
  payment_bill_amount int NOT NULL,
  CONSTRAINT pk_payment_bills_payment_bill_id primary key(payment_bill_id)
);

CREATE TABLE prescriptions (
  prescription_id int IDENTITY NOT NULL,
  doctor_id int NOT NULL,
  patient_id int NOT NULL,
  medicine_id int NOT NULL,
  prescription_quantity int NOT NULL,
  CONSTRAINT pk_prescription_prescriptin_id primary key(prescription_id)
);

CREATE TABLE payment_methods (
  payment_method_id int IDENTITY NOT NULL,
  payment_method_name varchar(15) NOT NULL,
  CONSTRAINT pk_payment_methods_payment_method_id primary key(payment_method_id)
 
);

CREATE TABLE insurances (
  insurance_id int IDENTITY NOT NULL,
  insurance_name varchar(15) NOT NULL,
  insurance_claim_percent int NOT NULL,
  CONSTRAINT pk_insurance_insurance_id primary key(insurance_id)
);

CREATE TABLE labs (
  lab_no int IDENTITY NOT NULL,
  patient_id int NOT NULL,
  doctor_id int NOT NULL,
  lab_test_id int NOT NULL,
  CONSTRAINT pk_lab_lab_no primary key(lab_no)
);

CREATE TABLE in_patients (
  in_patient_date_of_admission varchar(15) NOT NULL,
  patient_id int NOT NULL,
  room_id int NOT NULL,
  lab_no int NOT NULL
);

CREATE TABLE out_patients (
  out_patient_date_of_discharge varchar(15) NOT NULL,
  patient_id int NOT NULL,
  lab_no int NOT NULL
);

CREATE TABLE rooms (
  room_id int IDENTITY NOT NULL,
  room_type varchar(30) NOT NULL,
  room_status varchar(15) NOT NULL,
  room_count int NOT NULL,
  room_charge int NOT NULL,
  CONSTRAINT pk_rooms_room_id primary key(room_id)
);

CREATE TABLE appointments (
  appointment_id int IDENTITY NOT NULL,
  patient_id int NOT NULL,
  doctor_id int NOT NULL,
  appointment_date varchar(15) NOT NULL,
  CONSTRAINT pk_appointments_appointment_id primary key(appointment_id)
);

CREATE TABLE lab_tests (
  lab_test_id int IDENTITY NOT NULL,
  lab_test_name varchar(50) NOT NULL,
  lab_test_price int NOT NULL,
  lab_test_location varchar(20) NOT NULL,
  CONSTRAINT pk_lab_tests_lab_test_id primary key(lab_test_id) 
);

CREATE TABLE covid (
  covid_sample_id int IDENTITY NOT NULL,
  patient_id int NOT NULL,
  covid_test_date varchar(15) NOT NULL,
  covid_result_date varchar(15) NOT NULL,
  covid_result varchar(10) NOT NULL,
  CONSTRAINT pk_covid_covid_sample_id primary key(covid_sample_id)
);


go 

-- adding constraints

Alter TABLE patients
add CONSTRAINT fk_patients_doctor_id FOREIGN KEY(doctor_id)
REFERENCES 
doctors(doctor_id)



Alter TABLE patients
add CONSTRAINT fk_patients_insurance_id FOREIGN KEY(insurance_id)
REFERENCES
insurances(insurance_id)



Alter TABLE doctors
add CONSTRAINT fk_doctors_doctor_specialization_id FOREIGN KEY(doctor_specialization_id)
REFERENCES
doctor_specialization(doctor_specialization_id)





Alter TABLE payment_bills
add CONSTRAINT fk_payment_bills_payment_method_id FOREIGN KEY(payment_method_id)
REFERENCES
payment_methods(payment_method_id)



Alter TABLE payment_bills
add CONSTRAINT fk_payment_bills_patient_id FOREIGN KEY(patient_id)
REFERENCES
patients(patient_id)



Alter TABLE payment_bills
add CONSTRAINT fk_payment_bills_prescription_id FOREIGN KEY(prescription_id)
REFERENCES
prescriptions(prescription_id)



Alter TABLE prescriptions
add CONSTRAINT fk_prescriptions_doctor_id FOREIGN KEY(doctor_id)
REFERENCES
doctors(doctor_id)



Alter TABLE prescriptions
add CONSTRAINT fk_prescriptions_patient_id FOREIGN KEY(patient_id)
REFERENCES
patients(patient_id)



Alter TABLE prescriptions
add CONSTRAINT fk_prescriptions_medicine_id FOREIGN KEY(medicine_id)
REFERENCES
medicines(medicine_id)



Alter TABLE labs
add CONSTRAINT fk_labs_patient_id FOREIGN KEY(patient_id)
REFERENCES
patients(patient_id)



Alter TABLE labs
add CONSTRAINT fk_labs_doctor_id FOREIGN KEY(doctor_id)
REFERENCES
doctors(doctor_id)



Alter TABLE labs
add CONSTRAINT fk_labs_lab_test_id FOREIGN KEY(lab_test_id)
REFERENCES
lab_tests(lab_test_id)



Alter TABLE in_patients
add CONSTRAINT fk_in_patients_patient_id FOREIGN KEY(patient_id)
REFERENCES
patients(patient_id)



Alter TABLE in_patients
add CONSTRAINT fk_in_patients_room_id FOREIGN KEY(room_id)
REFERENCES
rooms(room_id)



Alter TABLE in_patients
add CONSTRAINT fk_in_patients_lab_no FOREIGN KEY(lab_no)
REFERENCES
labs(lab_no)



Alter TABLE out_patients
add CONSTRAINT fk_out_patients_patient_id FOREIGN KEY(patient_id)
REFERENCES
patients(patient_id)



Alter TABLE out_patients
add CONSTRAINT fk_out_patients_lab_no FOREIGN KEY(lab_no)
REFERENCES
labs(lab_no)



Alter TABLE appointments
add CONSTRAINT fk_appointments_patient_id FOREIGN KEY(patient_id)
REFERENCES
patients(patient_id)



Alter TABLE appointments
add CONSTRAINT fk_appointments_doctor_id FOREIGN KEY(doctor_id)
REFERENCES
doctors(doctor_id)



Alter TABLE covid
add CONSTRAINT fk_covid_patient_id FOREIGN KEY(patient_id)
REFERENCES
patients(patient_id)




-- inserting values
go
INSERT INTO doctor_specialization(doctor_specialization_charge, doctor_specialization_name) VALUES
(100, 'Cardialogist'),
(130, 'Dentist'),
(80, 'Neurologist'),
(170, 'Oncologist'),
(80, 'Pediatrics'),
(130, 'Gastroenterologist');

GO
INSERT INTO doctors (doctor_firstname, doctor_lastname,doctor_specialization_id, doctor_age, doctor_gender, doctor_address) VALUES
('william', 'jack', 1, 52, 'Male', 'Arlington'),
('Thomas', 'Harry', 3, 40, 'Male', 'New York'),
('George', 'Jacob', 4, 42, 'Male', 'Herndon'),
('Albert', 'Henry', 2, 35, 'Male', 'Syracuse'),
('Paul', 'Isaac', 1, 38, 'Male', 'California'),
('Joshua', 'Little', 3,  45, 'Male', 'Austin'),
('Elyse', 'Perry', 6, 32,  'Female', 'Washington'),
('James', 'Anderson', 4, 38, 'Male', 'Buffalo'),
('Stuart', 'Broad', 4, 36, 'Male', 'Delaware'),
('Jane', 'Ava', 4, 41, 'Female', 'Rochester');

GO

INSERT INTO insurances (insurance_name, insurance_claim_percent) VALUES
('premium', 100),
('platinum', 75),
('gold', 50),
('silver', 25);

GO

INSERT INTO patients (doctor_id, insurance_id, patient_firstname, patient_lastname, patient_address, patient_age, patient_gender, patient_phone_number) VALUES
(2, 2, 'John', 'wick','Syracuse', 40, 'Male', '3156789123'),
(8, 4, 'Aishwarya', 'Rai', 'Buffalo', 30, 'Female', '4698654369'),
(4, 1, 'Pavan', 'kumar', 'Rochester', 25, 'Male', '3678912567'),
(2, 3,'Saket', 'Thombre', 'Syracuse', 22, 'Male', '4694567893'),
(9, 2, 'Jasmine', 'pinto', 'Syracuse', 45, 'Female', '3127428964'),
(3, 3, 'Rasim', 'salimov', 'Binghamton', 32, 'Male', '4567183917'),
(1, 4, 'Goutham', 'bikku', 'Syracuse', 19, 'Male', '3151234598');

GO

INSERT INTO medicines (medicine_name, medicine_price) VALUES
('dolo650', 10),
('dart', 12),
('tiban', 25),
('coldact', 6),
('saridon', 10),
('bcomplex', 5),
('vitaminc', 9),
('paracetomol', 8),
('losarton', 30),
('hydrocodone', 10),
('metformin', 15),
('antibiotics', 13),
('albuterol', 11);

GO

INSERT INTO prescriptions (doctor_id, patient_id, prescription_quantity, medicine_id) VALUES
(6, 4, 1, 12),
(8, 2, 3, 8),
(3, 7, 1, 10),
(9, 6, 1, 8),
(1, 1, 2, 2),
(1, 2, 3, 4),
(5, 6, 1, 9),
(10, 3, 1, 11),
(7, 1, 2, 13)

GO

INSERT INTO appointments (patient_id, doctor_id, appointment_date) VALUES
(4, 2, '2020/08/25'),
(7, 9, '2021/04/04'),
(6, 1, '2021/01/01'),
(5, 10, '2021/09/09'),
(2, 7, '2021/12/09'),
(3, 4, '2021/11/04')

GO

INSERT INTO lab_tests (lab_test_name, lab_test_price, lab_test_location) VALUES
('diabetes', 20, 'hospital'),
('thyroid', 30, 'hospital'),
('urine', 15, 'hospital'),
('lipid', 20, 'outside'),
('coagulation', 40, 'outside'),
('metabolic panel', 50, 'hospital'),
('complete blood picture', 30, 'hospital'),
('cardiac biomakers', 60, 'hospital')

GO

INSERT INTO covid (patient_id, covid_test_date, covid_result_date, covid_result) VALUES
(6, '2021/11/10', '2021/11/14', 'negative'),
(5, '2020/06/06', '2020/06/08', 'positive'),
(1, '2021/07/15', '2021/07/16', 'positive'),
(7, '2021/07/07', '2021/07/09', 'positive'),
(4, '2021/09/10', '2021/09/11', 'negative'),
(2, '2021/03/15', '2021/03/16', 'negative')

GO

INSERT INTO labs (patient_id, doctor_id, lab_test_id) VALUES
(3, 9, 8),
(5 ,6, 7),
(1, 2, 3),
(4, 5, 6),
(7, 8, 8),
(2, 4, 3)

GO

INSERT INTO rooms (room_type, room_status, room_count, room_charge) VALUES
('icu', 'available', 5, 500),
('general_ward', 'available', 20, 150),
('operation theatre', 'not_available',0, 400),
('maternity care', 'available', 8, 350),
('covid_rooms', 'available', 12, 550)

GO

INSERT INTO payment_methods (payment_method_name) VALUES
('wire transfer'),
('zelle'),
('apple pay'),
('google pay'),
('credit card'),
('pay pal')

GO

INSERT INTO in_patients (patient_id, room_id, lab_no, in_patient_date_of_admission) VALUES
(3, 4, 1, '2021/09/09'),
(6, 1, 6, '2021/12/12'),
(7, 5, 2, '2020/06/10'),
(5, 3, 4, '2021/11/17'),
(4, 2, 1, '2021/08/08')

GO

INSERT INTO out_patients (patient_id,  lab_no, out_patient_date_of_discharge) VALUES
(3, 1, '2021/09/16'),
(6, 6, '2021/12/14'),
(7, 2, '2020/06/12'),
(5, 4, '2021/11/18'),
(4, 1, '2021/08/15')

GO

INSERT INTO payment_bills (patient_id, payment_bill_amount, prescription_id, payment_method_id) VALUES
(4, 13, 1, 4 ),
(2, 24, 2, 1),
(7, 10, 3, 6),
(6, 8, 4, 5),
(1, 24, 5, 2)

-- view for patient medicine bill
--CREATE view customer_view AS
SELECT p.patient_firstname, p.patient_lastname, p.patient_phone_number, c.covid_result, pm.payment_bill_amount
from patients p
join payment_bills pm on p.patient_id = pm.patient_id 
join covid c on p.patient_id = c.patient_id

GO
--Data logics

DROP procedure if exists p_user_out
GO
create procedure p_user_out(
  @new_out_patient_date_of_discharge varchar(15),
  @new_patient_id INT,
  @new_lab_no int
) as BEGIN
if exists(select out_patient_date_of_discharge from
dbo.out_patients where out_patient_date_of_discharge = @new_out_patient_date_of_discharge)
BEGIN
Update dbo.out_patients
set patient_id=@new_patient_id,
out_patient_date_of_discharge = @new_out_patient_date_of_discharge WHERE
out_patient_date_of_discharge = @new_out_patient_date_of_discharge
return NULL
END
ELSE
BEGIN
print 'no discharge found'
insert into
dbo.out_patients(out_patient_date_of_discharge, patient_id, lab_no)
values(@new_out_patient_date_of_discharge, @new_patient_id, @new_lab_no)
return NULL
END
end

Exec p_user_out @new_out_patient_date_of_discharge='2021/03/14', @new_patient_id = '2', @new_lab_no = '3'

DROP procedure if exists p_user_in
GO
create procedure p_user_in(
  @news_in_patient_date_of_admission varchar(15),
  @news_patient_id INT,
  @news_lab_no INT,
  @news_room_id int
) as BEGIN
if exists (select in_patient_date_of_admission FROM
dbo.in_patients where in_patient_date_of_admission = @news_in_patient_date_of_admission)
BEGIN
update dbo.in_patients
set patient_id = @news_patient_id,
in_patient_date_of_admission = @news_in_patient_date_of_admission WHERE
 in_patient_date_of_admission = @news_in_patient_date_of_admission
 RETURN NULL
 END
 else
 BEGIN
 print 'no admit found'
 insert into
 dbo.in_patients(in_patient_date_of_admission, patient_id, lab_no, room_id)
 values(@news_in_patient_date_of_admission, @news_patient_id, @news_lab_no, @news_room_id)
 return NULL
 END
 END

 Exec p_user_in @news_in_patient_date_of_admission = '2021/06/13', @news_patient_id = '3', @news_lab_no = '1', @news_room_id = '1'
-- indexing

 Drop index if exists covid_index on covid
 create NONCLUSTERED INDEX covid_index
 on covid (covid_result)
 include(patient_id, covid_result_date, covid_test_date)

 select patient_id, covid_result_date, covid_test_date
 from covid
 where covid_result = 'negative' and patient_id = 2

 -- QUERIES

 select p.patient_id, p.patient_firstname + ' ' + p.patient_lastname as patient_name, p.patient_phone_number, c.covid_result
 from patients p
 join covid c on p.patient_id = c.patient_id
 where p.patient_id = 1 

 SELECT p.patient_id, p.patient_firstname + ' ' + p.patient_lastname as patient_name, i.room_id, i.in_patient_date_of_admission, p.doctor_id
 from patients p
 join in_patients i on p.patient_id = i.patient_id
 where i.room_id = 4

 SELECT p.patient_id,  p.patient_firstname + ' ' + p.patient_lastname as patient_name, pm.payment_bill_amount, p.patient_phone_number, p.patient_address
 from patients p
 join payment_bills pm on p.patient_id = pm.patient_id
 where pm.payment_bill_amount = 24

 



















































