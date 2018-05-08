CONTRACTS_TABLE_NAME = "contracts"
JSON_CONTRACT_PARAMETERS = ["Centrálne_číslo_zmluvy",
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
    
CONTRACT_COLUMNS = [
"contract_nr VARCHAR(20)",
"type VARCHAR(255)",
"kind VARCHAR(255)",
"parties TEXT",
"subject TEXT",
"price NUMERIC(15,2)",
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

CONTRACT_INDEXED_COLUMNS = [
    CONTRACT_COLUMNS[0],
    CONTRACT_COLUMNS[3]
]


INVOICES_TABLE_NAME = "invoices"
JSON_INVOICES_PARAMETERS = [
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
    
INVOICE_COLUMNS = [
"internal_invoice_nr VARCHAR(255)",
"supplier VARCHAR(255)",
"organization_name VARCHAR(255)",
"payment_description TEXT",
"price NUMERIC(15,2)",
"currency VARCHAR(255)",
"payment_date DATE",
"contract_nr VARCHAR(20)",
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

INVOICE_INDEXED_COLUMNS = [
    INVOICE_COLUMNS[0],
    INVOICE_COLUMNS[1]
]

ORDERS_TABLE_NAME = "orders"

JSON_ORDERS_PARAMETERS = [
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
    
ORDER_COLUMNS = [
"order_nr VARCHAR(255)",
"supplier VARCHAR(255)",
"order_text TEXT",
"value NUMERIC(15,2)",
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

ORDER_INDEXED_COLUMNS = [
    ORDER_COLUMNS[0],
    ORDER_COLUMNS[1]
]

GRANTS_TABLE_NAME = "grants"

JSON_GRANTS_PARAMETERS = [
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
    
GRANT_COLUMNS = [
"grant_year INT",
"type VARCHAR(255)",
"recurrence VARCHAR(255)",
"status VARCHAR(255)",
"action TEXT",
"approved_grant NUMERIC(15,2)",
"currency VARCHAR(255)",
"applicant VARCHAR(255)",
"applicant_address VARCHAR(255)",
"applicant_city VARCHAR(255)",
"applicant_ico VARCHAR(25)",
"purpose TEXT"
]

GRANT_INDEXED_COLUMNS = [
    GRANT_COLUMNS[7]
]

JSON_RESOURCE_DATEFORMAT = '%d.%m.%Y';

NUMBER_IDENTIFIERS = [
JSON_GRANTS_PARAMETERS[5],
JSON_ORDERS_PARAMETERS[3],
JSON_INVOICES_PARAMETERS[4],
JSON_CONTRACT_PARAMETERS[5]
]