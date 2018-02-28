import json
import sys
import datetime
import os

from variables import *
CONTRACTS = "c"
INVOICES = "i"
ORDERS = "o"
GRANTS = "g"

def getJsonIdentifiersBySelection(selection):
	if selection == CONTRACTS:
		return json_contract_parameters
	if selection == GRANTS:
		return json_grants_parameters
	if selection == ORDERS:
		return json_orders_parameters
	if selection == INVOICES:
		return json_invoices_parameters

def getColumnNamesBySelection(selection):
	if selection == CONTRACTS:
		return contract_columns
	if selection == GRANTS:
		return grant_columns
	if selection == ORDERS:
		return order_columns
	if selection == INVOICES:
		return invoice_columns
	return []

def getTableNameBySelection(selection):
	if selection == CONTRACTS:
		return contracts_table_name
	if selection == GRANTS:
		return grants_table_name
	if selection == ORDERS:
		return orders_table_name
	if selection == INVOICES:
		return invoices_table_name


def transformJson(iFile, oFile):
	with open(iFile) as json_data, open(oFile, "w") as outputFile:
		temp = json_data.read().replace("\\r", " ")
		outputFile = outputFile.write(temp)

def isFloat(s):
    try: 
        float(s.replace(",","."))
        return True
    except ValueError:
        return False

def isDate(date_text):
    try:
        datetime.datetime.strptime(date_text, json_resource_dateFormat)
        return True
    except ValueError:
        return False

def printCreateStatement(selection):
	print("CREATE TABLE IF NOT EXISTS", getTableNameBySelection(sys.argv[2]), 
		"(id INT PRIMARY KEY, " + ", ".join(getColumnNamesBySelection(sys.argv[2])) + ");")

def printInserts(iFile, selection):
	columns = getColumnNamesBySelection(selection)
	tableName = getTableNameBySelection(selection)
	jsonIdentifiers = getJsonIdentifiersBySelection(selection)
	column_names = [s.split(" ")[0] for s in columns]
	id = 1;
	with open(iFile) as json_data:
		d = json.load(json_data)

		for i in d:
			print("INSERT INTO", tableName, "(id, " + ", ".join(column_names) + ") VALUES " + "(" + str(id) + ",", end='')
			id+=1
			for j in jsonIdentifiers:
				i[j] = i[j].strip().replace("\'", "")
				if(j != jsonIdentifiers[0]):
					print("", end=', ')
				if(j in number_identifiers and i[j] != ""):
					print(i[j].replace(",",".").replace(" ", ""), end='')
				elif(isDate(i[j])):
					print("\'" + datetime.datetime.strptime(i[j], '%d.%m.%Y').strftime('%Y-%m-%d') +"\'", end='')
				elif(i[j] != ''):
					print("\'" + i[j] +"\'", end='')
				else:
					print("null", end='')
			print(");")

def main():
	if(len(sys.argv) != 3):
		sys.exit('Wrong number of arguments. Required -> Input file; choice selection(CONTRACTS = c, INVOICES = i, ORDERS = o, GRANTS = g)')
	if(sys.argv[2] not in ["c", "g", "o", "i"]):
		sys.exit('Wrong choice selection (2nd argument). Possibilities:(CONTRACTS = c, INVOICES = i, ORDERS = o, GRANTS = g)')
	transformJson(sys.argv[1], "temp.json");
	printCreateStatement(sys.argv[2])
	print();
	printInserts("temp.json", sys.argv[2])
	os.remove("temp.json")

main()