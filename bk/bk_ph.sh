#!/bin/bash

fecha=$(date +%Y%m%d-%H%M%S)
echo $fecha
sudo su -l postgres -c "/usr/bin/pg_dump --encoding UTF8 gestion_base_production | bzip2 > /var/bk/st${fecha}.sql.bz2"
