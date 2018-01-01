import json
import sys
import datetime
import os

orders_table_name = "orders"

json_orders_parameters = [
	"Číslo_objednávky",
    "Dodávateľ",
    "Text_objednávky",
    "Hodnota_objednávky",
    "Mena",
    "Dátum_vyhotovenia",
    "Dátum_zverejnenia",
    "IČO",
    "Adresa_dodávateľa",
    "Organizačná_štruktúra_úradu",
    "Meno_schvaľujúceho",
    "Funkcia_schvaľujúceho",
    "Dátum_vystavenia",
    "Poznámky_k_zverejneniu",
    "Stav_vybavenia",
    "Centr._číslo_zmluvy",
    "Centr._rok_zmluvy"
    ]
    
order_columns = [
"order_nr VARCHAR(255) PRIMARY KEY",
"supplier VARCHAR(255)",
"order_text TEXT",
"value INT",
"currency VARCHAR(255)",
"production_date DATE",
"release_date DATE",
"ico VARCHAR(25)",
"supplier_address TEXT",
"office_organization_structure VARCHAR(255)",
"approver_name VARCHAR(255)",
"approver_function VARCHAR(255)",
"issue_date DATE",
"release_notes TEXT",
"completeness_status VARCHAR(255)",
"contract_nr VARCHAR(20)",
"contract_year VARCHAR(5)"
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
	column_names = [s.split(" ")[0] for s in order_columns]
	with open(iFile) as json_data:
		d = json.load(json_data)

		for i in d:
			print("INSERT INTO", orders_table_name + "(" + ", ".join(column_names) + ") VALUES " + "(", end='')
			for j in json_orders_parameters:
				i[j] = i[j].strip().replace("\'", "")
				if(j != json_orders_parameters[0]):
					print("", end=', ')
				if(j == "Hodnota_objednávky" and i[j] != ""):
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
	print("CREATE TABLE IF NOT EXISTS", orders_table_name, 
		"(" + ", ".join(order_columns) + ");")
	print();
	printInserts("temp.json")
	os.remove("temp.json")

main()