#!/bin/bash
exec &> log.txt
pg_dump presov_reports > presov_reports_dump.sql && \
dropdb presov_reports && \
createdb presov_reports && \
psql -d presov_reports -a -f invoices.sql && \
psql -d presov_reports -a -f contracts.sql && \
psql -d presov_reports -a -f grants.sql && \
psql -d presov_reports -a -f orders.sql
if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi