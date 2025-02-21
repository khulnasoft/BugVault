--enable row based security for following tables
ALTER TABLE bugvault_flaw ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_flaw FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_flaw entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_flaw_create on bugvault_flaw;
create policy acl_policy_flaw_create
on bugvault_flaw
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
-- Check that read / write ACLs of record to be inserted match ACL of current user
--policy for entity select
DROP policy if exists acl_policy_flaw_select on bugvault_flaw;
create policy acl_policy_flaw_select
on bugvault_flaw
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
-- Select only records with ACL that matches ACL of current user
--policy for entity update
DROP policy if exists acl_policy_flaw_update on bugvault_flaw;
create policy acl_policy_flaw_update
on bugvault_flaw
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_flaw_delete on bugvault_flaw;
create policy acl_policy_flaw_delete
on bugvault_flaw
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);

--enable row based security for affects entity table
ALTER TABLE bugvault_affect ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_affect FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_affect entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_affect_create on bugvault_affect;
create policy acl_policy_affect_create
on bugvault_affect
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity select
DROP policy if exists acl_policy_affect_select on bugvault_affect;
create policy acl_policy_affect_select
on bugvault_affect
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
--policy for entity update
DROP policy if exists acl_policy_affect_update on bugvault_affect;
create policy acl_policy_affect_update
on bugvault_affect
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_affect_delete on bugvault_affect;
create policy acl_policy_affect_delete
on bugvault_affect
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);

--enable row based security for tracker entity table
ALTER TABLE bugvault_tracker ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_tracker FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_tracker entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_tracker_create on bugvault_tracker;
create policy acl_policy_tracker_create
on bugvault_tracker
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity select
DROP policy if exists acl_policy_tracker_select on bugvault_tracker;
create policy acl_policy_tracker_select
on bugvault_tracker
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
--policy for entity update
DROP policy if exists acl_policy_tracker_update on bugvault_tracker;
create policy acl_policy_tracker_update
on bugvault_tracker
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_tracker_delete on bugvault_tracker;
create policy acl_policy_tracker_delete
on bugvault_tracker
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
