import json
import sys
import datetime
import os

grants_table_name = "grants"

json_grants_parameters = [
	"Rok_dotácie",
    "Typ",
    "Druh",
    "Stav_vybavenia",
    "Akcia",
    "Schv._prostr.",
    "Mena",
    "Žiadateľ",
    "Adresa_žiadateľa",
    "Mesto_(adresa_žiadateľa)",
    "IČO_žiadateľa",
    "Účel_použitia_dotácie",
    ]
    
grant_columns = [
"grant_year INT",
"type VARCHAR(255)",
"recurrence VARCHAR(255)",
"status VARCHAR(255)",
"action TEXT",
"approved_grant INT",
"currency VARCHAR(255)",
"applicant VARCHAR(255)",
"applicant_address VARCHAR(255)",
"applicant_city VARCHAR(255)",
"applicant_ico INT",
"purpose TEXT"
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
	column_names = [s.split(" ")[0] for s in grant_columns]
	id = 1;
	with open(iFile) as json_data:
		d = json.load(json_data)

		for i in d:
			print("INSERT INTO", grants_table_name + "(id, " + ", ".join(column_names) + ") VALUES " + "(" + str(id) + ",", end='')
			id += 1;
			for j in json_grants_parameters:
				i[j] = i[j].strip().replace("\'", "")
				if(j != json_grants_parameters[0]):
					print("", end=', ')
				if(j == "Schv._prostr." and i[j] != ""):
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
	print("CREATE TABLE IF NOT EXISTS", grants_table_name, 
		"(id INT PRIMARY KEY, " + ", ".join(grant_columns) + ");")
	print();
	printInserts("temp.json")
	os.remove("temp.json")

main()