alter table dmfadm.mig_message move lob( message_text ) store as (tablespace d_bscs_tiny);
alter table sysadm.scheduled_job move lob( input ) store as (tablespace d_bscs_tiny);
alter table sysadm.scheduled_job_history move lob( input ) store as (tablespace d_bscs_tiny);
