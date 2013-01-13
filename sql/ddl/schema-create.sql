-- schema creating script
--

create table GSU_PLATFORM
(
  ID              NUMBER(12) NOT NULL,
  PLATFORM_NAME   VARCHAR2(80 CHAR) NOT NULL,
  CHANGED_DTTM    DATE DEFAULT SYSDATE NOT NULL,
  CHANGED_USER    VARCHAR2(200 CHAR) NOT NULL,
  ACTIVE          NUMBER(1) DEFAULT 1 NOT NULL,
  DESCRIPTION     VARCHAR2(1000 CHAR),
  constraint gsu_platform_pk primary key (ID),
  constraint gsu_platform_unique UNIQUE (PLATFORM_NAME)
)
/
create table GSU_VENDOR
(
  ID              NUMBER(12) NOT NULL,
  VENDOR_NAME     VARCHAR2(80 CHAR) NOT NULL,
  CHANGED_DTTM    DATE DEFAULT SYSDATE NOT NULL,
  CHANGED_USER    VARCHAR2(200 CHAR) NOT NULL,
  ACTIVE          NUMBER(1) DEFAULT 1 NOT NULL,
  URL             VARCHAR2(1000 CHAR),
  DESCRIPTION     VARCHAR2(1000 CHAR),
  constraint gsu_vendor_pk primary key (ID),
  constraint gsu_vendor_unique UNIQUE (VENDOR_NAME)
)
/
create table GSU_PRODUCT
(
  ID              NUMBER(12) NOT NULL,
  PLATFORM_ID     NUMBER(12) NOT NULL,
  VENDOR_ID       NUMBER(12) NOT NULL,
  PRODUCT_NAME    VARCHAR2(80 CHAR) NOT NULL,
  ACTIVE          NUMBER(1) DEFAULT 1 NOT NULL,
  CHANGED_DTTM    DATE DEFAULT SYSDATE NOT NULL,
  CHANGED_USER    VARCHAR2(200 CHAR) NOT NULL,
  DESCRIPTION     VARCHAR2(1000 CHAR),
  HOW_TO              CLOB, 
  LICENSING           CLOB,
  PRODUCT_INFORMATION CLOB,
  SLA                 CLOB,
  OTHERS              CLOB,
  constraint gsu_product_pk primary key (ID),
  constraint gsu_product_platform_fk foreign key (PLATFORM_ID) references GSU_PLATFORM (ID),
  constraint gsu_product_vendor_fk   foreign key (VENDOR_ID)   references GSU_VENDOR   (ID),
  constraint gsu_product_unique      UNIQUE (PRODUCT_NAME)
)
/
create table GSU_VERSION
(
  ID              NUMBER(12) NOT NULL,
  PRODUCT_ID      NUMBER(12) NOT NULL,
  VERSION_NAME    VARCHAR2(200 CHAR) NOT NULL,
  RELEASE_DATE    DATE,
  EOS_DATE        DATE,
  EOS_INFO        VARCHAR2(1000 CHAR),
  ACTIVE          NUMBER(1) DEFAULT 1 NOT NULL,
  SUPPORT_STATUS  VARCHAR2(20 CHAR),
  CHANGED_DTTM    DATE DEFAULT SYSDATE NOT NULL,
  CHANGED_USER    VARCHAR2(200 CHAR) NOT NULL,
  DESCRIPTION     VARCHAR2(1000 CHAR),
  UPDATE_PLAN     VARCHAR2(1000 CHAR),
  SWAP_PLAN       VARCHAR2(1000 CHAR),
  constraint gsu_version_pk primary key (ID),
  constraint gsu_version_product_fk foreign key (PRODUCT_ID) references GSU_PRODUCT (ID),
  constraint gsu_version_unique     UNIQUE (PRODUCT_ID, VERSION_NAME)
)
/
create table GSU_OPCO
(
  ID              NUMBER(12) NOT NULL,
  OPCO_NAME       VARCHAR2(200 CHAR) NOT NULL,
  ACTIVE          NUMBER(1) DEFAULT 1 NOT NULL,
  CHANGED_DTTM    DATE DEFAULT SYSDATE NOT NULL,
  CHANGED_USER    VARCHAR2(200 CHAR) NOT NULL,
  DESCRIPTION     VARCHAR2(1000 CHAR),
  constraint gsu_opco_pk primary key (ID),
  constraint gsu_opco_unique     UNIQUE (OPCO_NAME)
)
/
create table GSU_OPCO_VERSION
(
  ID              NUMBER(12) NOT NULL,
  OPCO_ID         NUMBER(12) NOT NULL,
  VERSION_ID      NUMBER(12) NOT NULL,
  VERSION_BUILD   VARCHAR2(200 CHAR),
  UPDATE_PLAN     VARCHAR2(1000 CHAR),
  SWAP_PLAN       VARCHAR2(1000 CHAR),
  COMMENTS        VARCHAR2(1000 CHAR),
  ACTIVE          NUMBER(1) DEFAULT 1 NOT NULL,
  CHANGED_DTTM    DATE DEFAULT SYSDATE NOT NULL,
  CHANGED_USER    VARCHAR2(200 CHAR) NOT NULL,
  constraint gsu_opco_version_pk primary key (ID),
  constraint gsu_opco_version_version_fk  foreign key (VERSION_ID)  references GSU_VERSION (ID),
  constraint gsu_opco_version_opco_fk     foreign key (OPCO_ID)     references GSU_OPCO (ID)
)
/
create table GSU_CONTACT
(
  ID                NUMBER(12) NOT NULL,
  LOGON             VARCHAR2(200 CHAR) NULL,
  FIRST_NAME        VARCHAR2(200 CHAR) NULL,
  LAST_NAME         VARCHAR2(200 CHAR) NULL,
  CATEGORY          VARCHAR2( 50 CHAR) NULL,
  ORGANISATION      VARCHAR2(200 CHAR) NULL,
  ORGANISATION_SUB  VARCHAR2(200 CHAR) NULL,
  POSITION          VARCHAR2(200 CHAR) NULL,
  MOBILE_PHONE      VARCHAR2(200 CHAR) NULL,
  FIX_PHONE         VARCHAR2(200 CHAR) NULL,
  FAX_PHONE         VARCHAR2(200 CHAR) NULL,
  EMAIL_ADDRESS     VARCHAR2(200 CHAR) NULL,
  ADDRESS_LINE1     VARCHAR2(200 CHAR) NULL,
  ADDRESS_LINE2     VARCHAR2(200 CHAR) NULL,
  ADDRESS_LINE3     VARCHAR2(200 CHAR) NULL,
  ZIP_CODE          VARCHAR2( 10 CHAR) NULL,
  CITY              VARCHAR2(200 CHAR) NULL,
  COUNTRY           VARCHAR2(200 CHAR) NULL,
  NOTE              VARCHAR2(1000 CHAR) NULL,
  CHANGED_DTTM      DATE DEFAULT SYSDATE NOT NULL,
  CHANGED_USER      VARCHAR2(200 CHAR) NOT NULL,
  constraint gsu_contact_pk primary key (ID)
)
/
create table GSU_OPCO_CONTACT
(
  ID                NUMBER(12) NOT NULL,
  OPCO_ID           NUMBER(12) NOT NULL,
  CONTACT_ID        NUMBER(12) NOT NULL,
  NOTE              VARCHAR2(200 CHAR) NULL,
  CHANGED_DTTM      DATE DEFAULT SYSDATE NOT NULL,
  CHANGED_USER      VARCHAR2(200 CHAR) NOT NULL,
  constraint gsu_opco_contact_pk primary key (ID),
  constraint gsu_opco_contact_contact_fk  foreign key (CONTACT_ID)  references GSU_CONTACT (ID),
  constraint gsu_opco_contact_opco_fk     foreign key (OPCO_ID)     references GSU_OPCO (ID),
  constraint gsu_opco_contact_unique      UNIQUE (OPCO_ID, CONTACT_ID)
)
/
create table GSU_VENDOR_CONTACT
(
  ID                NUMBER(12) NOT NULL,
  VENDOR_ID         NUMBER(12) NOT NULL,
  CONTACT_ID        NUMBER(12) NOT NULL,
  ESCALATION_LEVEL  VARCHAR2(20 CHAR),
  NOTE              VARCHAR2(200 CHAR) NULL,
  CHANGED_DTTM      DATE DEFAULT SYSDATE NOT NULL,
  CHANGED_USER      VARCHAR2(200 CHAR) NOT NULL,
  constraint gsu_vendor_contact_pk primary key (ID),
  constraint gsu_vendor_contact_contact_fk  foreign key (CONTACT_ID)  references GSU_CONTACT (ID),
  constraint gsu_vendor_contact_vendor_fk   foreign key (VENDOR_ID)   references GSU_VENDOR (ID),
  constraint gsu_vendor_contact_unique      UNIQUE (VENDOR_ID, CONTACT_ID)
)
/
create table GSU_PRODUCT_CONTACT
(
  ID                NUMBER(12) NOT NULL,
  PRODUCT_ID        NUMBER(12) NOT NULL,
  CONTACT_ID        NUMBER(12) NOT NULL,
  ESCALATION_LEVEL  VARCHAR2(20 CHAR),
  NOTE              VARCHAR2(200 CHAR) NULL,
  CHANGED_DTTM      DATE DEFAULT SYSDATE NOT NULL,
  CHANGED_USER      VARCHAR2(200 CHAR) NOT NULL,
  constraint gsu_product_contact_pk primary key (ID),
  constraint gsu_product_contact_contact_fk  foreign key (CONTACT_ID)  references GSU_CONTACT (ID),
  constraint gsu_product_contact_product_fk  foreign key (PRODUCT_ID)  references GSU_PRODUCT (ID),
  constraint gsu_product_contact_unique      UNIQUE (PRODUCT_ID, CONTACT_ID)
)
/
CREATE SEQUENCE GSU_ID_SEQ
	INCREMENT BY 1
	START WITH 100
	NOMAXVALUE
	NOMINVALUE
	NOCYCLE
	NOORDER
/
CREATE OR REPLACE TRIGGER "DEV1_H3G"."GSU_PRODUCT_INSERT_ID" before insert on GSU_PRODUCT for each row begin
  if :new.id < 0 or :new.id is null then
    select gsu_id_seq.nextval into :new.id from dual;
  end if;
end;
/
CREATE OR REPLACE TRIGGER "DEV1_H3G"."GSU_PLATFORM_INSERT_ID" before insert on GSU_PLATFORM for each row begin
  if :new.id < 0 or :new.id is null then
    select gsu_id_seq.nextval into :new.id from dual;
  end if;
end;
/
CREATE OR REPLACE TRIGGER "DEV1_H3G"."GSU_VENDOR_INSERT_ID" before insert on GSU_VENDOR for each row begin
  if :new.id < 0 or :new.id is null then
    select gsu_id_seq.nextval into :new.id from dual;
  end if;
end;
/
CREATE OR REPLACE TRIGGER "DEV1_H3G"."GSU_VERSION_INSERT_ID" before insert on GSU_VERSION for each row begin
  if :new.id < 0 or :new.id is null then
    select gsu_id_seq.nextval into :new.id from dual;
  end if;
end;
/
CREATE OR REPLACE TRIGGER "DEV1_H3G"."GSU_OPCO_INSERT_ID" before insert on GSU_OPCO for each row begin
  if :new.id < 0 or :new.id is null then
    select gsu_id_seq.nextval into :new.id from dual;
  end if;
end;
/
CREATE OR REPLACE TRIGGER "DEV1_H3G"."GSU_OPCO_VERSION_INSERT_ID" before insert on GSU_OPCO_VERSION for each row begin
  if :new.id < 0 or :new.id is null then
    select gsu_id_seq.nextval into :new.id from dual;
  end if;
end;
/
CREATE OR REPLACE TRIGGER "DEV1_H3G"."GSU_CONTACT_INSERT_ID" before insert on GSU_CONTACT for each row begin
  if :new.id < 0 or :new.id is null then
    select gsu_id_seq.nextval into :new.id from dual;
  end if;
end;
/
CREATE OR REPLACE TRIGGER "DEV1_H3G"."GSU_OPCO_CONTACT_INSERT_ID" before insert on GSU_OPCO_CONTACT for each row begin
  if :new.id < 0 or :new.id is null then
    select gsu_id_seq.nextval into :new.id from dual;
  end if;
end;
/
CREATE OR REPLACE TRIGGER "DEV1_H3G"."GSU_VENDOR_CONTACT_INSERT_ID" before insert on GSU_VENDOR_CONTACT for each row begin
  if :new.id < 0 or :new.id is null then
    select gsu_id_seq.nextval into :new.id from dual;
  end if;
end;
/
CREATE OR REPLACE TRIGGER "DEV1_H3G"."GSU_PRODUCT_CONTACT_INSERT_ID" before insert on GSU_PRODUCT_CONTACT for each row begin
  if :new.id < 0 or :new.id is null then
    select gsu_id_seq.nextval into :new.id from dual;
  end if;
end;
/
