--enable row based security for following tables
ALTER TABLE bugvault_flawevent ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_flawevent FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_flawevent entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_flawevent_create on bugvault_flawevent;
create policy acl_policy_flawevent_create
on bugvault_flawevent
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
-- Check that read / write ACLs of record to be inserted match ACL of current user
--policy for entity select
DROP policy if exists acl_policy_flawevent_select on bugvault_flawevent;
create policy acl_policy_flawevent_select
on bugvault_flawevent
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
-- Select only records with ACL that matches ACL of current user
--policy for entity update
DROP policy if exists acl_policy_flawevent_update on bugvault_flawevent;
create policy acl_policy_flawevent_update
on bugvault_flawevent
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_flawevent_delete on bugvault_flawevent;
create policy acl_policy_flawevent_delete
on bugvault_flawevent
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);

--enable row based security for affectevent entity table
ALTER TABLE bugvault_affectevent ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_affectevent FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_affectevent entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_affectevent_create on bugvault_affectevent;
create policy acl_policy_affectevent_create
on bugvault_affectevent
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity select
DROP policy if exists acl_policy_affectevent_select on bugvault_affectevent;
create policy acl_policy_affectevent_select
on bugvault_affectevent
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
--policy for entity update
DROP policy if exists acl_policy_affectevent_update on bugvault_affectevent;
create policy acl_policy_affectevent_update
on bugvault_affectevent
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_affectevent_delete on bugvault_affectevent;
create policy acl_policy_affectevent_delete
on bugvault_affectevent
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);

--enable row based security for trackerevent entity table
ALTER TABLE bugvault_trackerevent ENABLE ROW LEVEL SECURITY;
ALTER TABLE bugvault_trackerevent FORCE ROW LEVEL SECURITY;
--following policies define fine grained read/write control on bugvault_trackerevent entity
--policy for entity insert (eg. create)
DROP policy if exists acl_policy_trackerevent_create on bugvault_trackerevent;
create policy acl_policy_trackerevent_create
on bugvault_trackerevent
for INSERT
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity select
DROP policy if exists acl_policy_trackerevent_select on bugvault_trackerevent;
create policy acl_policy_trackerevent_select
on bugvault_trackerevent
for select
USING (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
--policy for entity update
DROP policy if exists acl_policy_trackerevent_update on bugvault_trackerevent;
create policy acl_policy_trackerevent_update
on bugvault_trackerevent
for update
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[])
WITH CHECK (acl_read::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]
     AND   acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'), ',')::uuid[]);
--policy for entity delete
DROP policy if exists acl_policy_trackerevent_delete on bugvault_trackerevent;
create policy acl_policy_trackerevent_delete
on bugvault_trackerevent
for delete
USING (acl_write::uuid[] && string_to_array(current_setting('bugvault.acl'),',')::uuid[]);
