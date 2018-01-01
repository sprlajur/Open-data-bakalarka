import json
import sys
import datetime
import os

invoices_table_name = "invoices"
json_invoices_parameters = [
	"Interné_číslo_faktúry",
    "Dodávateľ",
    "Názov_organizácie",
    "Popis_-_účel_platby",
    "Celková_cena",
    "Mena",
    "Dátum_úhrady",
    "Centrálne_číslo_zmluvy",
    "Číslo_objednávky",
    "Dátum_zverejnenia",
    "IČO_-_Identifikačné_číslo_dodávateľa",
    "Adresa_dodávateľa",
    "Stav_zaplatenia",
    "Štruktúra_úradu",
    "Číslo_faktúry",
    "Finálna_/_Zálohová",
    "Stav_vybavenia"
    ]
    
invoice_columns = [
"internal_invoice_nr VARCHAR(255) PRIMARY KEY",
"supplier VARCHAR(255)",
"organization_name VARCHAR(255)",
"payment_description TEXT",
"price INT",
"currency VARCHAR(255)",
"payment_date DATE",
"contract_nr INT",
"order_nr VARCHAR(255)",
"release_date DATE",
"supplier_ico VARCHAR(255)",
"supplier_address TEXT",
"payment_status VARCHAR(255)",
"structure_office VARCHAR(255)",
"invoice_nr VARCHAR(255)",
"final_deposit VARCHAR(255)",
"completement_status VARCHAR(255)"
]


def transformJson(iFile, oFile):
	with open(iFile) as json_data, open(oFile, "w") as outputFile:
		temp = json_data.read().replace("\\r", ";;")
		outputFile = outputFile.write(temp)

def isFloat(s):
    try: 
        float(s.replace(",","."))
        return True
    except ValueError:
        return False

def isDate(date_text):
    try:
        datetime.datetime.strptime(date_text, '%d.%m.%Y')
        return True
    except ValueError:
        return False

def printInserts(iFile):
	column_names = [s.split(" ")[0] for s in invoice_columns]
	with open(iFile) as json_data:
		d = json.load(json_data)

		for i in d:
			print("INSERT INTO", invoices_table_name + "(" + ", ".join(column_names) + ") VALUES " + "(", end='')
			for j in json_invoices_parameters:
				i[j] = i[j].strip().replace("\'", "")
				if(j != json_invoices_parameters[0]):
					print("", end=', ')
				if(j == "Celková_cena" and i[j] != ""):
					print(i[j].replace(",",".").replace(" ", ""), end='')
				elif(isDate(i[j])):
					print("\'" + datetime.datetime.strptime(i[j], '%d.%m.%Y').strftime('%Y-%m-%d') +"\'", end='')
				elif(i[j] != ''):
					print("\'" + i[j] +"\'", end='')
				else:
					print("null", end='')
			print(");")

def main():
	if(len(sys.argv) != 2):
		sys.exit('Wrong number of arguments. Required -> Input file')
	transformJson(sys.argv[1], "temp.json");
	print("CREATE TABLE IF NOT EXISTS", invoices_table_name, 
		"(" + ", ".join(invoice_columns) + ");")
	print();
	printInserts("temp.json")
	os.remove("temp.json")

main()