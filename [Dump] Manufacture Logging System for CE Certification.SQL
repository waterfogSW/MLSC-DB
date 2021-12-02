
CREATE TABLE certification
(
	certification_no     INTEGER NOT NULL,
	welder               INTEGER NOT NULL,
	pv_code              INTEGER NOT NULL,
	expire_date          DATE NULL,
	cert_method          VARCHAR(20) NULL,
	report_no            INTEGER NOT NULL
);

ALTER TABLE certification
ADD CONSTRAINT XPK인증서 PRIMARY KEY (certification_no);

CREATE TABLE client
(
	client_no            INTEGER NOT NULL,
	client_name          VARCHAR(20) NULL,
	phone_number         VARCHAR(20) NULL,
	address              VARCHAR(20) NULL,
	email_address        VARCHAR(20) NULL
);

ALTER TABLE client
ADD CONSTRAINT XPK고객 PRIMARY KEY (client_no);

CREATE TABLE department
(
	department_code      INTEGER NOT NULL,
	department_name      VARCHAR(20) NULL
);

ALTER TABLE department
ADD CONSTRAINT XPK부서 PRIMARY KEY (department_code);

CREATE TABLE ecu
(
	ecu_sn               INTEGER NOT NULL,
	ecu_code             INTEGER NOT NULL
);

ALTER TABLE ecu
ADD CONSTRAINT XPK제어장치 PRIMARY KEY (ecu_sn);

CREATE TABLE ecu_design
(
	ecu_code             INTEGER NOT NULL,
	width                INTEGER NULL,
	height               INTEGER NULL,
	thickness            VARCHAR(20) NULL,
	weight               INTEGER NULL
);

ALTER TABLE ecu_design
ADD CONSTRAINT XPK제어장치_설계 PRIMARY KEY (ecu_code);

CREATE TABLE Edge_test
(
	Edge_tn              INTEGER NOT NULL,
	seam_no              INTEGER NULL,
	measuring_spec_1     FLOAT NULL,
	measuring_spec_2     INTEGER NULL,
	measuring_spec_3     INTEGER NULL,
	measuring_spec_4     CHAR(18) NULL,
	edge_test_result     VARCHAR(20) NULL,
	edge_test_date       DATE NULL,
	pv_sn                INTEGER NOT NULL,
	dwg_no               INTEGER NULL,
	edge_test_pic        INTEGER NOT NULL
);

ALTER TABLE Edge_test
ADD CONSTRAINT XPKEdge_검사 PRIMARY KEY (Edge_tn);

CREATE TABLE employee
(
	employee_no          INTEGER NOT NULL,
	department_code      INTEGER NOT NULL,
	employee_name        VARCHAR(20) NULL,
	employee_rank        VARCHAR(20) NULL,
	birth_date           DATE NULL,
	entry_date           DATE NULL
);

ALTER TABLE employee
ADD CONSTRAINT XPK직원 PRIMARY KEY (employee_no);

CREATE TABLE item
(
	item_sn              INTEGER NOT NULL,
	ecu_sn               INTEGER NOT NULL,
	pv_sn                INTEGER NOT NULL
);

ALTER TABLE item
ADD CONSTRAINT XPK제품 PRIMARY KEY (item_sn);

CREATE TABLE item_design
(
	item_code            INTEGER NOT NULL,
	pv_code              INTEGER NOT NULL,
	ecu_code             INTEGER NOT NULL,
	price                VARCHAR(20) NULL,
	item_name            VARCHAR(20) NULL
);

ALTER TABLE item_design
ADD CONSTRAINT XPK제품_설계 PRIMARY KEY (item_code);

CREATE TABLE order_detail
(
	item_no              INTEGER NOT NULL,
	order_quantity       INTEGER NULL,
	order_detail_no      INTEGER NOT NULL,
	order_no             INTEGER NOT NULL
);

ALTER TABLE order_detail
ADD CONSTRAINT XPK주문_내역 PRIMARY KEY (order_detail_no);

CREATE TABLE order_list
(
	order_no             INTEGER NOT NULL,
	client_no            INTEGER NOT NULL,
	order_pic            INTEGER NOT NULL,
	order_date           DATE NULL,
	deadline_date        DATE NULL
);

ALTER TABLE order_list
ADD CONSTRAINT XPK주문 PRIMARY KEY (order_no);

CREATE TABLE plate_test_report
(
	report_no            INTEGER NOT NULL,
	welding_type         INTEGER NULL,
	welding_point        INTEGER NULL,
	plage_test_date      DATE NULL,
	plage_test_method    VARCHAR(20) NULL,
	plage_test_result    VARCHAR(20) NULL,
	welding_metarial     VARCHAR(20) NULL,
	welding_method       VARCHAR(20) NULL,
	welding_posture      VARCHAR(20) NULL,
	welder               INTEGER NOT NULL
);

ALTER TABLE plate_test_report
ADD CONSTRAINT XPK용접시편_검사_결과서 PRIMARY KEY (report_no);

CREATE TABLE Pressure_test
(
	Pressure_tn          INTEGER NOT NULL,
	pressure_test_pic    INTEGER NOT NULL,
	pv_test_date         DATE NULL,
	dwg_no               INTEGER NULL,
	pressure_test_type   VARCHAR(20) NULL,
	pressure_test_result VARCHAR(20) NULL,
	pv_sn                INTEGER NOT NULL
);

ALTER TABLE Pressure_test
ADD CONSTRAINT XPKPressure_검사 PRIMARY KEY (Pressure_tn);

CREATE TABLE pressure_vessel
(
	pv_sn                INTEGER NOT NULL,
	welder               INTEGER NOT NULL,
	pv_code              INTEGER NOT NULL
);

ALTER TABLE pressure_vessel
ADD CONSTRAINT XPK압력용기 PRIMARY KEY (pv_sn);

CREATE TABLE pv_design
(
	pv_code              INTEGER NOT NULL,
	material             VARCHAR(20) NULL,
	width                INTEGER NULL,
	height               INTEGER NULL,
	thickness            INTEGER NULL,
	weight               INTEGER NULL
);

ALTER TABLE pv_design
ADD CONSTRAINT XPK압력용기_설계 PRIMARY KEY (pv_code);

CREATE TABLE RT_test
(
	rt_tn                INTEGER NOT NULL,
	rt_test_pic          INTEGER NOT NULL,
	shooting_position    VARCHAR(20) NULL,
	shooting_view        VARCHAR(20) NULL,
	x_ray_equipment      VARCHAR(20) NULL,
	devlopment_tmp       FLOAT NULL,
	devlopment_time      TIME NULL,
	lead_backing         boolean NULL,
	rt_test_result       VARCHAR(20) NULL,
	rt_test_date         DATE NULL,
	pv_sn                INTEGER NOT NULL
);

ALTER TABLE RT_test
ADD CONSTRAINT XPKRT_검사 PRIMARY KEY (rt_tn);

CREATE TABLE shipment
(
	shipment_no          INTEGER NOT NULL,
	order_no             INTEGER NOT NULL,
	shipment_date        DATE NULL,
	shipment_pic         INTEGER NOT NULL
);

ALTER TABLE shipment
ADD CONSTRAINT XPK출하 PRIMARY KEY (shipment_no);

CREATE TABLE shipment_detail
(
	shipment_detail_no   INTEGER NOT NULL,
	shipment_no          INTEGER NOT NULL,
	shipment_quantity    INTEGER NULL
);

ALTER TABLE shipment_detail
ADD CONSTRAINT XPK출하_내역 PRIMARY KEY (shipment_detail_no);

CREATE TABLE shipment_report
(
	shipment_report_no   INTEGER NOT NULL,
	shipment_detail_no   INTEGER NOT NULL,
	item_sn              INTEGER NOT NULL,
	check_pic            INTEGER NOT NULL
);

ALTER TABLE shipment_report
ADD CONSTRAINT XPK출하_성적서 PRIMARY KEY (shipment_report_no);

CREATE TABLE welder_test_reception
(
	receipt_no           INTEGER NOT NULL,
	report_no            INTEGER NOT NULL,
	cert_pic             INTEGER NOT NULL,
	cert_org_name        VARCHAR(20) NULL,
	reception_date       DATE NULL
);

ALTER TABLE welder_test_reception
ADD CONSTRAINT XPK용접사_자격_시험_접수서 PRIMARY KEY (receipt_no);

ALTER TABLE certification
ADD CONSTRAINT R_38 FOREIGN KEY (welder) REFERENCES employee (employee_no);

ALTER TABLE certification
ADD CONSTRAINT R_83 FOREIGN KEY (pv_code) REFERENCES pv_design (pv_code);

ALTER TABLE certification
ADD CONSTRAINT R_81 FOREIGN KEY (report_no) REFERENCES plate_test_report (report_no);

ALTER TABLE ecu
ADD CONSTRAINT R_27 FOREIGN KEY (ecu_code) REFERENCES ecu_design (ecu_code);

ALTER TABLE Edge_test
ADD CONSTRAINT R_55 FOREIGN KEY (pv_sn) REFERENCES pressure_vessel (pv_sn);

ALTER TABLE Edge_test
ADD CONSTRAINT R_45 FOREIGN KEY (edge_test_pic) REFERENCES employee (employee_no);

ALTER TABLE employee
ADD CONSTRAINT R_40 FOREIGN KEY (department_code) REFERENCES department (department_code);

ALTER TABLE item
ADD CONSTRAINT R_22 FOREIGN KEY (ecu_sn) REFERENCES ecu (ecu_sn);

ALTER TABLE item
ADD CONSTRAINT R_60 FOREIGN KEY (pv_sn) REFERENCES pressure_vessel (pv_sn);

ALTER TABLE item_design
ADD CONSTRAINT R_8 FOREIGN KEY (pv_code) REFERENCES pv_design (pv_code);

ALTER TABLE item_design
ADD CONSTRAINT R_9 FOREIGN KEY (ecu_code) REFERENCES ecu_design (ecu_code);

ALTER TABLE order_detail
ADD CONSTRAINT R_25 FOREIGN KEY (item_no) REFERENCES item_design (item_code);

ALTER TABLE order_detail
ADD CONSTRAINT R_47 FOREIGN KEY (order_no) REFERENCES order_list (order_no);

ALTER TABLE order_list
ADD CONSTRAINT R_19 FOREIGN KEY (client_no) REFERENCES client (client_no);

ALTER TABLE order_list
ADD CONSTRAINT R_44 FOREIGN KEY (order_pic) REFERENCES employee (employee_no);

ALTER TABLE plate_test_report
ADD CONSTRAINT R_57 FOREIGN KEY (welder) REFERENCES employee (employee_no);

ALTER TABLE Pressure_test
ADD CONSTRAINT R_48 FOREIGN KEY (pressure_test_pic) REFERENCES employee (employee_no);

ALTER TABLE Pressure_test
ADD CONSTRAINT R_56 FOREIGN KEY (pv_sn) REFERENCES pressure_vessel (pv_sn);

ALTER TABLE pressure_vessel
ADD CONSTRAINT R_50 FOREIGN KEY (welder) REFERENCES employee (employee_no);

ALTER TABLE pressure_vessel
ADD CONSTRAINT R_62 FOREIGN KEY (pv_code) REFERENCES pv_design (pv_code);

ALTER TABLE RT_test
ADD CONSTRAINT R_82 FOREIGN KEY (rt_test_pic) REFERENCES employee (employee_no);

ALTER TABLE RT_test
ADD CONSTRAINT R_54 FOREIGN KEY (pv_sn) REFERENCES pressure_vessel (pv_sn);

ALTER TABLE shipment
ADD CONSTRAINT R_37 FOREIGN KEY (order_no) REFERENCES order_list (order_no);

ALTER TABLE shipment
ADD CONSTRAINT R_46 FOREIGN KEY (shipment_pic) REFERENCES employee (employee_no);

ALTER TABLE shipment_detail
ADD CONSTRAINT R_39 FOREIGN KEY (shipment_no) REFERENCES shipment (shipment_no);

ALTER TABLE shipment_report
ADD CONSTRAINT R_49 FOREIGN KEY (shipment_detail_no) REFERENCES shipment_detail (shipment_detail_no);

ALTER TABLE shipment_report
ADD CONSTRAINT R_64 FOREIGN KEY (item_sn) REFERENCES item (item_sn);

ALTER TABLE shipment_report
ADD CONSTRAINT R_43 FOREIGN KEY (check_pic) REFERENCES employee (employee_no);

ALTER TABLE welder_test_reception
ADD CONSTRAINT R_28 FOREIGN KEY (report_no) REFERENCES plate_test_report (report_no);

ALTER TABLE welder_test_reception
ADD CONSTRAINT R_31 FOREIGN KEY (cert_pic) REFERENCES employee (employee_no);
