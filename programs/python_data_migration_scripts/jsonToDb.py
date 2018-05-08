import json
import sys
import datetime
import os

from constants import *
CONTRACTS = "c"
INVOICES = "i"
ORDERS = "o"
GRANTS = "g"

DB_DATE_FORMAT = '%Y-%m-%d'

def getJsonIdentifiersBySelection(selection):
	if selection == CONTRACTS:
		return JSON_CONTRACT_PARAMETERS
	if selection == GRANTS:
		return JSON_GRANTS_PARAMETERS
	if selection == ORDERS:
		return JSON_ORDERS_PARAMETERS
	if selection == INVOICES:
		return JSON_INVOICES_PARAMETERS

def getColumnNamesBySelection(selection):
	if selection == CONTRACTS:
		return CONTRACT_COLUMNS
	if selection == GRANTS:
		return GRANT_COLUMNS
	if selection == ORDERS:
		return ORDER_COLUMNS
	if selection == INVOICES:
		return INVOICE_COLUMNS
	return []

def getTableNameBySelection(selection):
	if selection == CONTRACTS:
		return CONTRACTS_TABLE_NAME
	if selection == GRANTS:
		return GRANTS_TABLE_NAME
	if selection == ORDERS:
		return ORDERS_TABLE_NAME
	if selection == INVOICES:
		return INVOICES_TABLE_NAME

def getIndexedColumnsBySelection(selection):
	if selection == CONTRACTS:
		return CONTRACT_INDEXED_COLUMNS
	if selection == GRANTS:
		return GRANT_INDEXED_COLUMNS
	if selection == ORDERS:
		return ORDER_INDEXED_COLUMNS
	if selection == INVOICES:
		return INVOICE_INDEXED_COLUMNS

# corrects input json file
def transformJson(iFile, oFile):
	with open(iFile) as json_data, open(oFile, "w") as outputFile:
		# carriage return caused problems while parsing the json, replace
		# it with unusual char sequence so we can parse it when presented
		temp = json_data.read().replace("\\r", ";;")
		outputFile = outputFile.write(temp)

# indicates, whether given string is a date (using date format from variables.py)
def isDate(date_text):
    try:
        datetime.datetime.strptime(date_text, JSON_RESOURCE_DATEFORMAT)
        return True
    except ValueError:
        return False

# prints create table statement based on user's input and values stored in constants.py
def printDropAndCreateStatement(selection):
	tableName = getTableNameBySelection(sys.argv[2]);
	print("DROP TABLE IF EXISTS", tableName + ";") 
	print("CREATE TABLE", tableName, 
		"(id INT PRIMARY KEY, " + ", ".join(getColumnNamesBySelection(sys.argv[2])) + ");")

# prints create index statements based on user's input and values stored in constants.py
def printIndexStatements(selection):
	column_names = [ s.split(" ")[0] for s in getIndexedColumnsBySelection(selection)]
	tableName = getTableNameBySelection(selection)
	for i in column_names:
		print("CREATE INDEX", tableName + "_" + i + "_index", "ON", tableName, "(" + i + ");")

def printInserts(iFile, selection):
	# retrieve correct variables from variables.py based on user's input
	columns = getColumnNamesBySelection(selection)
	tableName = getTableNameBySelection(selection)
	jsonIdentifiers = getJsonIdentifiersBySelection(selection)
	column_names = [s.split(" ")[0] for s in columns]
	id = 1;
	with open(iFile) as json_data:
		# parser from json library
		d = json.load(json_data)

		for i in d:
			print("INSERT INTO", tableName, "(id, " + ", ".join(column_names) + ") VALUES " + "(" + str(id) + ",", end='')
			id+=1
			for j in jsonIdentifiers:
				# we need to replace all the apostrophes
				i[j] = i[j].strip().replace("\'", "\'\'")
				# if not fist, print comma
				if(j != jsonIdentifiers[0]):
					print("", end=', ')
				if(j in NUMBER_IDENTIFIERS and i[j] != ""):
					# replace commas used in the text for decimals with dot to be able to insert it
					print(i[j].replace(",",".").replace(" ", ""), end='')
				elif(isDate(i[j])):
					# transform the date from format used in json resources to the one accepted by the postgres db
					print("\'" + datetime.datetime.strptime(i[j], JSON_RESOURCE_DATEFORMAT).strftime(DB_DATE_FORMAT) +"\'", end='')
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
	printDropAndCreateStatement(sys.argv[2])
	print();
	printInserts("temp.json", sys.argv[2])
	printIndexStatements(sys.argv[2])
	os.remove("temp.json")

main()