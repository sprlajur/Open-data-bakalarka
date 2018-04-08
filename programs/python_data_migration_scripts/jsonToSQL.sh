#!/bin/bash
python3 jsonToDb.py ../../data_sources/Zoznam_Objednávky.json o > ../generated_sql/orders.sql
python3 jsonToDb.py ../../data_sources/Zoznam_Dodávateľské_faktúry.json i > ../generated_sql/invoices.sql
python3 jsonToDb.py ../../data_sources/Zoznam_*_o_do* g > ../generated_sql/grants.sql
python3 jsonToDb.py ../../data_sources/Zoznam_Zmluvy.json c > ../generated_sql/contracts.sql