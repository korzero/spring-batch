-- Autogenerated: do not edit this file

DROP TABLE  BATCH_EXECUTION_CONTEXT ;
DROP TABLE  BATCH_STEP_EXECUTION ;
DROP TABLE  BATCH_JOB_EXECUTION ;
DROP TABLE  BATCH_JOB_PARAMS ;
DROP TABLE  BATCH_JOB_INSTANCE ;

DROP TABLE  BATCH_STEP_EXECUTION_SEQ ;
DROP TABLE  BATCH_JOB_EXECUTION_SEQ ;
DROP TABLE  BATCH_JOB_SEQ ;

CREATE TABLE BATCH_JOB_INSTANCE  (
	JOB_INSTANCE_ID BIGINT  NOT NULL PRIMARY KEY ,  
	VERSION BIGINT NULL,  
	JOB_NAME VARCHAR(100) NOT NULL, 
	JOB_KEY VARCHAR(2500) NULL
) ;

CREATE TABLE BATCH_JOB_EXECUTION  (
	JOB_EXECUTION_ID BIGINT  NOT NULL PRIMARY KEY ,
	VERSION BIGINT  NULL,  
	JOB_INSTANCE_ID BIGINT NOT NULL,
	CREATE_TIME DATETIME NOT NULL,
	START_TIME DATETIME DEFAULT NULL NULL, 
	END_TIME DATETIME DEFAULT NULL NULL,
	STATUS VARCHAR(10) NULL,
	CONTINUABLE CHAR(1) NULL,
	EXIT_CODE VARCHAR(20) NULL,
	EXIT_MESSAGE VARCHAR(2500) NULL,
	LAST_UPDATED DATETIME,
	constraint JOB_INST_EXEC_FK foreign key (JOB_INSTANCE_ID)
	references BATCH_JOB_INSTANCE(JOB_INSTANCE_ID)
) ;
	
CREATE TABLE BATCH_JOB_PARAMS  (
	JOB_INSTANCE_ID BIGINT NOT NULL ,
	TYPE_CD VARCHAR(6) NOT NULL ,
	KEY_NAME VARCHAR(100) NOT NULL , 
	STRING_VAL VARCHAR(250) NULL, 
	DATE_VAL DATETIME DEFAULT NULL NULL,
	LONG_VAL BIGINT NULL,
	DOUBLE_VAL DOUBLE PRECISION NULL,
	constraint JOB_INST_PARAMS_FK foreign key (JOB_INSTANCE_ID)
	references BATCH_JOB_INSTANCE(JOB_INSTANCE_ID)
) ;
	
CREATE TABLE BATCH_STEP_EXECUTION  (
	STEP_EXECUTION_ID BIGINT  NOT NULL PRIMARY KEY ,
	VERSION BIGINT NOT NULL,  
	STEP_NAME VARCHAR(100) NOT NULL,
	JOB_EXECUTION_ID BIGINT NOT NULL,
	START_TIME DATETIME NOT NULL , 
	END_TIME DATETIME DEFAULT NULL NULL,  
	STATUS VARCHAR(10) NULL,
	COMMIT_COUNT BIGINT NULL, 
	ITEM_COUNT BIGINT NULL,
	READ_SKIP_COUNT BIGINT NULL,
	WRITE_SKIP_COUNT BIGINT NULL,
	ROLLBACK_COUNT BIGINT NULL, 
	CONTINUABLE CHAR(1) NULL,
	EXIT_CODE VARCHAR(20) NULL,
	EXIT_MESSAGE VARCHAR(2500) NULL,
	LAST_UPDATED DATETIME,
	constraint JOB_EXEC_STEP_FK foreign key (JOB_EXECUTION_ID)
	references BATCH_JOB_EXECUTION(JOB_EXECUTION_ID)
) ;

CREATE TABLE BATCH_EXECUTION_CONTEXT  (
	EXECUTION_ID BIGINT NOT NULL,
	DISCRIMINATOR VARCHAR(1) NOT NULL,
	TYPE_CD VARCHAR(6) NOT NULL,
	KEY_NAME VARCHAR(1000) NOT NULL, 
	STRING_VAL VARCHAR(1000) NULL, 
	DATE_VAL DATETIME DEFAULT NULL,
	LONG_VAL BIGINT NULL,
	DOUBLE_VAL DOUBLE PRECISION NULL,
	OBJECT_VAL IMAGE NULL
) ;

CREATE TABLE BATCH_STEP_EXECUTION_SEQ (ID BIGINT IDENTITY);
CREATE TABLE BATCH_JOB_EXECUTION_SEQ (ID BIGINT IDENTITY);
CREATE TABLE BATCH_JOB_SEQ (ID BIGINT IDENTITY);
