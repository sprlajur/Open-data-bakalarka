#!/bin/bash
exec &> log.txt
python3 python_data_migration_scripts/jsonToDb.py ../data_sources/Zoznam_Objednávky.json o > generated_sql/orders.sql
python3 python_data_migration_scripts/jsonToDb.py ../data_sources/Zoznam_Dodávateľské_faktúry.json i > generated_sql/invoices.sql
python3 python_data_migration_scripts/jsonToDb.py ../data_sources/Zoznam_*_o_do* g > generated_sql/grants.sql
python3 python_data_migration_scripts/jsonToDb.py ../data_sources/Zoznam_Zmluvy.json c > generated_sql/contracts.sql