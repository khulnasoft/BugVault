# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased
### Added
- Add not affected justification field to affects (BUGVAULT-380)

### Changed
- Remove time information when validating embargoed flaws (BUGVAULT-3862)
- The "Obsolete" tracker resolution is now treated as "Not affected" to allow its use for erroneously filed trackers

### Fixed
- Fix CVSS data parsing in NVD collector (BUGVAULT-4003)
- Handle delete of last affect when updating flaw collaborators (BUGVAULT-3986)

### Removed
- Remove flaw impact adjustment from NVD collector (BUGVAULT-3678)

## [4.7.2] - 2025-01-31
### Changed
- Skip non-migrated Bugzilla tracker sync (BUGVAULT-3966)

## [4.7.1] - 2025-01-30
### Fixed
- Filter out empty events from history API resutls (BUGVAULT-3942)
- Make Jira task collector to write only necessary attributes to prevent mid-air collisions (BUGVAULT-3636)

## [4.7.0] - 2025-01-28
### Added
- Add SLA exclusion policies (BUGVAULT-3711)
- Implement 'in' operator in SLA conditions (BUGVAULT-3711)
- Enable async Jira task sync and transition (BUGVAULT-3693)
- Add collaboration labels on flaw promotion (BUGVAULT-3804)
- Add basic end-to-end tests for Flaws, Affects and Trackers (BUGVAULT-3495)
- Allow searching by flaw labels (BUGVAULT-3816)

### Changed
- Removed `last_validated_dt` from exposed JSON Flaw History data (BUGVAULT-3814), handled edge-case that would cause failure (BUGVAULT-3858)
- Trim Jira task summary if flaw's `cve_id` and `title` are too long (BUGVAULT-3847)
- Validate that a flaw has an impact set and RH CVSSv3 score is non-zero,
  or it does not have an impact set and RH CVSSv3 score is zero (BUGVAULT-3738)

### Fixed
- Set emtpy SLA dates explicitly (BUGVAULT-3943)

## [4.6.5] - 2025-01-10
### Changed
- Revert pull request #875 from BUGVAULT-3814

## [4.6.4] - 2025-01-10
### Changed
- Moved docker-compose images from docker.io to mirror.gcr.io (BUGVAULT-3653)
- Removed `last_validated_dt` from exposed JSON Flaw History data (BUGVAULT-3814)

## [4.6.3] - 2025-01-09
### Fixed
- Reduce flaw save operations to avoid outdated timestamps (BUGVAULT-3837)

## [4.6.2] - 2025-01-08
### Added
- Introduce new field "labels" in Flaw API (BUGVAULT-3803)

### Changed
- Use keywords from ps-constants in CVEorg collector (BUGVAULT-3694)
- External references are synced to Jira trackers (BUGVAULT-3733)
- Make flaw audit history public on embargoed flaws (BUGVAULT-3463)

### Fixed
- Fix workflow validation with conditional requirements (BUGVAULT-3524)

## [4.6.1] - 2024-12-06
### Fixed
- Fix not enough general CVE Severity/Severity error fallback (BUGVAULT-3767)

## [4.6.0] - 2024-12-02
### Added
- Update field `updated_dt` on queryset update (BUGVAULT-3573)
- Introduce purl to Affect (BUGVAULT-3409)
- Implement field `embargoed` for advanced search (BUGVAULT-3549)
- Implement no-week-ending SLA policy support (BUGVAULT-3500)
- Implement complex logic in workflow state requirements (BUGVAULT-3524)
- Validate and set ps_component from purl (BUGVAULT-3410)
- Set Jira Severity and maintain the transition from CVE Severity (BUGVAULT-3697)

### Changed
- Add history to several other models: AffectCVSS, FlawAcknowledgment, FlawComment,
  FlawCVSS, FlawReference, Snippet and Tracker. (BUGVAULT-3466)
- Moved metadata creation during tests to root level conftest and
  automatically set envs during VCR recording (BUGVAULT-3492)
- Exclude component and version from Jira tracker updates (BUGVAULT-3677)
- Allow moving a flaw to state DONE if it has no trackers but impact is moderate
  or low (BUGVAULT-3524)
- Set hard limit of paginated results (BUGVAULT-643)
- Add all references as links when creating Jira trackers (BUGVAULT-3733)
- Set security level together with embargo status (BUGVAULT-3598)

### Removed
- Remove UBI handler special treatment (BUGVAULT-3728)

## [4.5.6] - 2024-11-08
### Fixed
- Properly save updated flaw in NVD collector (BUGVAULT-3661)

## [4.5.5] - 2024-11-07
### Changed
- Publish internal flaws only when the triage is completed (BUGVAULT-3669)
- Adjust the NIST flag instead of removing on NIST score deletion
  and relieve the NIST flag validation to account for it (BUGVAULT-3672)
- Adjust flaw impact if NIST CVSS is changed (BUGVAULT-3661)

## [4.5.4] - 2024-11-06
### Changed
- Moved envs monkeypatches to root conftest for reusability (BUGVAULT-3491)

### Fixed
- Fix conversion of CVSS severity to impact (BUGVAULT-3661)
- Ignore invalid CVSS from OSV collector (BUGVAULT-3663)

## [4.5.3] - 2024-11-05
### Added
- Implement resolution steps for duplicate tracker validation (BUGVAULT-3588)

### Changed
- Add upstream references to Jira trackers on creation (BUGVAULT-3148)
- Change ACL mixin serializer to support internal ACLs (BUGVAULT-3578)
- Make product definitions collector atomic (BUGVAULT-3590)
- Validate that the CVSSv3 score is zero for flaws with impact "None" (BUGVAULT-3581)

## [4.5.2] - 2024-10-24
### Changed
- Reduced count of requests to Jira for task management

## [4.5.1] - 2024-10-23
### Added
- Implement validation of PS module and PS update stream correspondance (BUGVAULT-3584)

### Changed
- Avoid tracker creation conflicts by async tracker sync (BUGVAULT-3593)
- Skip flaws with CVE ID in OSV collector (BUGVAULT-3351)

### Fixed
- Fix Bugzilla flaw summary exceeding (BUGVAULT-3551)

## [4.5.0] - 2024-10-22
### Added
- Add new flaw reference type "UPSTREAM"

### Changed
- Check title for keywords in CVEorg collector (BUGVAULT-3545)
- Update delegated resolution mapping so low impact won't fix
  changes to fix deferred (BUGVAULT-3575)

### Fixed
- ValidationError constraint “unique_external_system_id” during tracker filing (BUGVAULT-3589)

## [4.4.1] - 2024-10-17
### Added
- Auto-reset CVSS validation flag on NVD CVSS removal (BUGVAULT-3407)

### Changed
- Restrict tracker file offer by ProdSec support instead of general one (BUGVAULT-3559)

### Fixed
- Do not add private tracker CC to flaws (BUGVAULT-3558)

## [4.4.0] - 2024-10-11
### Added
- Introduce moderate tracker streams pre-selection (BUGVAULT-3346)
- Introduce minor and 0-day incident types (BUGVAULT-3390)
- Collect CVSSv4 in OSV collector (BUGVAULT-3487)
- Set Impact for collector flaws based on CVSS severity (BUGVAULT-3487)

### Changed
- Disable flaw drafts creation for NVD collector (BUGVAULT-3256)
- Select most relevant CVE, CVSS, CWE, Source for Vulnerability trackers (BUGVAULT-3348)
- Tracker validations show affect's module/component (BUGVAULT-3439)

### Fixed
- Rework and complete the tracker stream pre-selection module to fix it
- Exclude unsupported PS modules from tracker file offer (BUGVAULT-3498)
- Update flaw timestamp after updating NIST CVSS
- Deprecate field "order" in the "comments" endpoint (BUGVAULT-3547)

## [4.3.4] - 2024-10-03
### Added
- Create custom DjangoQL lookup field for Flaw.components (BUGVAULT-3479)
- Collect NIST CVSSv4 in NVD collector (BUGVAULT-2300)

### Changed
- Record last impact increase in trackers (BUGVAULT-3448)

### Fixed
- Remove duplicate results from advanced search (BUGVAULT-3482)
- Collect Jira field metadata for only one issuetype for each project (BUGVAULT-3485)
- parent_uuid field in Alert had wrong type in OpenAPI schema (BUGVAULT-3451)
- Fix Jira Tracker collector to account for Vulnerability issue type (BUGVAULT-3489)
- IntegrityError duplicate key during tracker filing (BUGVAULT-3433)

## [4.3.3] - 2024-09-30
### Added
- Update Vulnerability trackers on components change (BUGVAULT-3323)
- Enable CVEorg collector in production

### Changed
- Alert users when Bugzilla sync failed (BUGVAULT-3252)

### Fixed
- Remove infinite recursion when SYNC_FLAWS_TO_BZ is disabled (BUGVAULT-3430)

## [4.3.2] - 2024-09-19
### Changed
- Update the release documentation (BUGVAULT-3384)

## [4.3.1] - 2024-09-11
### Added
- Create new API endpoints for DjangoQL (BUGVAULT-3338)
- Implement Jira collector sync managers (BUGVAULT-3177)

### Fixed
- Unable to unembargo flaws with trackers (BUGVAULT-3398)

### Removed
- Remove obsoleted contract priority support (BUGVAULT-3399)
- Remove obsoleted comliance priority support (BUGVAULT-3335)

## [4.3.0] - 2024-09-04
### Added
- Add CVEorg collector (BUGVAULT-2234)
- Allow trackers to have manually set SLAs (BUGVAULT-3374)

### Changed
- Handle frequent Taskman, Trackers and Collectors exceptions
  instead of internal server error 500 (BUGVAULT-3280)
- Sync trackers on impact decrease (BUGVAULT-3350)

### Fixed
- Tracker validations skipping (BUGVAULT-3336)

## [4.2.0] - 2024-08-30
### Added
- Implement DjangoQL for Flaw filtering (BUGVAULT-3337)
- Support Vulnerability issuetype for Trackers (BUGVAULT-2980)
- Set requires_cve_description to REQUESTED when unset and the flaw
  has cve_description (BUGVAULT-3349)

### Changed
- Extend CVSS vector length (BUGVAULT-3362)

### Fixed
- Taskman throwing away logs upon JSON decode error (BUGVAULT-3296)
- Wrong due date when filing new Jira tracker (BUGVAULT-3376)
- Fix date format error (BUGVAULT-3364)

## [4.1.7] - 2024-08-22
### Added
- Command for manual syncing Jira metadata (BUGVAULT-3219)

### Changed
- Saving models only triggers validations once (BUGVAULT-3108)
- Update ACLs of linked objects to match collector flaw (BUGVAULT-3253)
- Allow start dates to come from multiple sources in SLA (BUGVAULT-3221)
- Update public date for collector flaws (BUGVAULT-3212)
- Tracker collector ignores up-to-date entries (BUGVAULT-3244)
- Adjust BBSync to work in one-way mode (BUGVAULT-3251)
- Show only official collectors at the collector status endpoint
- Use BUGVAULT Bugzilla service account API key for majority of bzsync
  instead of user ones (BUGVAULT-3261)
- Adjust synchronous bzsync to only work one-way
- Move DEFER from historical to current possible affect resolution (BUGVAULT-3281)

### Fixed
- Cannot modify CVE of existing flaws (BUGVAULT-3102)
- Jira metadata collector is not deleting metadata on failure (BUGVAULT-3219)
- Avoid deadlocks by not triggering nested validations in m2m relationships (BUGVAULT-3244)
- Manually run validation avoiding duplicated trackers (BUGVAULT-3234)
- Add delay between Jira metadata fetch calls to prevent rate limiting (BUGVAULT-3298)

### Removed
- Stop syncing Bugzilla SRT notes to Bugzilla flaw bugs

## [4.1.6] - 2024-08-02
### Fixed
- Cannot fill trackers concurrently (BUGVAULT-3230)

## [4.1.5] - 2024-08-01
### Removed
- Remove message throttling in the API

## [4.1.4] - 2024-07-31
### Added
- Implement message throttling in the API (BUGVAULT-894)
- Added contract priority description in trackers (BUGVAULT-3165)

### Changed
- special_handling_flaw_missing_cve_description Alert to
  special_consideration_flaw_missing_cve_description (BUGVAULT-2955)
- special_handling_flaw_missing_statement Alert to
  special_consideration_flaw_missing_statement (BUGVAULT-2955)
- Allow setting empty impact value on flaw (BUGVAULT-3128)
- Temporarily move has trackers workflow requirement (BUGVAULT-3098)
- Handle Bugzilla errors in API request as 422 instead of
  500 internal server error (BUGVAULT-3126)
- Handle DB deadlock errors triggered by concurrent API requests
  as 409 instead of 500 internal server error (BUGVAULT-3048)
- Propagate Jira errors to the user (BUGVAULT-3184)

### Fixed
- Fix duplicate comment issue leading in internal server error (BUGVAULT-3086)
- Handle flaw comments with&without bzimport or bifurcated history (BUGVAULT-3030)
- Alerts constrained unique so that bzimport doesn't block user requests (BUGVAULT-3048)
- Duplicate Alerts created concurrently in multiple threads handled correctly (BUGVAULT-3048)
- Make task collector ignore outdated issues (BUGVAULT-3085)
- Allow Flaw API to properly unassign owner in Jira (BUGVAULT-3145)
- Remove sync from Bugzilla from the async sync to Bugzilla (BUGVAULT-3199)
- Do not save to backend systems in JiraTaskSaver (BUGVAULT-3087)

## [4.1.3] - 2024-07-25
### Changed
- UnackedHandler only recommends active unacked streams (BUGVAULT-3160)

## [4.1.2] - 2024-07-03
### Added
- Extend flaw-task linking to primarily use the CVE ID

### Fixed
- Fix Jira task collector (BUGVAULT-3064)
- Fix BUGVAULT-Bugzilla mid-air collision issues (BUGVAULT-3083)
- Null version of PsUpdateStream is not sent to Jira when creating a tracker (BUGVAULT-3078)

## [4.1.1] - 2024-06-28
### Added
- Prefetch Alerts related models for each API endpoint (BUGVAULT-3053)

### Fixed
- Keep vulnerability-draft BZ component when rejecting flaw draft (BUGVAULT-3023)
- Fix external sync order in serializers (BUGVAULT-3029)
- Make Taskman service validate Jira token (BUGVAULT-2203)

## [4.1.0] - 2024-06-25
### Added
- Implement a way to switch off each collector (BUGVAULT-2884)
- Generate Jira tracker "components" field (BUGVAULT-2988)
- Rudimentary API request logging (BUGVAULT-2514)
- Add query param to force creation of Jira task for old flaws on update (BUGVAULT-2882)
- Add collector for Jira tasks manually edited (BUGVAULT-1930)

### Changed
- Update the SLA policy

### Fixed
- Workflow state of flaws without task automatically changes to 'NEW' (BUGVAULT-2989)
- Fixed Flaw CC list builder to generate CCs in Bugzilla format
  for both Bugzilla and Jira tracked PS modules (BUGVAULT-2985)
- Flaw comments create action respects is_private (BUGVAULT-3003)

## [4.0.0] - 2024-06-17
### Added
- Add new OSV option into FlawSource
- Allow searching by CVE similarity (BUGVAULT-2482)
- Add CC lists to Jira trackers and to Bugzilla trackers (BUGVAULT-2191)
- Enable flaw draft creation in BZ (BUGVAULT-2261)
- Add support for UAT (BUGVAULT-2447)
- Added API for Alerts (BUGVAULT-325)
- Add bulk PUT for Affects (BUGVAULT-2407)
- Add Bugzilla token to promote API (BUGVAULT-2262)
- Enable creation of Jira tasks for collector flaws (BUGVAULT-2649)
- Add temporary JIRA stage http forwarder passing in params and headers (BUGVAULT-2734)
- Add link between trackers to flaws without CVE (BUGVAULT-2848)
- Support Bugzilla tracker creation/linking for non-Bugzilla flaws (BUGVAULT-2845)
- Add bulk-enabling parameter "sync_to_bz" to POST for Trackers (BUGVAULT-2609)
- Add bulk POST, DELETE for Affects (BUGVAULT-2722)
- Add audit history to Flaws and Affects (BUGVAULT-2269)
- Implement search on emptiness for several fields (BUGVAULT-2815)
- Add major_incident_start_dt field (BUGVAULT-2728)
- Add empty value to workflow_state (BUGVAULT-2881)

### Changed
- Make workflows API RESTful (BUGVAULT-1716)
- Collect errata not linked to any flaws (BUGVAULT-1527)
- Minor change to enable perf tests to run in CI (BUGVAULT-2447)
- Allow editing flaws without affects in NEW state (BUGVAULT-2452)
- Fixed read replica to perform HTTP requests as atomic transactions (BUGVAULT-2585)
- Fixed Bugzilla sync not working when Jira task sync is enabled (BUGVAULT-2628)
- Ignore SLA if update stream specifies it's not applicable (BUGVAULT-2612)
- Allow filtering by empty or null CVE IDs (BUGVAULT-2625)
- Redesign of flaw comments to make them independent of Bugzilla (BUGVAULT-2760)
- Allow filling trackers for flaws without bz_id (BUGVAULT-2819)
- Split BBSync enablement switch into flaw and tracker ones (BUGVAULT-2820)
- Set "Target Release" field in Jira trackers (BUGVAULT-2727)
- Tracker resolution is now readonly (BUGVAULT-2746)
- Enable tracker suggestions for affects with new affectedness (BUGVAULT-2843)
- Correct endpoint for tracker filing schema (BUGVAULT-2847)
- Renamed Flaw "description" to "comment_zero" and "summary" to "cve_description" (BUGVAULT-2740)
- Update the workflow check of filed trackers (BUGVAULT-2799)
- Improve affect validation error messages (BUGVAULT-2893)

### Fixed
- Fix incorrect ACLs for flaw drafts (BUGVAULT-2263)
- Fix workflow rejection endpoint (BUGVAULT-2456)
- Fix FlawReference article count validation (BUGVAULT-2651)
- Fix not being able to set CVE ID to an empty string through the API (BUGVAULT-2702)
- Comments not properly updating when syncing from Bugzilla (BUGVAULT-1385)
- Account for empty string in target release of PS update stream (BUGVAULT-2909)
- CVSS "comment" field accepts null (BUGVAULT-2907)

### Removed
- Remove "type" field from Affect (BUGVAULT-2743)
- Remove "type" field from Flaw (BUGVAULT-2735)
- Remove "state" field from Flaw (BUGVAULT-2736)
- Remove "resolution" field from Flaw (BUGVAULT-2737)
- Remove several cvss fields from Flaw (BUGVAULT-2749)
- Remove several cvss fields from Affect (BUGVAULT-2749)
- Remove "type" field from FlawComment (BUGVAULT-2745)
- Remove FlawMeta (BUGVAULT-2744)
- Remove "is_major_incident" field from Flaw (BUGVAULT-2741)
- Remove "meta_attr" field from FlawReference (BUGVAULT-2854)
- Remove "meta_attr" field from FlawAcknowledgment (BUGVAULT-2854)
- Remove "component" field from Flaw (BUGVAULT-2839)
- Remove "meta_attr" field from FlawComment (BUGVAULT-2747)

## [3.7.3] - 2024-05-28
### Fixed
- Fix erratum-tracker linking (BUGVAULT-2752)

## [3.7.2] - 2024-05-17
### Fixed
- Fix JiraTrackerConvertor linking of multi-CVE flaws (BUGVAULT-2708)

## [3.7.1] - 2024-05-16
### Changed
- Move flaw-affect-tracker linking to the tracker sync (BUGVAULT-1012, BUGVAULT-2587)

## [3.7.0] - 2024-04-17
### Added
- Implement flaw unembargo mechanism (BUGVAULT-1177)
- Make ps_product property available in affect API
- Add Fedramp stream preselection handler (BUGVAULT-1876)
- Introduce CVSS v4 (BUGVAULT-528)
- Change tests to have default urls strings where it can't be blank (BUGVAULT-1679)
- Add label compliance-priority to jira trackers based on ps-constants compliance_priority.yml (BUGVAULT-2062)
- Expose alerts on API for every model alert supported model,
  mainly Flaw, Affect, Tracker (BUGVAULT-2065)
- Add support for additional_fields in Jira BTS (BUGVAULT-696)
- Add scripts/restore_pg.sh script for restoring sql dump

### Changed
- Ignore hosts on VCR recording (BUGVAULT-1678)
- Included workflow fields in OpenAPI document for filtering (BUGVAULT-2083)
- Set migrated/duplicated delegated resolution to be ignored (BUGVAULT-1406)
- Update valid affectedness-resolution combinations (BUGVAULT-2143)
- Change Flaw API filter to allow a list of workflow_state (BUGVAULT-2208)
- SLA for compliance priority brought to parity with SFM2 (BUGVAULT-2257)
- Migrate data with outdated workflow_state values to the current ones (BUGVAULT-1718)
- Flaw CVSS score and Affect CVSS score are now readonly (BUGVAULT-2347)

### Fixed
- Fix Jira sync when bugzilla token is present (BUGVAULT-2171)
- Fix Bugzilla summary for first flaw creation (BUGVAULT-2190)
- Fix Jira tracker security level not being set based on embargo (BUGVAULT-2082)
- Removed writing operations in workflows when READ_ONLY is enabled (BUGVAULT-2336)
- Fix Flaw API allowing to sort by all fields (BUGVAULT-2367)
- Fix FlawCVSS and AffectCVSS "cvss_version" on API to show version enum

## [3.6.2] - 2024-02-02
### Fixed
- Fix issue with tracker updates through Affect objects (BUGVAULT-2059)
- Ensure invalid fields passed to include_fields filter are ignored (BUGVAULT-2048)

## [3.6.1] - 2024-02-01
### Fixed
- Fix issue with Flaw updates through collector (BUGVAULT-2050)

## [3.6.0] - 2024-01-31
### Added
- Implement writable tracker API (BUGVAULT-1180)
- Command for manual sync of Flaws now also accepts CVEs (BUGVAULT-1544)
- Add new SOURCE option into FlawReferenceType (BUGVAULT-1556)
- Add new NVD option into FlawSource
- Implement SLA definition parsing and timestamp computation (BUGVAULT-1428)
- Implement tracker SLA start date setting (BUGVAULT-1393)
- Implement tracker SLA end date setting (BUGVAULT-96)
- Properly link Jira trackers to flaws on creation and update (BUGVAULT-1426)
- Add OSV collector (BUGVAULT-677)
- Added GIN indexes for Row Based Security performance on models
- Added MAX_CONNS to django db conf to enable better concurrency
- Workflow fields added into Flaw endpoints (BUGVAULT-1819)
- Implement after-flaw-update tracker update mechanism (BUGVAULT-97)
- Add label verification-requested to jira trackers with NEW affects (BUGVAULT-1185)
- Implement after-affect-update tracker update mechanism (BUGVAULT-97)
- Keep jira tracker labels added by people or other tools (BUGVAULT-1440)
- Add label contract-priority to jira trackers based on ps-constants contract_priority.yml (BUGVAULT-1709)

### Fixed
- Fix incorrect type bool of is_up2date field in
  /collectors/api/v1/status endpoint
- fix schema to reflect Erratum shipped_dt to be nullable
- Ensured serializer db calls are read_only
- Expose git commit id via OPENSHIFT_BUILD_COMMIT env var
- Fix Jira metadata collector to get all pages from a query (BUGVAULT-1124)

### Changed
- Renamed OSIM module to Workflows (BUGVAULT-1395)
- Change settings to allow regex in CORS policy in stage environment (BUGVAULT-1737)
- Enhanced prefetches on Flaw, Affect, and Tracker api querysets
- Change default pg configs 
- Adjust CONN_MAX_AGE and CONN_MAX_CONNS to maintain a minimal pool of idle db conns (BUGVAULT-1620)
- Tracker status field is read-only (BUGVAULT-1780)
- Change Bugzilla collector and Flaw model to allow multiple components in bz_summary (BUGVAULT-1420)

### Removed
- Remove daily monitoring email for failed tasks / collectors (BUGVAULT-1215)
- Remove not used taskman APIs and services that has been intregated in OSIM (BUGVAULT-1321)

## [3.5.2] - 2023-12-06
### Added
- Limit Celery worker to maximum amount of tasks (BUGVAULT-1540)
- Add Celery worker concurrency
- Maximum Bugzilla and Jira connection age (BUGVAULT-1592, BUGVAULT-1593)

### Fixed
- Made Querier objects independent on Collector objects (BUGVAULT-1592, BUGVAULT-1593)

## [3.5.1] - 2023-10-23
### Fixed
- fix PS contact model (BUGVAULT-1445)
- Improve EPSS collector memory consumption

## [3.5.0] - 2023-10-09
### Added
- Implement collector for ps-constants project (BUGVAULT-1199)
- Validate summary and requires_summary (BUGVAULT-1164)
- Validate impact and summary (BUGVAULT-1164)
- Implement tracker description generation (BUGVAULT-1173)
- Implement endpoint for suggesting trackers to file (BUGVAULT-90)
- Add shipped date to erratum model (BUGVAULT-1197)
- Flaw creation and update triggers a Jira task sync (BUGVAULT-861)
- Config gunicorn access log file depending on environment (BUGVAULT-879)
- Link tracker to flaw(s) on create/update (BUGVAULT-1182)
- Implement FlawCVSS and AffectCVSS APIs with filters (BUGVAULT-1105)
- Implement package_versions API (BUGVAULT-1066)
- is_up2date to collector status API (BUGVAULT-1328)
- Implement flaw filtering based on erratum id in API (BUGVAULT-1330)
- Implement filters for flaw references in API (BUGVAULT-1368)
- Reactivate OSIM module unit tests (BUGVAULT-1320)

### Changed
- Deprecate various cvss fields in Flaw and Affect APIs (BUGVAULT-1105)
- Update CORS policy to allow bugzilla-api-key request header (BUGVAULT-1425)
- Change workflows to reflect current IR workflow (BUGVAULT-1319)

### Fixed
- Fix schema wrongly showing status code for DELETE methods being 204
  whereas the actual returned status code is 200

### Removed
- Remove the Django admin interface (BUGVAULT-1188)

## [3.4.2] - 2023-08-31
### Changed
- Reduce the total amount of records per page when querying Bugzilla (BUGVAULT-1232)
- Set AFFECTED as highest precedence resolution when calculating Affect.delegated_resolution (BUGVAULT-1230)

## [3.4.1] - 2023-08-21
### Changed
- Fix FlawCollector to account for an empty acknowledgment affiliation (BUGVAULT-1195)

## [3.4.0] - 2023-08-14
### Added
- Implement major_incident_state in Flaw API (BUGVAULT-266)
- Implement a new FlawAcknowledgment API (BUGVAULT-1002)
- Implement requires_summary in Flaw API (BUGVAULT-1005)
- Implement ps_update_stream in Tracker API (BUGVAULT-1064)
- Implement daily monitoring email for failed tasks / collectors
- Implement nist_cvss_validation in Flaw API (BUGVAULT-1006)
- Implement additional tracker validations (BUGVAULT-787)
- Validate NIST RH CVSS feedback loop (BUGVAULT-334)
- Validate nist_cvss_validation and cvss_scores (BUGVAULT-1165)
- Implement tracker summary generation (BUGVAULT-1172)

### Changed
- Change article link validation to be blocking (BUGVAULT-1060)
- Deprecate the "is_major_incident" field in Flaw (BUGVAULT-1103)
- Change CORS policy to allow credentials (BUGVAULT-1115)
- Validate MI and CISA MI separately (BUGVAULT-1104)
- Fix auto-timestamp issues (BUGVAULT-1171)

## [3.3.0] - 2023-06-28
### Added
- Implement a new FlawReference API (BUGVAULT-71)
- Implement adding new flaw comments (BUGVAULT-81)
- Erratum advisory name to flaw filter (BUGVAULT-922)
- CORS allow-list functionality (BUGVAULT-967, BUGVAULT-965)
- Raw bugzilla summary to Flaw.meta_attr (BUGVAULT-1016)

### Changed
- Set Jira trackers as public instead of embargoed when private (BUGVAULT-1013)

## [3.2.2] - 2023-06-19
### Changed
- Account for TRIAGE in the title/summary (BUGVAULT-999)

## [3.2.1] - 2023-06-12
### Changed
- Fix creation of references on flaw ingestion from Bugzilla

## [3.2.0] - 2023-06-05
### Added
- Introduce flaw ownership through task management system (BUGVAULT-69)
- Implement task rejection in Taskman (BUGVAULT-74)
- Implement article validation for Major Incident flaw (BUGVAULT-655)
- Implement mitigation validation for Major Incident flaw (BUGVAULT-656)
- Implement statement validation for Major Incident flaw (BUGVAULT-657)
- Introduce new module for creating trackers in Jira (BUGVAULT-93)
- Introduce aditional metadata in tasks generated from Taskman (BUGVAULT-861)

### Changed
- Integrate Jira tracker collector with collector framework (BUGVAULT-576)
- Make CVSSv3 score mandatory no more (BUGVAULT-901)
- Make Bugzilla collector aware of migration of old style acks to SRT notes (BUGVAULT-904)
- Fix BBSync flaw summary composition (BUGVAULT-902, BUGVAULT-909)
- Fix Bugzilla import not reflecting some attribute removals (BUGVAULT-910)
- Make flaw Bugzilla children entities respect flaw visibility (BUGVAULT-914)

## [3.1.4] - 2023-05-22
### Changed
- Git revision information on each request is fault-tolerant

## [3.1.3] - 2023-05-08
### Added
- Retry mechanism for bzimport collector

## [3.1.2] - 2023-04-27
### Changed
- General performance improvements

## [3.1.1] - 2023-04-17
### Changed
- Fix Jira tracker collection bug (BUGVAULT-848)

## [3.1.0] - 2023-04-12
### Added
- Introduce mitigation field into Flaw and update SRT notes generator (BUGVAULT-584)
- Introduce flaw component attribute
- Implement validation for allowed flaw sources (BUGVAULT-73)
- Implement task management module (Taskman) to keep and update task workflow in Jira (BUGVAULT-228, BUGVAULT-684, BUGVAULT-685, BUGVAULT-754)
- Expose task management module (Taskman) REST API (BUGVAULT-811)
- More granular filtering for Flaw, Affect and Tracker API endpoints (BUGVAULT-667)
- Ordering (ascending/descending) for Flaw, Affect and Tracker API endpoints (BUGVAULT-668)
- Implement proper NVD CVSS score collector (BUGVAULT-632)

### Changed
- Rework the mapping from Bugzilla sumary to BUGVAULT title and vice versa (BUGVAULT-694)
- Allow updates of flaws with multiple CVE IDs in Bugzilla (BUGVAULT-382)
- Deprecate "state" and "resolution" in Flaw (BUGVAULT-73)
- Increase the maximum length of "cwe_id" field in Flaw to 255 (BUGVAULT-73)
- Make API requests transactional (BUGVAULT-232)
- Rename REQUIRES_DOC_TEXT to REQUIRES_SUMMARY in FlawMeta (BUGVAULT-73)
- Minimize mid-air collisions (BUGVAULT-765)
- API delete methods now returns HTTP 200 status instead of 204
  upon succesful delete

### Removed
- Remove "state" and "resolution" from FlawHistory (BUGVAULT-73)

## [3.0.0] - 2023-03-21
### Added
- Implement Bugzilla SRT notes builder in Bugzilla Backwards Sync (BUGVAULT-384)
- Implement validation for flaw without affect (BUGVAULT-353)
- Implement validation for changes in flaws with high criticicity with open tracker (BUGVAULT-347)
- Implement validation for components affected by flaws closed as NOTABUG (BUGVAULT-363)
- Implement validation for invalid components in software collection (BUGVAULT-356)
- Implement Bugzilla metadata collector
- Implement validation for services related products with WONTREPORT resolution (BUGVAULT-362)
- Implement validation for combinations of affectedness and resolution (BUGVAULT-360)
- Implement a new API for getting a list of all supported products (PSINSIGHTS-593)
- Implement CC list builder in Bugzilla backwards sync (BUGVAULT-386)
- Implement validation for affects with exceptional combination of affectedness and resolution (BUGVAULT-361)
- Implement validation for affects marked as WONTFIX or NOTAFFECTED with open trackers (BUGVAULT-364)
- Implement validation for affected special handled modules without summary or statement (BUGVAULT-328)
- Implement validation for flaws with private source without ACK (BUGVAULT-339)
- Implement validation for unknown component (BUGVAULT-355)
- Implement temporary NVD collector (BUGVAULT-632)
- Implement Exploits report data API endpoint (PSINSIGHTS-764)
- Implement ACL validations (BUGVAULT-691)
- Implement non-empty impact validation (BUGVAULT-758)
- Integrate Bugzilla backwards sync into the flaw and affect save (BUGVAULT-240)
- Introduce Bugzilla API key as a serializer attribute (BUGVAULT-368)
- Implement non-empty source validation (BUGVAULT-759)
- Local development instance is now able to switch between stage and production easily via env variables

### Changed
- Change logging of celery and django to filesystem (BUGVAULT-418)
- Implement validation for CWE ID chain in a Flaw (BUGVAULT-357)
- Implement validation for embargoed flaws not be able to have public trackers (BUGVAULT-350)
- Fix Jira tracker created and updated timestamps (BUGVAULT-14)
- Fix errata created and updated timestamps (BUGVAULT-453)
- Restrict write operations on placeholder flaws (BUGVAULT-388)
- Avoid recreating flaws on CVE ID changes whenever possible (BUGVAULT-392)
- Remove unsused data prestage_eligible_date from schemas (BUGVAULT-695)
- Revise the allowed API view HTTP methods on models
  restricting flaw deletion and all tracker write methods (BUGVAULT-748)
- Bugzilla API key is send via Bugzilla-Api-Key HTTP header

### Removed
- Remove deprecated mitigated_by field (BUGVAULT-753)

## [2.3.4] - 2022-12-15
### Changed
- Make sure the unacked PS update stream is always linked to PS module (BUGVAULT-637)

## [2.3.3] - 2022-12-13
### Changed
- Link unacked PS update stream to PS module on product definitions sync (BUGVAULT-629)
- Increase PS component name length from 100 to 255 characters (BUGVAULT-635)

## [2.3.2] - 2022-11-28
### Changed
- Catch tracker sync exceptions individually (BUGVAULT-580)

### Added
- Implement complete Bugzilla groups handling in Bugzilla Backwards Sync (BUGVAULT-387)
- Support (CISA) Major Incident label in tracker description (BUGVAULT-579)

## [2.3.1] - 2022-10-25
### Changed
- Fix Errata collector saving to handle advisory name change (BUGVAULT-565)

## [2.3.O] - 2022-10-24
### Changed
- Fix Errata collector design to periodically refresh data (BUGVAULT-433)
- Flaw mitigated_by field is now deprecated and will be completely removed
  in the next major release (BUGVAULT-126)
- Fix component matching from tracker description (BUGVAULT-464)
- Store FlawMeta alerts on FlawMeta instead of on Flaw
- Prevent pgtrigger recreating triggers (BUGVAULT-429)

### Added
- Helper for manual flaw synchronization (BUGVAULT-389)
- Usage of django-deprecate-fields package for model field deprecation (BUGVAULT-126)

## [2.2.2] - 2022-09-20
### Changed
- Fix an issue with FlawSource validation for sources that can be both
  public and private (BUGVAULT-450)

## [2.2.1] - 2022-09-07
### Changed
- Fix an issue with CVSSv3 validation that was preventing some flaws from
  being synchronized in BUGVAULT (BUGVAULT-426, BUGVAULT-427)

## [2.2.0] - 2022-09-05
### Changed
- Authentication is no longer compulsory for read-only requests against the
  main BUGVAULT endpoints such as /flaws, /affects and /trackers (BUGVAULT-313)
- Fix an issue in which the Jiraffe collector was calling Tracker.affect
  instead of Tracker.affects (ManyToMany field) which resulted in some
  failed JIRA tracker synchronizations.
- Treat collector failures due to already running collectors or due to
  waiting for dependencies as celery Retry exceptions.
- BUGVAULT now uses publicly available images from docker.io (BUGVAULT-170)
- fix bug that Major Incident can be unset by unrelated BZ flag (BUGVAULT-416)
- CISA collector to run hourly rather than daily (PSINSIGHTS-635)

### Added
- support for CVE-less flaws (BUGVAULT-25)
- unified logging across the whole BUGVAULT
- validate hightouch and hightouch-lite flag value combinations (BUGVAULT-329)
- validate differences between Red Hat and NVD CVSS score and severity (BUGVAULT-333)
- validate that embargoed flaws do not have public sources (BUGVAULT-337)
- validate that flaws from public sources don't contain ack FlawMetas (BUGVAULT-338)
- `AlertMixin` for the creation of easily-serializable alerts on a per-record
  basis for any model that inherits from said mixin (BUGVAULT-324)
- validate that an Affect's `ps_module` exists in product definitions (BUGVAULT-342)
- EPSS data API for Red Hat vulnerabilities (PSINSIGHTS-636)

## [2.1.0] - 2022-08-02
### Changed
- disable krb5 log redirection in stage and production playbooks.
- disable opportunistic_auth when contacting Errata Tool and removed
  the authentication call from the constants file which meant that
  ET authentication would happen every time the code was loaded, generating
  a lot of auth calls and logs.
- change the way that data is synchronized to be more fault-tolerant,
  things like tracker fetching will no longer make the entire flaw
  sync fail.
- fix a bug where only certain metadata were being correctly synchronized
  between BZ and BUGVAULT which resulted in things like typos in acknowledgments
  persisting in BUGVAULT despite being removed from BZ.
- fix a bug in which the scheme in next/previous links in paginated
  responses was http:// and not https://.
- fix a bug with the way that the collector framework parsed crontab
  strings.
- fix various bugs with the collector framework instantiation process.
- fix a bug with the way that collector dependencies were being handled.
- fix a bug in which FlawMeta were not being updated correctly due to
  an ACL issue.
- update product exclusion lists.
- fix a bug in which the exploit collectors were not working properly
  due to an ACL issue.
- fix an issue with duplicate affects generating database errors.

### Added
- add various Dockerfile optimizations.
- add API for exploit report processing.
- add a mechanism to reflect CVE changes and/or removals.

### Removed
- remove audit mechanisms and tables from main models.
- remove obsoleted bzload.py script.
- remove outdated service schema.
- remove obsoleted funcspec.
- remove prodsec lib dependency.

## [2.0.3] - 2022-06-16
### Changed
- fix an issue with existing FlawMeta objects not being updated if the
  parent Flaw was itself updated, meaning that FlawMeta could be kept
  as embargoed if the Flaw was unembargoed.

## [2.0.2] - 2022-06-14
### Changed
- fix a change that broke backwards compatibility with IRD, this fix reverts
  the changes to the empty value of enumerations from "" back to "NONE",
  only IRD clients should be affected.

## [2.0.1] - 2022-06-03
### Changed
- fix an issue with objects not being saved to the database due to a bad
  interaction between FlawSaver and TrackerBugConvertor (BUGVAULT-142)

## [2.0.0] - 2022-06-01
### Added
- add tracker timestamps (BUGVAULT-62)
- provide erratum ID on API together with advisory ID (BUGVAULT-128)
- create flaw draft (BUGVAULT-68)
- API for Insights Vulnerability application (PSINSIGHTS-608)

### Changed
- start using the "Keep a Changelog" format for the CHANGELOG.md
- reviewed and unified the database fields accross all the models (BUGVAULT-16)
- fix and unify creation and modification timestamps handling (BUGVAULT-62, BUGVAULT-82)
- major Bugzilla collection reliability rework (BUGVAULT-17, BUGVAULT-130)
- ignore and remove testing Bugzilla bugs (BUGVAULT-111)
- reflect related entity removal on flaw sync (BUGVAULT-78)
- improve flaw source handling (BUGVAULT-61)

### Removed
- remove Flawzilla testing app (BUGVAULT-18)
- remove old collector APIs (BUGVAULT-20)

## [1.2.1] - 2022-05-23
### Changed

- ensure API ordering is reproducible - fixes pagination issue (BUGVAULT-133)

## [1.2.0] - 2022-05-02
### Added
- add /bugvault/whoami endpoint to expose currently logged in user information
- add /affects, /trackers endpoints and allow CRUD operations
- add collector for Errata Tool IDs and expose "errata that fix this tracker"
- track BUGVAULT users' bugzilla and jira usernames

### Changed
- unify metadata across all api responses
- fix Bugzilla flag syncing causing Major Incident update issues (PSDEVOPS-3406)
- fix collector ACLs causing unembargo staleness (PSDEVOPS-3449)
- fix flaw source typos causing minor sync issues (PSDEVOPS-3373)

### Removed
- remove status metadata from responses

## [1.1.2] - 2022-04-06
### Added
- add CPaaS pipeline credential mapping (PSDEVOPS-2569)

### Changed
- update version to 1.1.2
- apply correct update/create dates to flaws, affects, and trackers (PSDEVOPS-3365)
- move DEVELOP.md and TUTORIAL.md to docs directory

## [1.1.1] - 2022-03-29
### Changed
- update version to 1.1.1
- do not pass uuid as groups to set_user_acls

## [1.1.0] - 2022-03-28
### Added
- add update schema step to BUGVAULT release docs
- add schema extension for custom auth class
- add exploit collectors (PSINSIGHTS-538, PSINSIGHTS-541)
- implement more granular LDAP control groups (PSDEVOPS-2664)
- implement Product Definitions collector
- add tracker QE owner attribute (PSDEVOPS-3219)
- implement read-only mode and enable for prod (PSDEVOPS-3203)

### Changed
- raise BUGVAULT version to 1.1.0
- update documentation regarding LDAP groups
- increase bugvault-service route timeout from 30s to 300s
- update django version to fix known vulnerabilities
- validate peer cert chain and hostname for LDAP connections
- allow bzimport to import testing embargoed data to stage
- provide redis credentials and certificates for bugvault-service

## [1.0.0] - 2022-02-23
### Added
- implement kerberos authentication via SPNEGO protocol
- document BUGVAULT versioning
- add sections about more advanced Flaw queries in tutorial
- implement collector framework API
- implement example collector
- implement collector framework

### Changed
- update version to 1.0.0
- enable krb5_auth in stage
- fix CVSS string storing
- migrate from DRF tokens to JWT for auth (PSDEVOPS-3140)
- load Bugzilla dates as timezone aware
- use bugvault-service image for flower instead of dockerhub image
- secure redis instance by enabling TLS (PSDEVOPS-3128)
- secure redis instance with basic authentication (PSDEVOPS-3128)
- enable TLS endpoint verification in ansible playbooks (PSDEVOPS-3110)
- improve flaws endpoint performance for cve_id and change_after params (PSDEVOPS-3209)
- refactor URLs and the landing page
- fix changed_after and changed_before filters
- fix or refactor attribute validations
- fix schema definition
- accommodate flawdb->bugvault rename in openshift
- fix BUGVAULT name on the main page
- modify tracker_ids query param to filter out non relevant affects
- update query parameters description in API schema
- update LDAP groups docs

### Removed
- turn off CWE validation as it is too simple
- deprecate Basic and Session auth for API endpoints (PSDEVOPS-3126)

## [0.0.2] - 2022-01-21
### Changed
- update version to 0.0.2
- enable service accounts in prod

## [0.0.1] - 2022-01-21
### Added
- this is the initial BUGVAULT version
- see git repo for the older changes

<!-- TODO: Add links to version comparisons -->
