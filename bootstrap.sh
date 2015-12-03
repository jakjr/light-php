#!/usr/bin/env bash

echo " --- Iniciando Postgresql --- "
/etc/init.d/postgresql start 1>> /dev/null 2>&1

echo " --- Iniciando Apache2 ---"
/etc/init.d/apache2 start 1>> /dev/null 2>&1


