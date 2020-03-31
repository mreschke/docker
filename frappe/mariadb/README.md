Frappe requires mariadb:10.3 with some custom configs.

See https://github.com/frappe/bench/wiki/Install-ERPNext-on-ArchLinux

So I created a conf.d/frappe.cnf with

  [mysqld]
  innodb-file-format=barracuda
  innodb-file-per-table=1
  innodb-large-prefix=1
  character-set-client-handshake = FALSE
  character-set-server = utf8mb4
  collation-server = utf8mb4_unicode_ci

  [mysql]
  default-character-set = utf8mb4


The other few files in my conf.d are what comes with mariadb for docker normally.  But since I am volume mounting the entire directory I replicate them.
