Ansible frontend role files for the "sausage store":
=========

This role install necessary software, creates necessary folders, downloads artifacts, adds frontend system user, makes and run frontend sytem service.



Role Variables
--------------

defaults/main.yml

frontend_user
frontend_group
frontend_work_dir

vars/main.yml
frontend_nexus_repo_url
frontend_nexus_artifact_version
frontend_nexus_artifact_extension
frontend_nexus_username

Example Playbook
----------------

    - hosts: frontend
      roles:
         - sausage-store-frontend
         
License
-------

BSD

Author Information
------------------

Gleb Fedotov
