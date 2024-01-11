Ansible backend role files for the "sausage store":
=========

This role install necessary software, creates necessary folders, downloads artifacts, adds backend system user, makes and run backend sytem service.



Role Variables
--------------

defaults/main.yml

backend_user
backend_group
backend_report_path
backend_log_path
backend_work_dir

vars/main.yml
backend_nexus_repo_url
backend_nexus_group_id
backend_nexus_artifact_id
backend_nexus_artifact_version
backend_nexus_artifact_extension
backend_nexus_username

Example Playbook
----------------


    - hosts: backend
      roles:
         - sausage-store-backend

License
-------

BSD

Author Information
------------------

Gleb Fedotov
