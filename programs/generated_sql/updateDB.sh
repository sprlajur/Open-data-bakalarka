#!/bin/bash
exec &> log.txt
psql -d presov_reports -a -f invoices.sql && \
psql -d presov_reports -a -f contracts.sql && \
psql -d presov_reports -a -f grants.sql && \
psql -d presov_reports -a -f orders.sql
if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi