

CREATE TABLE ACT_CO_DATABASECHANGELOGLOCK (ID int NOT NULL, LOCKED bit NOT NULL, LOCKGRANTED datetime2(3), LOCKEDBY nvarchar(255), CONSTRAINT PK_ACT_CO_DATABASECHANGELOGLOCK PRIMARY KEY (ID))

DELETE FROM ACT_CO_DATABASECHANGELOGLOCK

INSERT INTO ACT_CO_DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0)

UPDATE ACT_CO_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.68.111 (192.168.68.111)', LOCKGRANTED = '2021-12-28T10:52:24.117' WHERE ID = 1 AND LOCKED = 0

CREATE TABLE ACT_CO_DATABASECHANGELOG (ID nvarchar(255) NOT NULL, AUTHOR nvarchar(255) NOT NULL, FILENAME nvarchar(255) NOT NULL, DATEEXECUTED datetime2(3) NOT NULL, ORDEREXECUTED int NOT NULL, EXECTYPE nvarchar(10) NOT NULL, MD5SUM nvarchar(35), DESCRIPTION nvarchar(255), COMMENTS nvarchar(255), TAG nvarchar(255), LIQUIBASE nvarchar(20), CONTEXTS nvarchar(255), LABELS nvarchar(255), DEPLOYMENT_ID nvarchar(10))

CREATE TABLE ACT_CO_CONTENT_ITEM (ID_ varchar(255) NOT NULL, NAME_ varchar(255) NOT NULL, MIME_TYPE_ varchar(255), TASK_ID_ varchar(255), PROC_INST_ID_ varchar(255), CONTENT_STORE_ID_ varchar(255), CONTENT_STORE_NAME_ varchar(255), FIELD_ varchar(400), CONTENT_AVAILABLE_ bit CONSTRAINT DF_ACT_CO_CONTENT_ITEM_CONTENT_AVAILABLE_ DEFAULT 0, CREATED_ datetime, CREATED_BY_ varchar(255), LAST_MODIFIED_ datetime, LAST_MODIFIED_BY_ varchar(255), CONTENT_SIZE_ bigint CONSTRAINT DF_ACT_CO_CONTENT_ITEM_CONTENT_SIZE_ DEFAULT 0, TENANT_ID_ varchar(255), CONSTRAINT PK_ACT_CO_CONTENT_ITEM PRIMARY KEY (ID_))

CREATE NONCLUSTERED INDEX idx_contitem_taskid ON ACT_CO_CONTENT_ITEM(TASK_ID_)

CREATE NONCLUSTERED INDEX idx_contitem_procid ON ACT_CO_CONTENT_ITEM(PROC_INST_ID_)

INSERT INTO ACT_CO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'activiti', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', GETDATE(), 1, '8:7644d7165cfe799200a2abdd3419e8b6', 'createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM', '', 'EXECUTED', NULL, NULL, '4.3.5', '0685144194')

ALTER TABLE ACT_CO_CONTENT_ITEM ADD SCOPE_ID_ varchar(255)

ALTER TABLE ACT_CO_CONTENT_ITEM ADD SCOPE_TYPE_ varchar(255)

CREATE NONCLUSTERED INDEX idx_contitem_scope ON ACT_CO_CONTENT_ITEM(SCOPE_ID_, SCOPE_TYPE_)

INSERT INTO ACT_CO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', GETDATE(), 2, '8:fe7b11ac7dbbf9c43006b23bbab60bab', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', 'EXECUTED', NULL, NULL, '4.3.5', '0685144194')

UPDATE ACT_CO_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1
