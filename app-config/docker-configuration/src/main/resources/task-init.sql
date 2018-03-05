-- Create Database Lock Table
CREATE TABLE public.db_changelog_locks (ID INT NOT NULL, LOCKED BOOLEAN NOT NULL, LOCKGRANTED TIMESTAMP WITH TIME ZONE, LOCKEDBY VARCHAR(255), CONSTRAINT PK_DB_CHANGELOG_LOCKS PRIMARY KEY (ID));

-- Initialize Database Lock Table
DELETE FROM public.db_changelog_locks;

INSERT INTO public.db_changelog_locks (ID, LOCKED) VALUES (1, FALSE);

-- Lock Database
-- Create Database Change Log Table
CREATE TABLE public.db_changelogs (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED TIMESTAMP WITH TIME ZONE NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35), DESCRIPTION VARCHAR(255), COMMENTS VARCHAR(255), TAG VARCHAR(255), LIQUIBASE VARCHAR(20));

-- Create Database Lock Table
CREATE TABLE public.db_changelog_locks (ID INT NOT NULL, LOCKED BOOLEAN NOT NULL, LOCKGRANTED TIMESTAMP WITH TIME ZONE, LOCKEDBY VARCHAR(255), CONSTRAINT PK_DB_CHANGELOG_LOCKS PRIMARY KEY (ID));

-- Initialize Database Lock Table
DELETE FROM public.db_changelog_locks;

INSERT INTO public.db_changelog_locks (ID, LOCKED) VALUES (1, FALSE);

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::initial::Kinetic Data
UPDATE public.db_changelogs SET TAG = 'initial' WHERE DATEEXECUTED = (SELECT MAX(DATEEXECUTED) FROM public.db_changelogs);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE, TAG) VALUES ('initial', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 1, '7:bc13c73f8d1d2e65939e19085861b005', 'tagDatabase', '', 'EXECUTED', '3.1.1', 'initial');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-1::Kinetic Data
CREATE TABLE public.application_properties (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), name VARCHAR(128) NOT NULL, type_column VARCHAR(64), value_column TEXT, CONSTRAINT pk__application_prop__2ce95795 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-1', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 2, '7:9aabfc230b5bd555c3100562e56fe39c', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-2::Kinetic Data
CREATE TABLE public.categories (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), description TEXT, name VARCHAR(128) NOT NULL, CONSTRAINT pk__categories__2ed1a007 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-2', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 3, '7:9cdbab66373fdf0b59c2f36c0180656f', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-3::Kinetic Data
CREATE TABLE public.categories_handlers (task_handler_id BIGINT NOT NULL, category_id BIGINT NOT NULL);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-3', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 4, '7:87a9606881440e33252d05fdcd292aa7', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-4::Kinetic Data
CREATE TABLE public.categories_policy_rules (policy_rule_id BIGINT NOT NULL, category_id BIGINT NOT NULL);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-4', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 5, '7:64119e7d5ae2c8abfd1d49ae96de17c8', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-5::Kinetic Data
CREATE TABLE public.categories_trees (tree_id BIGINT NOT NULL, category_id BIGINT NOT NULL);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-5', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 6, '7:2682f5e798448bf646ae0c2f05ce0ccd', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-6::Kinetic Data
CREATE TABLE public.console_policy_rules (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), console_name VARCHAR(128) NOT NULL, policy_rule_id BIGINT NOT NULL, CONSTRAINT pk__console_policy_r__33965524 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-6', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 7, '7:05a8a334894f3a0ab4d8f86ba3afb21f', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-7::Kinetic Data
CREATE TABLE public.executions (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), inputs TEXT, originating_execution_id BIGINT, source_id VARCHAR(128), token VARCHAR(128), parent_execution_id BIGINT, tree_id BIGINT NOT NULL, source_data_id BIGINT, CONSTRAINT pk__executions__357e9d96 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-7', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 8, '7:6bdd743edb06b55e3a2e976e2176814d', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-8::Kinetic Data
CREATE TABLE public.groups (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), name VARCHAR(128) NOT NULL, CONSTRAINT pk__groups__3766e608 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-8', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 9, '7:0eacc2454e0f55d8198cb01efc69e9ee', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-9::Kinetic Data
CREATE TABLE public.groups_users (user_id BIGINT NOT NULL, group_id BIGINT NOT NULL);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-9', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 10, '7:738828f41224e5b11e438752780c57ca', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-10::Kinetic Data
CREATE TABLE public.policy_rules (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), message TEXT NOT NULL, name VARCHAR(128) NOT NULL, rule_column TEXT NOT NULL, type_column VARCHAR(64) NOT NULL, CONSTRAINT pk__policy_rules__3a4352b3 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-10', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 11, '7:83b73da27b4cd1c61d87c6912d74a61a', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-11::Kinetic Data
CREATE TABLE public.source_root_properties (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), description VARCHAR(2000), is_required BOOLEAN NOT NULL, name VARCHAR(128) NOT NULL, type_column VARCHAR(64), value_column TEXT, source_root_id BIGINT NOT NULL, CONSTRAINT pk__source_root_prop__3c2b9b25 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-11', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 12, '7:3e3ef2c4056633e55c94ba646526543b', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-12::Kinetic Data
CREATE TABLE public.source_roots (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), active BOOLEAN NOT NULL, deactivated_at TIMESTAMP WITH TIME ZONE NOT NULL, name VARCHAR(128) NOT NULL, type_column VARCHAR(64) NOT NULL, CONSTRAINT pk__source_roots__3e13e397 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-12', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 13, '7:90f59ad60e1e1e4c40783eb3b29a9fc9', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-13::Kinetic Data
CREATE TABLE public.source_roots_policy_rules (source_root_id BIGINT NOT NULL, policy_rule_id BIGINT NOT NULL);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-13', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 14, '7:976a679234dd7e5f7be5f684f1a0bc0b', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-14::Kinetic Data
CREATE TABLE public.task_exception_messages (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), text TEXT, task_exception_id BIGINT NOT NULL, CONSTRAINT pk__task_exception_m__40f05042 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-14', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 15, '7:13bb013dd040585173261b39f8014378', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-15::Kinetic Data
CREATE TABLE public.task_exceptions (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), engine_identification VARCHAR(2000), related_item1_id VARCHAR(128), related_item1_type VARCHAR(128), related_item2_id VARCHAR(128), related_item2_type VARCHAR(128), status VARCHAR(64), summary VARCHAR(2000), text TEXT, tree_id BIGINT, type_column VARCHAR(64), execution_id BIGINT, CONSTRAINT pk__task_exceptions__42d898b4 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-15', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 16, '7:18940464f0947234c0a03a2216409c1e', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-16::Kinetic Data
CREATE TABLE public.task_handler_audits (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), current_value TEXT, display_message TEXT, field VARCHAR(64), internal_message TEXT, previous_value TEXT, task_handler_id BIGINT NOT NULL, CONSTRAINT pk__task_handler_aud__44c0e126 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-16', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 17, '7:da3e9e4a55db6083191de4908d61d624', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-17::Kinetic Data
CREATE TABLE public.task_handler_properties (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), description VARCHAR(2000), is_required BOOLEAN NOT NULL, name VARCHAR(128) NOT NULL, type_column VARCHAR(64), value_column TEXT, task_handler_id BIGINT NOT NULL, CONSTRAINT pk__task_handler_pro__46a92998 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-17', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 18, '7:70e1d931826d028b26f4e1f0eed22578', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-18::Kinetic Data
CREATE TABLE public.task_handler_zips (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), zip BYTEA, CONSTRAINT pk__task_handler_zip__4891720a PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-18', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 19, '7:f19b6409d582c9d032be56e0b240c31a', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-19::Kinetic Data
CREATE TABLE public.task_handlers (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), definition_id VARCHAR(128) NOT NULL, description VARCHAR(2000), name VARCHAR(128), selection_criterion VARCHAR(128), status VARCHAR(64), xml TEXT, zip_changed_at TIMESTAMP WITH TIME ZONE NOT NULL, task_handler_zip_id BIGINT, CONSTRAINT pk__task_handlers__4a79ba7c PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-19', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 20, '7:415178b55ea34ab892186808e38c1d62', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-20::Kinetic Data
CREATE TABLE public.task_locks (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), active_count BIGINT, execution_id BIGINT NOT NULL, loop_index VARCHAR(128) NOT NULL, node_id VARCHAR(128) NOT NULL, terminative_count BIGINT, CONSTRAINT pk__task_locks__4c6202ee PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-20', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 21, '7:6a55b9b87dce259ff3c37d6a977ada56', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-21::Kinetic Data
CREATE TABLE public.task_messages (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), action_column VARCHAR(64), text TEXT, type_column VARCHAR(64), task_id BIGINT NOT NULL, CONSTRAINT pk__task_messages__4e4a4b60 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-21', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 22, '7:d43fd35e82b16e3201fd4b17cf37edd9', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-22::Kinetic Data
CREATE TABLE public.tasks (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), branch_id BIGINT NOT NULL, deferred_results TEXT, definition_id VARCHAR(128), duration INT, loop_index VARCHAR(128) NOT NULL, node_id VARCHAR(128) NOT NULL, node_name VARCHAR(128) NOT NULL, results TEXT, status VARCHAR(64), token VARCHAR(128), visible BOOLEAN, execution_id BIGINT NOT NULL, CONSTRAINT pk__tasks__503293d2 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-22', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 23, '7:a116c3b2874d0103929c0839204ec50c', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-23::Kinetic Data
CREATE TABLE public.tree_xml_references (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), count_column INT NOT NULL, definition_id VARCHAR(128) NOT NULL, definition_type VARCHAR(64) NOT NULL, is_integrated BOOLEAN NOT NULL, tree_xml_id BIGINT NOT NULL, CONSTRAINT pk__tree_xml_referen__521adc44 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-23', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 24, '7:be2f38318c974ca475ae7b850af40a6b', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-24::Kinetic Data
CREATE TABLE public.tree_xmls (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), xml TEXT, CONSTRAINT pk__tree_xmls__540324b6 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-24', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 25, '7:642abaadd59f82763694ed5389428c6f', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-25::Kinetic Data
CREATE TABLE public.trees (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), active BOOLEAN NOT NULL, deactivated_at TIMESTAMP WITH TIME ZONE NOT NULL, definition_id VARCHAR(128), name VARCHAR(128) NOT NULL, notes TEXT, owner_email VARCHAR(254), source_group VARCHAR(128) NOT NULL, status VARCHAR(64), type_column VARCHAR(64) NOT NULL, source_root_id BIGINT NOT NULL, tree_xml_id BIGINT, CONSTRAINT pk__trees__55eb6d28 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-25', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 26, '7:fcc39f0bb1c37b38c97a9e4b63715b05', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-26::Kinetic Data
CREATE TABLE public.triggers (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), action_column VARCHAR(64), branch_id BIGINT, engine_identification VARCHAR(2000), flags VARCHAR(128), loop_index VARCHAR(128) NOT NULL, management_action VARCHAR(64), message TEXT, mode_column VARCHAR(64), node_id VARCHAR(128) NOT NULL, node_name VARCHAR(128) NOT NULL, originator VARCHAR(128), results TEXT, scheduled_at TIMESTAMP WITH TIME ZONE NOT NULL, selection_criterion VARCHAR(128), status VARCHAR(64), token VARCHAR(128), execution_id BIGINT NOT NULL, CONSTRAINT pk__triggers__57d3b59a PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-26', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 27, '7:b024cf218cb2db9c94972ab5e23d6222', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-27::Kinetic Data
CREATE TABLE public.users (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), email VARCHAR(254) NOT NULL, login_id VARCHAR(128) NOT NULL, password_hash VARCHAR(256) NOT NULL, CONSTRAINT pk__users__59bbfe0c PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-27', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 28, '7:83b5111a1f006c5cf0e6db43601e66f7', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-28::Kinetic Data
ALTER TABLE public.categories_handlers ADD CONSTRAINT fk_ch_categoryid FOREIGN KEY (category_id) REFERENCES public.categories (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-28', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 29, '7:04c281312e84a6dfcada6c7d703baa6b', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-29::Kinetic Data
ALTER TABLE public.categories_handlers ADD CONSTRAINT fk_ch_handlerid FOREIGN KEY (task_handler_id) REFERENCES public.task_handlers (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-29', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 30, '7:eba6f59a4d373d341b5c795ba1d0073d', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-30::Kinetic Data
ALTER TABLE public.console_policy_rules ADD CONSTRAINT fk_cnpr_policyruleid FOREIGN KEY (policy_rule_id) REFERENCES public.policy_rules (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-30', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 31, '7:6f2d25c82d499b52abdf6fd103274971', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-31::Kinetic Data
ALTER TABLE public.categories_policy_rules ADD CONSTRAINT fk_cpr_categoryid FOREIGN KEY (category_id) REFERENCES public.categories (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-31', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 32, '7:d77d48529e0af777257782b401317d19', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-32::Kinetic Data
ALTER TABLE public.categories_policy_rules ADD CONSTRAINT fk_cpr_policyruleid FOREIGN KEY (policy_rule_id) REFERENCES public.policy_rules (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-32', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 33, '7:f73c7a3e9c51cb45c1339fde8aa7f3d5', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-33::Kinetic Data
ALTER TABLE public.categories_trees ADD CONSTRAINT fk_ct_categoryid FOREIGN KEY (category_id) REFERENCES public.categories (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-33', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 34, '7:77c5f94bbb3081d2f599e2141f65e4b5', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-34::Kinetic Data
ALTER TABLE public.categories_trees ADD CONSTRAINT fk_ct_treeid FOREIGN KEY (tree_id) REFERENCES public.trees (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-34', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 35, '7:84d276b8379a0f11f94524df467ab8e7', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-35::Kinetic Data
ALTER TABLE public.executions ADD CONSTRAINT fk_e_parentexid FOREIGN KEY (parent_execution_id) REFERENCES public.executions (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-35', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 36, '7:19a77aac4742b673e5e785a7053b5557', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-36::Kinetic Data
ALTER TABLE public.executions ADD CONSTRAINT fk_e_treeid FOREIGN KEY (tree_id) REFERENCES public.trees (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-36', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 37, '7:4d6ab20358f9933c6e74b4f417af4707', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-37::Kinetic Data
ALTER TABLE public.groups_users ADD CONSTRAINT fk_gu_groupid FOREIGN KEY (group_id) REFERENCES public.groups (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-37', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 38, '7:5838557dc0b2d40a56ea0c948484aa78', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-38::Kinetic Data
ALTER TABLE public.groups_users ADD CONSTRAINT fk_gu_userid FOREIGN KEY (user_id) REFERENCES public.users (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-38', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 39, '7:1098cfcbc8194685e191cca4c4941853', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-39::Kinetic Data
ALTER TABLE public.source_roots_policy_rules ADD CONSTRAINT fk_srpr_policyruleid FOREIGN KEY (policy_rule_id) REFERENCES public.policy_rules (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-39', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 40, '7:668f230bf6fdccf804eab54adb73fbf0', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-40::Kinetic Data
ALTER TABLE public.source_roots_policy_rules ADD CONSTRAINT fk_srpr_sourcerootid FOREIGN KEY (source_root_id) REFERENCES public.source_roots (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-40', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 41, '7:1b62bc78e9985486b6afb27b0e6ac965', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-41::Kinetic Data
ALTER TABLE public.source_root_properties ADD CONSTRAINT fk_srp_sourcerootid FOREIGN KEY (source_root_id) REFERENCES public.source_roots (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-41', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 42, '7:2ed22ba9606d9379a717adf58635264c', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-42::Kinetic Data
ALTER TABLE public.task_exception_messages ADD CONSTRAINT fk_tem_taskexceptionid FOREIGN KEY (task_exception_id) REFERENCES public.task_exceptions (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-42', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 43, '7:556ba6c4623f0dbe15202a81b1e6aacd', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-43::Kinetic Data
ALTER TABLE public.task_exceptions ADD CONSTRAINT fk_te_executionid FOREIGN KEY (execution_id) REFERENCES public.executions (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-43', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 44, '7:7aa4edac8f53abb0b9eac47f0ac4b74f', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-44::Kinetic Data
ALTER TABLE public.task_handler_audits ADD CONSTRAINT fk_tha_taskhandlerid FOREIGN KEY (task_handler_id) REFERENCES public.task_handlers (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-44', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 45, '7:84d263842bd4cc975ee499c70b4de437', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-45::Kinetic Data
ALTER TABLE public.task_handler_properties ADD CONSTRAINT fk_thp_taskhandlerid FOREIGN KEY (task_handler_id) REFERENCES public.task_handlers (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-45', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 46, '7:91483299c3414fc8494e892a2b053b35', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-46::Kinetic Data
ALTER TABLE public.task_handlers ADD CONSTRAINT fk_th_taskhandlerzipid FOREIGN KEY (task_handler_zip_id) REFERENCES public.task_handler_zips (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-46', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 47, '7:fc7349c906efbc41a70bd9c7d702b035', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-47::Kinetic Data
ALTER TABLE public.task_messages ADD CONSTRAINT fk_tm_taskid FOREIGN KEY (task_id) REFERENCES public.tasks (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-47', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 48, '7:4718672d56e1f75cb6c62f33ec541573', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-48::Kinetic Data
ALTER TABLE public.triggers ADD CONSTRAINT fk_tr_executionid FOREIGN KEY (execution_id) REFERENCES public.executions (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-48', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 49, '7:a1f18e35273b3eed4d147a31d2fdeb93', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-49::Kinetic Data
ALTER TABLE public.tree_xml_references ADD CONSTRAINT fk_tx_treexmlid FOREIGN KEY (tree_xml_id) REFERENCES public.tree_xmls (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-49', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 50, '7:76645e19ebfc7008981d8d1addb64b8a', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-50::Kinetic Data
ALTER TABLE public.tasks ADD CONSTRAINT fk_t_executionid FOREIGN KEY (execution_id) REFERENCES public.executions (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-50', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 51, '7:e1b14d9b2646e9c0c7274f15022e7fce', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-51::Kinetic Data
ALTER TABLE public.trees ADD CONSTRAINT fk_t_sourcerootid FOREIGN KEY (source_root_id) REFERENCES public.source_roots (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-51', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 52, '7:05fb00da0082fc2638c4e34fe6ecb0ba', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-52::Kinetic Data
ALTER TABLE public.trees ADD CONSTRAINT fk_t_treexmlid FOREIGN KEY (tree_xml_id) REFERENCES public.tree_xmls (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-52', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 53, '7:4a7ee74f11d3b1dbfc06ff126580bb5f', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-53::Kinetic Data
ALTER TABLE public.tasks ADD CONSTRAINT fk_gm1kbg36ucjcax2v6r6tgbdgg FOREIGN KEY (branch_id) REFERENCES public.triggers (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-53', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 54, '7:fd65e7459ebe6e3dc1fca97911956a4f', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-54::Kinetic Data
CREATE INDEX ix_ex_origexid ON public.executions(originating_execution_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-54', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 55, '7:5a95aa3b5ce6fe147bdceab27164cdf6', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-55::Kinetic Data
CREATE INDEX ix_te_treeid ON public.task_exceptions(tree_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-55', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 56, '7:885f9d93ebcf3906f8a602fddf811680', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-56::Kinetic Data
CREATE INDEX ix_t_branchid ON public.tasks(branch_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-56', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 57, '7:40c24b52ff9f0d6e64a22ee18de0e40e', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-57::Kinetic Data
CREATE INDEX ix_t_defid ON public.tasks(definition_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-57', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 58, '7:de1b6e12cfca665c5246f1d29366b4e8', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-58::Kinetic Data
CREATE INDEX ix_t_token ON public.tasks(token);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-58', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 59, '7:8a302cf5b3a127c946a8250dc551001a', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-59::Kinetic Data
CREATE INDEX ix_tr_branchid ON public.triggers(branch_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-59', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 60, '7:199cd44d5ef0faf5d228415ccbeecd2e', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-60::Kinetic Data
CREATE UNIQUE INDEX ix_u_email ON public.users(email);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-60', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 61, '7:083bd4f3494c6597422eab9ec8e27d47', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-61::Kinetic Data
CREATE INDEX ix_e_createdat ON public.executions(created_at);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-61', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 62, '7:473d4d83147b80b7e2117ea85e8d5f0e', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-62::Kinetic Data
CREATE INDEX ix_e_updatedat ON public.executions(updated_at);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-62', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 63, '7:5d85f092313c7f06601f0ed3d98b4bac', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-63::Kinetic Data
CREATE INDEX ix_txr_defid ON public.tree_xml_references(definition_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-63', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 64, '7:33e53bc5ac14479136bfe13e7e21e19d', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-64::Kinetic Data
CREATE INDEX ix_txr_deftype ON public.tree_xml_references(definition_type);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-64', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 65, '7:6f1c6b3898c63ca00549f60745cb9511', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-65::Kinetic Data
CREATE INDEX ix_txr_isintegrated ON public.tree_xml_references(is_integrated);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-65', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 66, '7:646f1aa1ee5a7e8602dced357f3af6b5', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-66::Kinetic Data
CREATE INDEX ix_trees_defid ON public.trees(definition_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-66', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 67, '7:2d85ddcbdaf072dee16edc7467078334', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-67::Kinetic Data
CREATE INDEX ix_te_createdat ON public.task_exceptions(created_at);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-67', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 68, '7:58d855dd64a963734eb24928bb63fe83', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-68::Kinetic Data
CREATE INDEX ix_te_updatedat ON public.task_exceptions(updated_at);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-68', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 69, '7:80d5da16cb0e504ffa566c89a0840d36', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-69::Kinetic Data
CREATE INDEX ix_t_createdat ON public.tasks(created_at);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-69', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 70, '7:16c35a27f4dc0b851eda22f0d6e51a94', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-70::Kinetic Data
CREATE INDEX ix_t_updatedat ON public.tasks(updated_at);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-70', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 71, '7:64e85df9b96d773ce6d59cb7b7930481', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-71::Kinetic Data
CREATE INDEX ix_tr_status ON public.triggers(status);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-71', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 72, '7:f65d23f30d9f9ce2ea2305bdcc8c08c0', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-72::Kinetic Data
CREATE INDEX ix_tr_createdat ON public.triggers(created_at);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-72', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 73, '7:a12cda12c07077501ec0029a4b35dda4', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-73::Kinetic Data
CREATE INDEX ix_tr_updatedat ON public.triggers(updated_at);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-73', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 74, '7:b49c92ab501793ca6163e04097627b38', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-74::Kinetic Data
CREATE UNIQUE INDEX uk_ap_name ON public.application_properties(name);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-74', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 75, '7:26307a67ac0699650f406ffbf81a5376', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-75::Kinetic Data
CREATE UNIQUE INDEX uk_cpr_prid_console ON public.console_policy_rules(policy_rule_id, console_name);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-75', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 76, '7:30776d3a0b4cda9ac50f03ac575ee84b', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-76::Kinetic Data
CREATE UNIQUE INDEX uk_c_name ON public.categories(name);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-76', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 77, '7:867be9c6ee64562c7155c4771e8c7baa', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-77::Kinetic Data
CREATE UNIQUE INDEX uk_g_name ON public.groups(name);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-77', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 78, '7:957b590a8ad7dd13621b909806c0d379', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-78::Kinetic Data
CREATE UNIQUE INDEX uk_pr_typename ON public.policy_rules(type_column, name);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-78', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 79, '7:0965df11c8387d2e84b666e77f02fc44', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-79::Kinetic Data
CREATE UNIQUE INDEX uk_srp_srname ON public.source_root_properties(source_root_id, name);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-79', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 80, '7:09468ecbd0893d88ea9c3cc8261b0ac1', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-80::Kinetic Data
CREATE UNIQUE INDEX uk_sr_name_deactive ON public.source_roots(name, deactivated_at);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-80', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 81, '7:9a7593267d3df0afcf26f6f3c656a155', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-81::Kinetic Data
CREATE UNIQUE INDEX uk_thp_thname ON public.task_handler_properties(task_handler_id, name);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-81', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 82, '7:e09eef634a76c966c7eded4d80261ce3', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-82::Kinetic Data
CREATE UNIQUE INDEX uk_th_defid ON public.task_handlers(definition_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-82', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 83, '7:d7a02bdeab248140fe636efdb647388d', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-83::Kinetic Data
CREATE UNIQUE INDEX uk_tl_exloopnode ON public.task_locks(execution_id, loop_index, node_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-83', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 84, '7:712a7f34e9eea5e2cde747d9f513f515', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-84::Kinetic Data
CREATE UNIQUE INDEX uk_tree_srgroupname ON public.trees(source_root_id, source_group, name, deactivated_at);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-84', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 85, '7:9552f72992e8f891e390019aa7c45ab4', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-85::Kinetic Data
CREATE UNIQUE INDEX uk_u_loginid ON public.users(login_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-85', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 86, '7:7f0c78c3465a7d03d31134c22434104f', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-86::Kinetic Data
CREATE TABLE public.source_data (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), content TEXT, CONSTRAINT pk__source_data__540324b6 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-86', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 87, '7:0169a35419b0f3b38a02d6c11e76d895', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-87::Kinetic Data
ALTER TABLE public.executions ADD CONSTRAINT fk_execution_sourcedataid FOREIGN KEY (source_data_id) REFERENCES public.source_data (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-87', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 88, '7:0275a6f1ab7677b1b98e1f2b6e25c185', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-88::Kinetic Data
UPDATE public.db_changelogs SET TAG = '04.00.00.RC2 (2014-07-14)' WHERE DATEEXECUTED = (SELECT MAX(DATEEXECUTED) FROM public.db_changelogs);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE, TAG) VALUES ('04.00.00-88', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 89, '7:d846d8b3bcec083209ad44cd660bae5f', 'tagDatabase', '', 'EXECUTED', '3.1.1', '04.00.00.RC2 (2014-07-14)');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-89::Kinetic Data
INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-89', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 90, '7:d41d8cd98f00b204e9800998ecf8427e', 'Empty', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-90::Kinetic Data
CREATE INDEX ix_fk_cpr_prid ON public.console_policy_rules(policy_rule_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-90', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 91, '7:785194b2d75861a719f72f4d266c0af6', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-91::Kinetic Data
CREATE INDEX ix_fk_e_treeid ON public.executions(tree_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-91', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 92, '7:da486c75c33712a94a93a825672db334', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-92::Kinetic Data
CREATE INDEX ix_fk_e_sdid ON public.executions(source_data_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-92', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 93, '7:2f7f1b100cc6c1bb498d8066807a6d1c', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-93::Kinetic Data
CREATE INDEX ix_fk_e_parid ON public.executions(parent_execution_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-93', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 94, '7:fcbd330e11db2fca50b60fda9971c0bb', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-94::Kinetic Data
CREATE INDEX ix_fk_srp_srid ON public.source_root_properties(source_root_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-94', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 95, '7:3dad6f76968d1f7a6b7dc07f63d8c91f', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-95::Kinetic Data
CREATE INDEX ix_fk_tha_hid ON public.task_handler_audits(task_handler_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-95', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 96, '7:2e116614e8f506e7bdba1407334e9710', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-96::Kinetic Data
CREATE INDEX ix_fk_tem_exid ON public.task_exception_messages(task_exception_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-96', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 97, '7:9a75428b6a912023922254867a940b7d', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-97::Kinetic Data
CREATE INDEX ix_fk_te_exid ON public.task_exceptions(execution_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-97', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 98, '7:1ddd1a70be7eb31b97c04d5d27f0febb', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-98::Kinetic Data
CREATE INDEX ix_fk_thp_hid ON public.task_handler_properties(task_handler_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-98', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 99, '7:343f0e92914ba00b929d79af9b01f9a5', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-99::Kinetic Data
CREATE INDEX ix_fk_th_zipid ON public.task_handlers(task_handler_zip_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-99', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 100, '7:f84a54570c184e3f6bd54a44be11608f', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-100::Kinetic Data
CREATE INDEX ix_fk_tm_taskid ON public.task_messages(task_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-100', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 101, '7:3bae3681e794cfee4dee56b276c509ec', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-101::Kinetic Data
CREATE INDEX ix_fk_t_exid ON public.tasks(execution_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-101', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 102, '7:72e0c5ef9784e331400d7bead4fe670c', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-102::Kinetic Data
INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-102', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 103, '7:d41d8cd98f00b204e9800998ecf8427e', 'Empty', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-103::Kinetic Data
CREATE INDEX ix_fk_txr_xmlid ON public.tree_xml_references(tree_xml_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-103', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 104, '7:5163403877313167e84b69cc4c158160', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-104::Kinetic Data
CREATE INDEX ix_fk_trees_sourcerootid ON public.trees(source_root_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-104', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 105, '7:9a3c95eb0352c55d228ef0443dc6e52a', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-105::Kinetic Data
CREATE INDEX ix_fk_tree_xmlid ON public.trees(tree_xml_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-105', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 106, '7:67e35068d6293f16783b83001aa0641e', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-106::Kinetic Data
CREATE INDEX ix_fk_tr_exid ON public.triggers(execution_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-106', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 107, '7:5ad51a4f91cb57466e844ae36ed5f426', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-107::Kinetic Data
CREATE INDEX ix_cpr_cateid ON public.categories_policy_rules(category_id);

CREATE INDEX ix_cpr_prid ON public.categories_policy_rules(policy_rule_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-107', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 108, '7:84c51ce7709caee612b26a2e83391d6f', 'createIndex (x2)', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-108::Kinetic Data
CREATE INDEX ix_ch_catid ON public.categories_handlers(category_id);

CREATE INDEX ix_ch_handlerid ON public.categories_handlers(task_handler_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-108', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 109, '7:0b1f1ccb3ec37cfd14c2a7aedf975b7e', 'createIndex (x2)', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-109::Kinetic Data
CREATE INDEX ix_ct_catid ON public.categories_trees(category_id);

CREATE INDEX ix_ct_treeid ON public.categories_trees(tree_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-109', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 110, '7:57ad07c44381ec23d0a59ad5fc0d50e4', 'createIndex (x2)', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-110::Kinetic Data
CREATE INDEX ix_gu_groupid ON public.groups_users(group_id);

CREATE INDEX ix_gu_userid ON public.groups_users(user_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-110', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 111, '7:cfb5109a0d89b61065fcaea5c077b226', 'createIndex (x2)', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-111::Kinetic Data
CREATE INDEX ix_srpr_sourceid ON public.source_roots_policy_rules(source_root_id);

CREATE INDEX ix_srpr_prid ON public.source_roots_policy_rules(policy_rule_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-111', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 112, '7:abed0065f8eaf721ba69520ef6c8ecb0', 'createIndex (x2)', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-112::Kinetic Data
CREATE INDEX ix_t_created_def_ex ON public.tasks(created_at, definition_id, execution_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-112', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 113, '7:dd6529677071b35b67a1391675154763', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-113::Kinetic Data
CREATE INDEX ix_t_updated_def_ex ON public.tasks(updated_at, definition_id, execution_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-113', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 114, '7:8e4c7808cdacea4888335a784c283f89', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-114::Kinetic Data
ALTER TABLE public.executions ADD status VARCHAR(128);

UPDATE public.executions SET status = 'Staged';

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-114', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 115, '7:246e3802a6619df92723237ba36f98a9', 'addColumn', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-115::Kinetic Data
CREATE INDEX ix_e_status ON public.executions(status);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-115', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 116, '7:9e8a1b9f37989bcabc0735c22c7e695d', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-116::Kinetic Data
UPDATE executions SET status='Started'
            WHERE EXISTS (SELECT triggers.id
                            FROM triggers
                            WHERE triggers.execution_id=executions.id
                            AND triggers.node_id='start'
                            AND triggers.status IN ('Closed', 'Failed', 'Work In Progress'));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-116', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 117, '7:c6834be41ea4289a61c054d4560e7284', 'sql', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-117::Kinetic Data
UPDATE public.db_changelogs SET TAG = '04.00.00.RC3 (2014-08-05)' WHERE DATEEXECUTED = (SELECT MAX(DATEEXECUTED) FROM public.db_changelogs);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE, TAG) VALUES ('04.00.00-117', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 118, '7:4a34ac1430d65fb5cc81fd560b6672b0', 'tagDatabase', '', 'EXECUTED', '3.1.1', '04.00.00.RC3 (2014-08-05)');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-118::Kinetic Data
DROP INDEX public.ix_t_defid;

CREATE INDEX ix_t_defid_status_dur ON public.tasks(definition_id, status, duration);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-118', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 119, '7:fbe8fa88027e0b679c5dfbadabf5f50f', 'dropIndex, createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-119::Kinetic Data
DROP INDEX public.ix_tr_status;

CREATE INDEX ix_tr_status_schat_exid ON public.triggers(status, scheduled_at, execution_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-119', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 120, '7:740663a847e146c8dba11fcbc89030cc', 'dropIndex, createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-120::Kinetic Data
CREATE INDEX ix_tr_schat_id_status_exid ON public.triggers(scheduled_at, id, status, execution_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.00.00-120', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 121, '7:57b0de756ff54315118ae841b576eefc', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml::04.00.00-121::Kinetic Data
UPDATE public.db_changelogs SET TAG = '04.00.00 (2014-08-08)' WHERE DATEEXECUTED = (SELECT MAX(DATEEXECUTED) FROM public.db_changelogs);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE, TAG) VALUES ('04.00.00-121', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.00.00.xml', NOW(), 122, '7:d42329f5045f187264931a29af36598c', 'tagDatabase', '', 'EXECUTED', '3.1.1', '04.00.00 (2014-08-08)');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.01.00.xml::04.01.00-1::Kinetic Data
CREATE TABLE public.execution_audits (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), execution_id BIGINT NOT NULL, identifier VARCHAR(128), message TEXT, previous_updated_at TIMESTAMP WITH TIME ZONE, previous_updated_by VARCHAR(128), previous_value TEXT, type VARCHAR(128), CONSTRAINT pk__execution_audits__818a4b11 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.01.00-1', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.01.00.xml', NOW(), 123, '7:22d9081327e390496b9e4cf59fa6afb5', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.01.00.xml::04.01.00-2::Kinetic Data
ALTER TABLE public.execution_audits ADD CONSTRAINT fk_ea_executionid FOREIGN KEY (execution_id) REFERENCES public.executions (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.01.00-2', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.01.00.xml', NOW(), 124, '7:6d6079bc0134f4b6d74fbd3f94c590e9', 'addForeignKeyConstraint', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.01.00.xml::04.01.00-3::Kinetic Data
CREATE INDEX ix_fk_ea_exid ON public.execution_audits(execution_id);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.01.00-3', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.01.00.xml', NOW(), 125, '7:0ebff70c1c5b97c0be2df619ecaa4805', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.01.00.xml::04.01.00-4::Kinetic Data
CREATE TABLE public.access_keys (id BIGSERIAL NOT NULL, commit_index BIGINT, created_at TIMESTAMP WITH TIME ZONE, created_by VARCHAR(128), updated_at TIMESTAMP WITH TIME ZONE, updated_by VARCHAR(128), description TEXT, identifier VARCHAR(128) NOT NULL, secret VARCHAR(128) NOT NULL, CONSTRAINT pk__access_keys__9a146eb0 PRIMARY KEY (id));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.01.00-4', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.01.00.xml', NOW(), 126, '7:a992c74a6be86deb46e68bcda70a8ad5', 'createTable', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.01.00.xml::04.01.00-5::Kinetic Data
CREATE UNIQUE INDEX ix_ak_identifier ON public.access_keys(identifier);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.01.00-5', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.01.00.xml', NOW(), 127, '7:fdc7e8c41bedb2555e42e916cfbe3fdf', 'createIndex', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.01.00.xml::04.01.00-7::Kinetic Data
UPDATE public.db_changelogs SET TAG = '04.01.00 (2016-12-12)' WHERE DATEEXECUTED = (SELECT MAX(DATEEXECUTED) FROM public.db_changelogs);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE, TAG) VALUES ('04.01.00-7', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.01.00.xml', NOW(), 128, '7:7e17d6eb60fd7123a37fb580434f1008', 'tagDatabase', '', 'EXECUTED', '3.1.1', '04.01.00 (2016-12-12)');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.01.01.xml::04.01.01-1::Kinetic Data
INSERT INTO console_policy_rules (commit_index, console_name, policy_rule_id)
            VALUES (1, 'Access Keys', (SELECT id FROM policy_rules WHERE policy_rules.name='Member of Administrators' AND type_column='Console Access'));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.01.01-1', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.01.01.xml', NOW(), 129, '7:0943a685495e21eea483f732aa30e364', 'sql', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.01.01.xml::04.01.01-2::Kinetic Data
INSERT INTO console_policy_rules (id, commit_index, console_name, policy_rule_id)
            VALUES (console_policy_rules_id_seq.NEXTVAL, 1, 'Access Keys', (SELECT id FROM policy_rules WHERE policy_rules.name='Member of Administrators' AND type_column='Console Access'));

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE) VALUES ('04.01.01-2', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.01.01.xml', NOW(), 130, '7:5d1bcc9c18defbd73106946de824afa5', 'sql', '', 'EXECUTED', '3.1.1');

-- Changeset com/kineticdata/task/installer/changelog/db.changelog_04.01.01.xml::04.01.01-3::Kinetic Data
UPDATE public.db_changelogs SET TAG = '04.01.01 (2017-01-03)' WHERE DATEEXECUTED = (SELECT MAX(DATEEXECUTED) FROM public.db_changelogs);

INSERT INTO public.db_changelogs (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, LIQUIBASE, TAG) VALUES ('04.01.01-3', 'Kinetic Data', 'com/kineticdata/task/installer/changelog/db.changelog_04.01.01.xml', NOW(), 131, '7:5a6c73242eab34046a7c28421e019cdb', 'tagDatabase', '', 'EXECUTED', '3.1.1', '04.01.01 (2017-01-03)');

