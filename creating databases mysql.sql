-- DMBS - Database Management System (eg. MySQL server)

-- Create a database:
create database cmp_dakuhn;
-- tell mysql the default db.
use cmp_dakuhn;

-- deleting (dropping) a database:
-- drop database cmp_dakuhn;

-- altering a database to make it read only
alter database cmp_dakuhn read only = 1;
-- drop database cmp_dakuhn;
alter database cmp_dakuhn read only = 0;
