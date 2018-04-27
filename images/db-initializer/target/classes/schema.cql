CREATE TABLE IF NOT EXISTS datastore_submissions (
    closed_at timestamp,
    closed_by text,
    core_state text,
    created_at timestamp,
    created_by text,
    current_page_index int,
    datastore_id timeuuid,
    id timeuuid,
    space_id timeuuid,
    submitted_at timestamp,
    submitted_by text,
    updated_at timestamp,
    updated_by text,
    values map<text, text>,
    version_id timeuuid,
    PRIMARY KEY ((space_id, id))
);

CREATE TABLE IF NOT EXISTS datastore_submissions_index_entries (
  space_id timeuuid,
  datastore_id timeuuid,
  submission_id timeuuid,
  index_definition_id timeuuid,
  core_state text,
  value text,
  PRIMARY KEY ((space_id, datastore_id, index_definition_id), core_state, value, submission_id)
)
WITH CLUSTERING ORDER BY (core_state ASC, value ASC, submission_id ASC)
 AND COMPACTION={
    'sstable_size_in_mb': '256',
    'tombstone_threshold': '0.05',
    'unchecked_tombstone_compaction': 'true',
    'tombstone_compaction_interval': '3600',
    'class': 'LeveledCompactionStrategy'
};

CREATE TABLE IF NOT EXISTS datastore_submissions_unique_index_entries (
  space_id timeuuid,
  datastore_id timeuuid,
  submission_id timeuuid,
  submission_version_id timeuuid,
  index_definition_id timeuuid,
  value text,
  PRIMARY KEY ((space_id, datastore_id), index_definition_id, value)
)
WITH CLUSTERING ORDER BY (index_definition_id ASC, value ASC)
 AND COMPACTION={
    'sstable_size_in_mb': '256',
    'tombstone_threshold': '0.05',
    'unchecked_tombstone_compaction': 'true',
    'tombstone_compaction_interval': '3600',
    'class': 'LeveledCompactionStrategy'
};

/*------------------------------------------------------------------------------*
 * SOURCE OF TRUTH TABLE
 *
 * The main table that contains the full submission record, including answer 
 * values and Kapp specific variable data.  All records in the following index
 * table are generated from this data.
 *------------------------------------------------------------------------------*/

CREATE TABLE IF NOT EXISTS submissions (
    closed_at timestamp,
    closed_by text,
    core_state text,
    created_at timestamp,
    created_by text,
    current_page_index int,
    form_id timeuuid,
    form_type_id timeuuid,
    id timeuuid,
    kapp_id timeuuid,
    origin_id timeuuid,
    parent_id timeuuid,
    session_token text,
    space_id timeuuid,
    submitted_at timestamp,
    submitted_by text,
    updated_at timestamp,
    updated_by text,
    values map<text, text>,
    version_id timeuuid,
    PRIMARY KEY ((space_id, id))
);

/*------------------------------------------------------------------------------*
 * SUBMISSION INDEX TABLE
 *
 * The following table is used as an index for searching submission records. 
 * This tables contain the id of the 'submissions' table source record from 
 * which the row was generated, and only the necessary columns that compose the 
 * primary key.
 *
 *  scope_type      The scope type of the index (Kapp, Type, Form, Submission).
 *  scope_id        The id of the record that the search is being scoped to.
 *  core_state      The state of the submission (Draft, Submitted, Closed).
 *  timeline        The timeline used for ordering (closedAt, createdAt, 
 *                  submittedAt, or updatedAt).
 *  bucket          Draft/Submitted submissions are '-', Closed are 'YYYY-MM'.
 *  key             Reference to the data value ('-' for "all submissions by"
 *                  queries, 'createdBy' etc for submission properties, and 
 *                  'value[f1]' etc for submission field values).
 *  value           The first 256 characters of the submission value.
 *  timestamp       The submission timestamp value associated to the timeline.
 *  submission_id   The id of the submission being indexed.
 *------------------------------------------------------------------------------*/

CREATE TABLE IF NOT EXISTS submissions_index (
    scope_type text,
    scope_id timeuuid,
    core_state text,
    timeline text,
    bucket text,
    key text,
    value text,
    timestamp timestamp,
    submission_id timeuuid,
    PRIMARY KEY ((scope_type, scope_id, core_state, timeline, bucket, key), value, timestamp, submission_id)
) 
WITH CLUSTERING ORDER BY (value DESC, timestamp DESC, submission_id DESC)
 AND COMPACTION={
    'sstable_size_in_mb': '256',
    'tombstone_threshold': '0.05',
    'unchecked_tombstone_compaction': 'true',
    'tombstone_compaction_interval': '3600',
    'class': 'LeveledCompactionStrategy'
};

/*------------------------------------------------------------------------------*
 * SUBMISSION BUCKET REFERENCE TABLE
 *------------------------------------------------------------------------------*/

CREATE TABLE IF NOT EXISTS submission_activities (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    space_id timeuuid,
    submission_id timeuuid, 
    content text,
    PRIMARY KEY ((space_id, submission_id), id)
);

/*------------------------------------------------------------------------------*
 * SUBMISSION BUCKET REFERENCE TABLE
 *------------------------------------------------------------------------------*/

CREATE TABLE IF NOT EXISTS submission_buckets (
    space_id timeuuid,
    bucket text,
    PRIMARY KEY ((space_id), bucket)
)
WITH CLUSTERING ORDER BY (bucket DESC);

/*------------------------------------------------------------------------------*
 * BACKGROUND JOBS
 *------------------------------------------------------------------------------*/

CREATE TABLE IF NOT EXISTS background_jobs (
  id timeuuid, version_id timeuuid,
  created_at timestamp, created_by text, updated_at timestamp, updated_by text,
  content text,
  message text,
  parent_id timeuuid,
  parent_type text,
  progress_content text,
  space_id timeuuid,
  started_at timestamp,
  started_by text,
  status text,
  type text,
  PRIMARY KEY ((space_id), parent_type, parent_id, id)
)
WITH CLUSTERING ORDER BY (parent_type ASC, parent_id ASC, id ASC);


/*------------------------------------------------------------------------------*
 * WEBHOOK JOBS
 *------------------------------------------------------------------------------*/

CREATE TABLE IF NOT EXISTS webhook_job_buckets (
    space_id timeuuid,
    bucket text,
    PRIMARY KEY ((space_id), bucket)
)
WITH CLUSTERING ORDER BY (bucket DESC);

CREATE TABLE IF NOT EXISTS webhook_jobs (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    event text,
    name text,
    parent_id timeuuid,
    parent_type text,
    request_content text,
    response_content text,
    retry_count int,
    scheduled_at timestamp,
    scope_id timeuuid,
    scope_type text,
    space_id timeuuid,
    status text,
    summary text,
    url text,
    webhook_id uuid,
    PRIMARY KEY ((space_id, id))
);

CREATE TABLE IF NOT EXISTS webhook_jobs_index (
    bucket text,
    id timeuuid,
    index_type text,
    index_key text,
    scheduled_at timestamp,
    space_id timeuuid,
    PRIMARY KEY ((space_id, bucket, index_type, index_key), scheduled_at, id)
)
WITH CLUSTERING ORDER BY (scheduled_at DESC, id DESC)
 AND COMPACTION={
    'sstable_size_in_mb': '256',
    'tombstone_threshold': '0.05',
    'unchecked_tombstone_compaction': 'true',
    'tombstone_compaction_interval': '3600',
    'class': 'LeveledCompactionStrategy'
};

CREATE TABLE IF NOT EXISTS webhook_jobs_queue_index (
    id timeuuid,
    index_type text,
    index_key text,
    scheduled_at timestamp,
    space_id timeuuid,
    PRIMARY KEY ((space_id, index_type, index_key), scheduled_at, id)
)
WITH CLUSTERING ORDER BY (scheduled_at ASC, id ASC)
 AND COMPACTION={
    'sstable_size_in_mb': '256',
    'tombstone_threshold': '0.05',
    'unchecked_tombstone_compaction': 'true',
    'tombstone_compaction_interval': '3600',
    'class': 'LeveledCompactionStrategy'
};

/*------------------------------------------------------------------------------*
 * SHARED CONTENT TABLES
 *------------------------------------------------------------------------------*/

CREATE TABLE IF NOT EXISTS blobs (
  blob blob,
  key text,
  space_id timeuuid,
  type text,
  PRIMARY KEY ((space_id, type), key)
);

CREATE TABLE IF NOT EXISTS dependencies_by_id (
    id timeuuid,
    name text,
    type text,
    scope_type text,
    scope_id timeuuid,
    space_id timeuuid,
    PRIMARY KEY ((space_id, id))
);
CREATE TABLE IF NOT EXISTS dependencies_by_type_and_name (
    id timeuuid,
    name text,
    scope_type text,
    scope_id timeuuid,
    space_id timeuuid,
    type text,
    PRIMARY KEY ((space_id, scope_type, scope_id), type, name)
) WITH CLUSTERING ORDER BY (type ASC, name ASC);


CREATE TABLE IF NOT EXISTS dependency_references_by_parent (
    dependency_id timeuuid,
    occurrence_key text,
    parent_type text,
    parent_id timeuuid,
    scope_type text,
    scope_id timeuuid,
    space_id timeuuid,
    type text,
    PRIMARY KEY ((space_id, parent_type, parent_id), type, dependency_id, occurrence_key)
)
WITH CLUSTERING ORDER BY (type ASC, dependency_id ASC, occurrence_key ASC)
AND COMPACTION={
    'sstable_size_in_mb': '256',
    'tombstone_threshold': '0.05',
    'unchecked_tombstone_compaction': 'true',
    'tombstone_compaction_interval': '3600',
    'class': 'LeveledCompactionStrategy'
};

CREATE TABLE IF NOT EXISTS dependency_references_by_type (
    dependency_id timeuuid,
    occurrence_key text,
    parent_type text,
    parent_id timeuuid,
    scope_type text,
    scope_id timeuuid,
    space_id timeuuid,
    type text,
    PRIMARY KEY ((space_id, scope_type, scope_id), type, dependency_id, occurrence_key)
) 
WITH CLUSTERING ORDER BY (type ASC, dependency_id ASC, occurrence_key ASC)
AND COMPACTION={
    'sstable_size_in_mb': '256',
    'tombstone_threshold': '0.05',
    'unchecked_tombstone_compaction': 'true',
    'tombstone_compaction_interval': '3600',
    'class': 'LeveledCompactionStrategy'
};

CREATE TABLE IF NOT EXISTS relationships (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    content text,
    relation_id timeuuid,
    scope_type text,
    scope_id timeuuid,
    self_id timeuuid,
    space_id timeuuid,
    type text,
    PRIMARY KEY ((space_id, scope_type, scope_id, type), self_id, relation_id)
) 
WITH CLUSTERING ORDER BY (self_id ASC, relation_id ASC)
AND COMPACTION={
    'sstable_size_in_mb': '256',
    'tombstone_threshold': '0.05',
    'unchecked_tombstone_compaction': 'true',
    'tombstone_compaction_interval': '3600',
    'class': 'LeveledCompactionStrategy'
};


--------------------------------------------------------------------------------
-- SUPPORT TABLES
--------------------------------------------------------------------------------

-- CONFIGURATION ITEMS
CREATE TABLE IF NOT EXISTS configuration_items_by_id (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    bucket text, 
    name text,
    value text,
    PRIMARY KEY ((bucket), id)
);
CREATE TABLE IF NOT EXISTS configuration_items_by_name (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    bucket text, 
    name text,
    value text,
    PRIMARY KEY ((bucket), name)
);

-- SPACES
CREATE TABLE IF NOT EXISTS spaces_by_id (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    slug text,
    content text,
    restoration_token timeuuid,
    PRIMARY KEY ((id))
);
CREATE TABLE IF NOT EXISTS spaces_by_slug (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    slug text,
    content text,
    restoration_token timeuuid,
    PRIMARY KEY ((slug), restoration_token)
);

-- DATASTORES
CREATE TABLE IF NOT EXISTS datastores_by_id (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    space_id timeuuid, 
    slug text,
    content text,
    page_content text,
    restoration_token timeuuid,
    PRIMARY KEY ((space_id, id))
);
CREATE TABLE IF NOT EXISTS datastores_by_slug (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    space_id timeuuid,
    slug text,
    content text,
    page_content text,
    restoration_token timeuuid,
    PRIMARY KEY ((space_id), restoration_token, slug)
);

-- USERS
CREATE TABLE IF NOT EXISTS users_by_id (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    space_id timeuuid,
    normalized_username text,
    content text,
    PRIMARY KEY ((space_id, id))
);

CREATE TABLE IF NOT EXISTS users_by_normalized_username (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    space_id timeuuid,
    normalized_username text,
    content text,
    PRIMARY KEY ((space_id), normalized_username)
);

-- KAPPS
CREATE TABLE IF NOT EXISTS kapps_by_id (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    space_id timeuuid, 
    slug text,
    content text,
    restoration_token timeuuid,
    PRIMARY KEY ((space_id, id))
);
CREATE TABLE IF NOT EXISTS kapps_by_slug (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    space_id timeuuid,
    slug text,
    content text,
    restoration_token timeuuid,
    PRIMARY KEY ((space_id), restoration_token, slug)
);

-- TEAMS
CREATE TABLE IF NOT EXISTS teams_by_id (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    space_id timeuuid, 
    slug text,
    content text,
    restoration_token timeuuid,
    PRIMARY KEY ((space_id, id))
);
CREATE TABLE IF NOT EXISTS teams_by_slug (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    space_id timeuuid,
    slug text,
    content text,
    restoration_token timeuuid,
    PRIMARY KEY ((space_id), restoration_token, slug)
);

-- FORMS
CREATE TABLE IF NOT EXISTS forms_by_id (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    space_id timeuuid, 
    kapp_id timeuuid, 
    slug text,
    content text,
    page_content text,
    restoration_token timeuuid,
    PRIMARY KEY ((space_id, id))
);
CREATE TABLE IF NOT EXISTS forms_by_slug (
    id timeuuid, version_id timeuuid,
    created_at timestamp, created_by text, updated_at timestamp, updated_by text,
    space_id timeuuid,
    kapp_id timeuuid,
    slug text,
    content text,
    page_content text,
    restoration_token timeuuid,
    PRIMARY KEY ((space_id, kapp_id), restoration_token, slug)
);