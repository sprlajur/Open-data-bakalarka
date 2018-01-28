import json
import sys
import datetime
import os

contracts_table_name = "contracts"
json_contract_parameters = ["Centrálne_číslo_zmluvy",
    "Typ",
    "Druh",
    "Zmluvné_strany",
    "Predmet",
    "Cena_celkom",
    "Mena",
    "Dátum_podpisu",
    "Dátum_zverejnenia",
    "Názov",
    "Hlavná_/_dodatok",
    "Zmluvné_strany_s_údajom_IČO",
    "Zmluvné_strany_-_adresy",
    "Miesto_podpisu",
    "Dátum_účinnosti_zmluvy_po_zverejnení",
    "Poznámky_k_zverejneniu",
    "Dátum_povolenia_katastra"]
    
contract_columns = [
"contract_nr INT PRIMARY KEY",
"type VARCHAR(255)",
"kind VARCHAR(255)",
"parties TEXT",
"subject TEXT",
"price INT",
"currency VARCHAR(255)",
"signature_date DATE",
"release_date DATE",
"name VARCHAR(1000)",
"main_or_appendix VARCHAR(255)",
"parties_ico TEXT",
"parties_addresses TEXT",
"signature_place VARCHAR(255)",
"validity_date DATE",
"release_notes TEXT",
"cadaster_approval_date DATE"
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
	column_names = [s.split(" ")[0] for s in contract_columns]
	with open(iFile) as json_data:
		d = json.load(json_data)

		for i in d:
			print("INSERT INTO", contracts_table_name + "(" + ", ".join(column_names) + ") VALUES " + "(", end='')
			for j in json_contract_parameters:
				i[j] = i[j].strip().replace("\'", "")
				if(j != json_contract_parameters[0]):
					print("", end=', ')
				if(j == 'Cena_celkom' and i[j] != ""):
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
	print("CREATE TABLE IF NOT EXISTS", contracts_table_name, 
		"(" + ", ".join(contract_columns) + ");")
	print();
	printInserts("temp.json")
	os.remove("temp.json")

main()