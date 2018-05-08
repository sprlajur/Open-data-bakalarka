#!/bin/bash
exec &> log.txt
pg_dump presov_reports > presov_reports_dump.sql && \
psql -d presov_reports -a -f generated_sql/invoices.sql && \
psql -d presov_reports -a -f generated_sql/contracts.sql && \
psql -d presov_reports -a -f generated_sql/grants.sql && \
psql -d presov_reports -a -f generated_sql/orders.sql
if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi