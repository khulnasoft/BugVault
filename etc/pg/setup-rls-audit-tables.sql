--enable row based security for following tables
ALTER TABLE bugvault_flawaudit ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_flawaudit FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_flawaudit entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_flawaudit_create on bugvault_flawaudit;
create policy acl_policy_flawaudit_create
on bugvault_flawaudit
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
-- Check that read / write ACLs of record to be inserted match ACL of current user
--policy for entity select
DROP policy if exists acl_policy_flawaudit_select on bugvault_flawaudit;
create policy acl_policy_flawaudit_select
on bugvault_flawaudit
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
-- Select only records with ACL that matches ACL of current user
--policy for entity update
DROP policy if exists acl_policy_flawaudit_update on bugvault_flawaudit;
create policy acl_policy_flawaudit_update
on bugvault_flawaudit
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_flawaudit_delete on bugvault_flawaudit;
create policy acl_policy_flawaudit_delete
on bugvault_flawaudit
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);

--enable row based security for affectaudit entity table
ALTER TABLE bugvault_affectaudit ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_affectaudit FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_affectaudit entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_affectaudit_create on bugvault_affectaudit;
create policy acl_policy_affectaudit_create
on bugvault_affectaudit
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity select
DROP policy if exists acl_policy_affectaudit_select on bugvault_affectaudit;
create policy acl_policy_affectaudit_select
on bugvault_affectaudit
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
--policy for entity update
DROP policy if exists acl_policy_affectaudit_update on bugvault_affectaudit;
create policy acl_policy_affectaudit_update
on bugvault_affectaudit
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_affectaudit_delete on bugvault_affectaudit;
create policy acl_policy_affectaudit_delete
on bugvault_affectaudit
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);

--enable row based security for TrackerAudit
ALTER TABLE bugvault_trackeraudit ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_trackeraudit FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_trackeraudit entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_trackeraudit_create on bugvault_trackeraudit;
create policy acl_policy_trackeraudit_create
on bugvault_trackeraudit
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
-- Check that read / write ACLs of record to be inserted match ACL of current user
--policy for entity select
DROP policy if exists acl_policy_trackeraudit_select on bugvault_trackeraudit;
create policy acl_policy_trackeraudit_select
on bugvault_trackeraudit
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
-- Select only records with ACL that matches ACL of current user
--policy for entity update
DROP policy if exists acl_policy_trackeraudit_update on bugvault_trackeraudit;
create policy acl_policy_trackeraudit_update
on bugvault_trackeraudit
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_trackeraudit_delete on bugvault_trackeraudit;
create policy acl_policy_trackeraudit_delete
on bugvault_trackeraudit
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);

--enable row based security for FlawAcknowledgmentAudit
ALTER TABLE bugvault_flawacknowledgmentaudit ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_flawacknowledgmentaudit FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_flawacknowledgmentaudit entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_flawacknowledgmentaudit_create on bugvault_flawacknowledgmentaudit;
create policy acl_policy_flawacknowledgmentaudit_create
on bugvault_flawacknowledgmentaudit
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
-- Check that read / write ACLs of record to be inserted match ACL of current user
--policy for entity select
DROP policy if exists acl_policy_flawacknowledgmentaudit_select on bugvault_flawacknowledgmentaudit;
create policy acl_policy_flawacknowledgmentaudit_select
on bugvault_flawacknowledgmentaudit
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
-- Select only records with ACL that matches ACL of current user
--policy for entity update
DROP policy if exists acl_policy_flawacknowledgmentaudit_update on bugvault_flawacknowledgmentaudit;
create policy acl_policy_flawacknowledgmentaudit_update
on bugvault_flawacknowledgmentaudit
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_flawacknowledgmentaudit_delete on bugvault_flawacknowledgmentaudit;
create policy acl_policy_flawacknowledgmentaudit_delete
on bugvault_flawacknowledgmentaudit
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);

--enable row based security for FlawReferenceAudit
ALTER TABLE bugvault_flawreferenceaudit ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_flawreferenceaudit FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_flawreferenceaudit entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_flawreferenceaudit_create on bugvault_flawreferenceaudit;
create policy acl_policy_flawreferenceaudit_create
on bugvault_flawreferenceaudit
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
-- Check that read / write ACLs of record to be inserted match ACL of current user
--policy for entity select
DROP policy if exists acl_policy_flawreferenceaudit_select on bugvault_flawreferenceaudit;
create policy acl_policy_flawreferenceaudit_select
on bugvault_flawreferenceaudit
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
-- Select only records with ACL that matches ACL of current user
--policy for entity update
DROP policy if exists acl_policy_flawreferenceaudit_update on bugvault_flawreferenceaudit;
create policy acl_policy_flawreferenceaudit_update
on bugvault_flawreferenceaudit
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_flawreferenceaudit_delete on bugvault_flawreferenceaudit;
create policy acl_policy_flawreferenceaudit_delete
on bugvault_flawreferenceaudit
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);

--enable row based security for FlawCommentAudit
ALTER TABLE bugvault_flawcommentaudit ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_flawcommentaudit FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_flawcommentaudit entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_flawcommentaudit_create on bugvault_flawcommentaudit;
create policy acl_policy_flawcommentaudit_create
on bugvault_flawcommentaudit
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
-- Check that read / write ACLs of record to be inserted match ACL of current user
--policy for entity select
DROP policy if exists acl_policy_flawcommentaudit_select on bugvault_flawcommentaudit;
create policy acl_policy_flawcommentaudit_select
on bugvault_flawcommentaudit
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
-- Select only records with ACL that matches ACL of current user
--policy for entity update
DROP policy if exists acl_policy_flawcommentaudit_update on bugvault_flawcommentaudit;
create policy acl_policy_flawcommentaudit_update
on bugvault_flawcommentaudit
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_flawcommentaudit_delete on bugvault_flawcommentaudit;
create policy acl_policy_flawcommentaudit_delete
on bugvault_flawcommentaudit
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);

--enable row based security for FlawCVSSAudit
ALTER TABLE bugvault_flawcvssaudit ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_flawcvssaudit FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_flawcvssaudit entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_flawcvssaudit_create on bugvault_flawcvssaudit;
create policy acl_policy_flawcvssaudit_create
on bugvault_flawcvssaudit
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
-- Check that read / write ACLs of record to be inserted match ACL of current user
--policy for entity select
DROP policy if exists acl_policy_flawcvssaudit_select on bugvault_flawcvssaudit;
create policy acl_policy_flawcvssaudit_select
on bugvault_flawcvssaudit
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
-- Select only records with ACL that matches ACL of current user
--policy for entity update
DROP policy if exists acl_policy_flawcvssaudit_update on bugvault_flawcvssaudit;
create policy acl_policy_flawcvssaudit_update
on bugvault_flawcvssaudit
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_flawcvssaudit_delete on bugvault_flawcvssaudit;
create policy acl_policy_flawcvssaudit_delete
on bugvault_flawcvssaudit
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);

--enable row based security for AffectCVSSAudit
ALTER TABLE bugvault_affectcvssaudit ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_affectcvssaudit FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_affectcvssaudit entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_affectcvssaudit_create on bugvault_affectcvssaudit;
create policy acl_policy_affectcvssaudit_create
on bugvault_affectcvssaudit
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
-- Check that read / write ACLs of record to be inserted match ACL of current user
--policy for entity select
DROP policy if exists acl_policy_affectcvssaudit_select on bugvault_affectcvssaudit;
create policy acl_policy_affectcvssaudit_select
on bugvault_affectcvssaudit
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
-- Select only records with ACL that matches ACL of current user
--policy for entity update
DROP policy if exists acl_policy_affectcvssaudit_update on bugvault_affectcvssaudit;
create policy acl_policy_affectcvssaudit_update
on bugvault_affectcvssaudit
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_affectcvssaudit_delete on bugvault_affectcvssaudit;
create policy acl_policy_affectcvssaudit_delete
on bugvault_affectcvssaudit
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);

--enable row based security for SnippetAudit
ALTER TABLE bugvault_snippetaudit ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_snippetaudit FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_snippetaudit entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_snippetaudit_create on bugvault_snippetaudit;
create policy acl_policy_snippetaudit_create
on bugvault_snippetaudit
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
-- Check that read / write ACLs of record to be inserted match ACL of current user
--policy for entity select
DROP policy if exists acl_policy_snippetaudit_select on bugvault_snippetaudit;
create policy acl_policy_snippetaudit_select
on bugvault_snippetaudit
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
-- Select only records with ACL that matches ACL of current user
--policy for entity update
DROP policy if exists acl_policy_snippetaudit_update on bugvault_snippetaudit;
create policy acl_policy_snippetaudit_update
on bugvault_snippetaudit
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_snippetaudit_delete on bugvault_snippetaudit;
create policy acl_policy_snippetaudit_delete
on bugvault_snippetaudit
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);