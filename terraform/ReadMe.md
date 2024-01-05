These Terraform config files create a linux VM using yandex cloud with a default user "ansible". The user credentials are defined in a local ssh key files. The mainf.tf file includes two modules ("tf-yc-instance" and "tf-yc-network") those described in a separate ReadMe files.

To run this you'll need a Terraform version greater than 0.87.0.

Some parameters can be tuden by changing variables.tf file:

- "cloud_id" defines the id of yandex cloud, default value is "b1g3jddf4nv5e9okle7p"
- "folder_id" defines the id of yandex cloud folder, default value is "b1gk067d0krcal09flv4"
- "zone" defines the network zone, defaul value is "ru-central1-a"
- "token" defines the access token and, for security reason, is taken from a shell variable

For details see also "modules/tf-yc-instance/ReadMe.md" and "modules/tf-yc-network/ReadMe.md".
