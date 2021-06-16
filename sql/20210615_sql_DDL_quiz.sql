-- 2021.06.15

-- DDL

create table phoneInfo_basic(
idx NUMBER(6) constraint pi_basic_idx_PK primary key,
fr_name VARCHAR2(20) NOT NULL,
fr_phonenumber VARCHAR2(20) NOT NULL,
fr_email VARCHAR2(20),
fr_address VARCHAR2(20),
fr_regdate DATE default sysdate
);

create table phoneInfo_univ(
idx NUMBER(6) ,
fr_u_major VARCHAR2(20) default 'N' NOT NULL,
fr_u_year NUMBER(1) default 1 NOT NULL,
fr_ref NUMBER(7) NOT NULL ,
constraint pi_univ_idx_PK primary key(idx),
constraint chk check (fr_u_year between 1 and 4),
constraint pi_univ_ref_FK FOREIGN KEY (fr_ref) REFERENCES phoneInfo_basic (idx)
);

create table phoneInfo_com(
idx NUMBER(6) constraint pi_com_idx_PK primary key,
fr_c_company VARCHAR2(20) default 'N' NOT NULL,
fr_ref NUMBER(6) NOT NULL constraint pi_com_ref_FK REFERENCES phoneInfo_basic (idx)
);