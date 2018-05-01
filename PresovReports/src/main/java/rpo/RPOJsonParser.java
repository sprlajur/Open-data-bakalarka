/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rpo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import org.json.*;

/**
 *
 * @author sprlajur
 */
public class RPOJsonParser {

    private static final String DATE_TIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'";
    private static final String DATE_FORMAT = "yyyy-MM-dd";

    private static final String JSON_ID = "id";
    private static final String JSON_CIN = "cin";
    private static final String JSON_NAME = "name";
    private static final String JSON_FORMATTED_ADDRESS = "formatted_address";
    private static final String JSON_CREATED_AT = "created_at";
    private static final String JSON_ESTABLISHED_ON = "established_on";
    private static final String JSON_TERMINATED_ON = "terminated_on";
    private static final String JSON_REGISTRATION_OFFICE = "registration_office";
    private static final String JSON_REGISTRATION_NUMBER = "registration_number";
    private static final String JSON_RPO_ORGANIZATIONS = "rpo_organizations";
    private static final String JSON_ACCOUNTING_ENTITIES = "ruz_accounting_entities";
    private static final String JSON_URL = "url";

    private static final String JSON_EFFECTIVE_FROM = "effective_from";
    private static final String JSON_EFFECTIVE_TO = "effective_to";
    private static final String JSON_SOURCE_REGISTER = "source_register";
    private static final String JSON_ADDRESS_ENTRIES = "address_entries";
    private static final String JSON_ADDRESS_ENTRIES_STREET = "street";
    private static final String JSON_ADDRESS_ENTRIES_REG_NR = "reg_number";
    private static final String JSON_ADDRESS_ENTRIES_BUILDING_NR = "building_number";
    private static final String JSON_ADDRESS_ENTRIES_POSTAL_CODE = "postal_code";
    private static final String JSON_ADDRESS_ENTRIES_MUNICIPALITY = "municipality";
    private static final String JSON_ADDRESS_ENTRIES_COUNTRY = "country";

    private static final String JSON_ALTERNATE_NAMES_ENTRIES = "alternate_name_entries";
    private static final String JSON_ALTERNATE_NAMES_ENTRIES_NAME = "name";

    private static final String JSON_DEPOSIT_ENTRIES = "deposit_entries";
    private static final String JSON_FULL_NAME = "full_name";
    private static final String JSON_DEPOSIT_ENTRIES_PERSON_FORMATTED_NAME = "person_formatted_name";
    private static final String JSON_DEPOSIT_ENTRIES_DEPOSIT_AMOUNT = "deposit_amount";
    private static final String JSON_DEPOSIT_ENTRIES_DEPOSIT_CURRENCY = "deposit_currency";
    private static final String JSON_DEPOSIT_ENTRIES_DEPOSIT_TYPE = "deposit_type";

    private static final String JSON_AUTHORIZATION_ENTRIES = "authorization_entries";
    private static final String JSON_AUTHORIZATION_ENTRIES_BODY = "body";

    private static final String JSON_ECONOMIC_ACTIVITY_ENTRIES = "economic_activity_entries";
    private static final String JSON_ECONOMIC_ACTIVITY_ENTRIES_DESCRIPTION = "description";
    private static final String JSON_ECONOMIC_ACTIVITY_ENTRIES_SUSPENDED_FROM = "suspended_from";
    private static final String JSON_ECONOMIC_ACTIVITY_ENTRIES_SUSPENDED_TO = "suspended_to";

    private static final String JSON_EQUITY_ENTRIES = "equity_entries";
    private static final String JSON_EQUITY_ENTRIES_INVESTMENT_AMOUNT = "investment_amount";
    private static final String JSON_EQUITY_ENTRIES_INVESTMENT_CURRENCY = "investment_currency";
    private static final String JSON_EQUITY_ENTRIES_PAID_AMOUNT = "paid_amount";
    private static final String JSON_EQUITY_ENTRIES_PAID_CURRENCY = "paid_currency";
    private static final String JSON_EQUITY_ENTRIES_APPROVED_AMOUNT = "approved_amount";
    private static final String JSON_EQUITY_ENTRIES_APPROVED_CURRENCY = "approved_currency";

    private static final String JSON_LEGAL_FORM_ENTRIES = "legal_form_entries";
    private static final String JSON_LEGAL_FORM_ENTRIES_LEGAL_FORM = "legal_form";
    private static final String JSON_LEGAL_FORM_ENTRIES_LEGAL_FORM_NAME = "name";

    private static final String JSON_LEGAL_STATUS_ENTRIES = "legal_status_entries";
    private static final String JSON_LEGAL_STATUS_ENTRIES_BODY = "body";

    private static final String JSON_NAME_ENTRIES = "name_entries";
    private static final String JSON_NAME_ENTRIES_NAME = "name";

    private static final String JSON_PREDECESSOR_ENTRIES = "predecessor_entries";
    private static final String JSON_SUCCESSOR_ENTRIES = "successor_entries";
    private static final String JSON_ENTRIES_ICO = "ico";
    private static final String JSON_ENTRIES_FULL_NAME = "full_name";

    private static final String JSON_SHARE_ENTRIES = "share_entries";
    private static final String JSON_SHARE_ENTRIES_PRICE = "share_price";
    private static final String JSON_SHARE_ENTRIES_CURRENCY = "share_currency";
    private static final String JSON_SHARE_ENTRIES_AMOUNT = "share_amount";
    private static final String JSON_SHARE_ENTRIES_TRANSFER = "share_transfer";
    private static final String JSON_SHARE_ENTRIES_TYPE = "share_type";
    private static final String JSON_SHARE_ENTRIES_FORM = "share_form";
    private static final String JSON_SHARE_ENTRIES_NAME = "name";

    private static final String JSON_STAKEHOLDER_ENTRIES = "stakeholder_entries";
    private static final String JSON_STATUTORY_ENTRIES = "statutory_entries";
    private static final String JSON_STAKEHOLDER_TYPE = "stakeholder_type";
    private static final String JSON_PERSON_FORMATTED_NAME = "person_formatted_name";
    private static final String JSON_ADDRESS_FORMATTED = "address_formatted";
    private static final String JSON_ADDRESS_STREET = "address_street";
    private static final String JSON_ADDRESS_REG_NR = "address_reg_number";
    private static final String JSON_ADDRESS_BUILDING_NR = "address_building_number";
    private static final String JSON_ADDRESS_POSTAL_CODE = "address_postal_code";
    private static final String JSON_ADDRESS_MUNICIPALITY = "address_municipality";
    private static final String JSON_ADDRESS_COUNTRY = "address_country";
    private static final String JSON_ADDRESS_DISTRICT = "address_district";

    private static final String JSON_MAIN_ACTIVITY_CODE = "main_activity_code";
    private static final String JSON_ESA2010_CODE = "esa2010_code";

    public static RPOLegalPerson parseIntermediaryAPIData(String jsonData, RPOLegalPerson person) {
        if (jsonData == null || jsonData.isEmpty()) {
            return null;
        }
        try {
            JSONObject obj = new JSONObject(jsonData);
            if (!obj.isNull(JSON_ID)) {
                person.setRpo_id(obj.getInt(JSON_ID));
            }
            if (!obj.isNull(JSON_NAME)) {
                person.setName(obj.getString(JSON_NAME));
            }
            if (!obj.isNull(JSON_FORMATTED_ADDRESS)) {
                person.setFormatted_address(obj.getString(JSON_FORMATTED_ADDRESS));
            }
            if (!obj.isNull(JSON_CREATED_AT)) {
                person.setCreatedAt(LocalDateTime.parse(obj.getString(JSON_CREATED_AT), DateTimeFormatter.ofPattern(DATE_TIME_FORMAT)));
            }
            if (!obj.isNull(JSON_REGISTRATION_OFFICE)) {
                person.setRegistration_office(obj.getString(JSON_REGISTRATION_OFFICE));
            }
            if (!obj.isNull(JSON_REGISTRATION_NUMBER)) {
                person.setRegistration_nr(obj.getString(JSON_REGISTRATION_NUMBER));
            }
            if (!obj.isNull(JSON_ESTABLISHED_ON)) {
                person.setEstablished_on(LocalDate.parse(obj.getString(JSON_ESTABLISHED_ON), DateTimeFormatter.ofPattern(DATE_FORMAT)));
            }
            if (!obj.isNull(JSON_TERMINATED_ON)) {
                person.setTerminated_on(LocalDate.parse(obj.getString(JSON_TERMINATED_ON), DateTimeFormatter.ofPattern(DATE_FORMAT)));
            }
            if (!obj.isNull(JSON_RPO_ORGANIZATIONS)) {
                JSONArray orgs = obj.getJSONArray(JSON_RPO_ORGANIZATIONS);
                if (orgs != null) {
                    if (!((JSONObject) orgs.get(0)).isNull(JSON_URL)) {
                        person.setRpo_API_url(((JSONObject) orgs.get(0)).getString(JSON_URL));
                    }
                }
            }
            if (!obj.isNull(JSON_ACCOUNTING_ENTITIES)) {
                JSONArray orgs = obj.getJSONArray(JSON_ACCOUNTING_ENTITIES);
                if (orgs != null) {
                    if (!((JSONObject) orgs.get(0)).isNull(JSON_URL)) {
                        person.setAccounting_entities_API_url(((JSONObject) orgs.get(0)).getString(JSON_URL));
                    }
                }
            }
        } catch (JSONException | NumberFormatException e) {
            e.printStackTrace();
        }
        return person;
    }

    public static RPOLegalPerson parseFullRPOData(String jsonData, RPOLegalPerson person) {
        if (jsonData == null || jsonData.isEmpty()) {
            return null;
        }
        try {
            JSONObject obj = new JSONObject(jsonData);
            if (!obj.isNull(JSON_SOURCE_REGISTER)) {
                person.setSource_register(JSON_SOURCE_REGISTER);
            }
            if (!obj.isNull(JSON_ADDRESS_ENTRIES)) {
                parseAddressEntries(obj, person);
            }
            if (!obj.isNull(JSON_ALTERNATE_NAMES_ENTRIES)) {
                parseAlternateNameEntries(obj, person);
            }
            if (!obj.isNull(JSON_DEPOSIT_ENTRIES)) {
                parseDepositEntries(obj, person);
            }
            if (!obj.isNull(JSON_AUTHORIZATION_ENTRIES)) {
                parseAuthorizationEntries(obj, person);
            }
            if (!obj.isNull(JSON_ECONOMIC_ACTIVITY_ENTRIES)) {
                parseEconomicActivityEntries(obj, person);
            }
            if (!obj.isNull(JSON_EQUITY_ENTRIES)) {
                parseEquityEntries(obj, person);
            }
            if (!obj.isNull(JSON_LEGAL_FORM_ENTRIES)) {
                parseLegalFormEntries(obj, person);
            }
            if (!obj.isNull(JSON_LEGAL_STATUS_ENTRIES)) {
                parseLegalStatusEntries(obj, person);
            }
            if (!obj.isNull(JSON_NAME_ENTRIES)) {
                parseNameEntries(obj, person);
            }
            if (!obj.isNull(JSON_PREDECESSOR_ENTRIES)) {
                parsePredecessorSuccessorEntries(obj, person, false);
            }
            if (!obj.isNull(JSON_SUCCESSOR_ENTRIES)) {
                parsePredecessorSuccessorEntries(obj, person, true);
            }
            if (!obj.isNull(JSON_SHARE_ENTRIES)) {
                parseShareEntries(obj, person);
            }
            if (!obj.isNull(JSON_STAKEHOLDER_ENTRIES)) {
                parseStakeholderStatutoryEntries(obj, person, false);
            }
            if (!obj.isNull(JSON_STATUTORY_ENTRIES)) {
                parseStakeholderStatutoryEntries(obj, person, true);
            }
            if (!obj.isNull(JSON_MAIN_ACTIVITY_CODE)) {
                parseMainActivityCode(obj, person);
            }
            if (!obj.isNull(JSON_ESA2010_CODE)) {
                parseESA2010Code(obj, person);
            }
        } catch (JSONException | NumberFormatException e) {
            e.printStackTrace();
        }
        return person;
    }

    private static void parseAddressEntries(JSONObject jsonObject, RPOLegalPerson person) {
        List<RPOAddressEntry> addressEntries = new ArrayList<>();
        JSONArray addressesJSON = jsonObject.getJSONArray(JSON_ADDRESS_ENTRIES);
        if (addressesJSON != null) {

            addressesJSON.forEach(identifier -> {
                JSONObject jsonAddress = (JSONObject) identifier;
                RPOAddressEntry addressEntry = new RPOAddressEntry();
                if (!jsonAddress.isNull(JSON_ADDRESS_ENTRIES_STREET)) {
                    addressEntry.setStreet(jsonAddress.getString(JSON_ADDRESS_ENTRIES_STREET));
                }
                if (!jsonAddress.isNull(JSON_ADDRESS_ENTRIES_BUILDING_NR)) {
                    addressEntry.setBuilding_nr(jsonAddress.getString(JSON_ADDRESS_ENTRIES_BUILDING_NR));
                }
                if (!jsonAddress.isNull(JSON_ADDRESS_ENTRIES_COUNTRY)) {
                    addressEntry.setCountry(jsonAddress.getString(JSON_ADDRESS_ENTRIES_COUNTRY));
                }
                if (!jsonAddress.isNull(JSON_ADDRESS_ENTRIES_MUNICIPALITY)) {
                    addressEntry.setMunicipality(jsonAddress.getString(JSON_ADDRESS_ENTRIES_MUNICIPALITY));
                }
                if (!jsonAddress.isNull(JSON_ADDRESS_ENTRIES_REG_NR)) {
                    addressEntry.setReg_nr(jsonAddress.getInt(JSON_ADDRESS_ENTRIES_REG_NR));
                }
                setEffectiveDates(addressEntry, jsonAddress);
                addressEntries.add(addressEntry);
            });
        }
        if (!addressEntries.isEmpty()) {
            person.setAddressEntries(addressEntries);
        }
    }

    private static void parseAlternateNameEntries(JSONObject jsonObject, RPOLegalPerson person) {
        List<RPOOneStringEntry> alternateNames = new ArrayList<RPOOneStringEntry>();
        JSONArray alternateNamesJSON = jsonObject.getJSONArray(JSON_ALTERNATE_NAMES_ENTRIES);
        if (alternateNamesJSON != null) {
            alternateNamesJSON.forEach(alterName -> {
                JSONObject alterNameJSONObject = (JSONObject) alterName;
                RPOOneStringEntry rpoAlternateName = new RPOOneStringEntry();
                if (!alterNameJSONObject.isNull(JSON_ALTERNATE_NAMES_ENTRIES_NAME)) {
                    rpoAlternateName.setBody(alterNameJSONObject.getString(JSON_ALTERNATE_NAMES_ENTRIES_NAME));
                }
                setEffectiveDates(rpoAlternateName, alterNameJSONObject);
                alternateNames.add(rpoAlternateName);
            });
        }
        if (!alternateNames.isEmpty()) {
            person.setAlternateNameEntries(alternateNames);
        }
    }

    private static void parseDepositEntries(JSONObject jsonObject, RPOLegalPerson person) {
        List<RPODepositEntry> depositEntries = new ArrayList<>();
        JSONArray depositEntriesJSONArr = jsonObject.getJSONArray(JSON_DEPOSIT_ENTRIES);
        if (depositEntriesJSONArr != null) {
            depositEntriesJSONArr.forEach(iterator -> {
                RPODepositEntry rpoDepositEntry = new RPODepositEntry();
                JSONObject depositJSONObject = (JSONObject) iterator;
                if (!depositJSONObject.isNull(JSON_FULL_NAME)) {
                    rpoDepositEntry.setFullName(depositJSONObject.getString(JSON_FULL_NAME));
                }
                if (!depositJSONObject.isNull(JSON_DEPOSIT_ENTRIES_PERSON_FORMATTED_NAME)) {
                    rpoDepositEntry.setPersonFormattedName(depositJSONObject.getString(JSON_DEPOSIT_ENTRIES_PERSON_FORMATTED_NAME));
                }
                if (!depositJSONObject.isNull(JSON_DEPOSIT_ENTRIES_DEPOSIT_AMOUNT)) {
                    rpoDepositEntry.setAmount(depositJSONObject.getFloat(JSON_DEPOSIT_ENTRIES_DEPOSIT_AMOUNT));
                }
                if (!depositJSONObject.isNull(JSON_DEPOSIT_ENTRIES_DEPOSIT_CURRENCY)) {
                    rpoDepositEntry.setCurrency(depositJSONObject.getString(JSON_DEPOSIT_ENTRIES_DEPOSIT_CURRENCY));
                }
                if (!depositJSONObject.isNull(JSON_DEPOSIT_ENTRIES_DEPOSIT_TYPE)) {
                    rpoDepositEntry.setType(depositJSONObject.getString(JSON_DEPOSIT_ENTRIES_DEPOSIT_TYPE));
                }
                setEffectiveDates(rpoDepositEntry, depositJSONObject);
                depositEntries.add(rpoDepositEntry);
            });
        }
        if (!depositEntries.isEmpty()) {
            person.setDepositEntries(depositEntries);
        }
    }

    private static void parseAuthorizationEntries(JSONObject jsonObject, RPOLegalPerson person) {
        List<RPOOneStringEntry> authorizationEntries = new ArrayList<>();
        JSONArray authorizationJSON = jsonObject.getJSONArray(JSON_AUTHORIZATION_ENTRIES);
        if (authorizationJSON != null) {
            authorizationJSON.forEach(authorization -> {
                JSONObject authorizationJSONObject = (JSONObject) authorization;
                RPOOneStringEntry rpoAuthorizationEntry = new RPOOneStringEntry();
                if (!authorizationJSONObject.isNull(JSON_AUTHORIZATION_ENTRIES_BODY)) {
                    rpoAuthorizationEntry.setBody(authorizationJSONObject.getString(JSON_AUTHORIZATION_ENTRIES_BODY));
                }
                setEffectiveDates(rpoAuthorizationEntry, authorizationJSONObject);
                authorizationEntries.add(rpoAuthorizationEntry);
            });
        }
        if (!authorizationEntries.isEmpty()) {
            person.setAuthorizationEntries(authorizationEntries);
        }
    }

    private static void parseEconomicActivityEntries(JSONObject jsonObject, RPOLegalPerson person) {
        List<RPOOneStringEntry> economicActivityEntries = new ArrayList<>();
        JSONArray economicActivityJSON = jsonObject.getJSONArray(JSON_ECONOMIC_ACTIVITY_ENTRIES);
        if (economicActivityJSON != null) {
            economicActivityJSON.forEach(economicActivity -> {
                JSONObject economicActivityJSONObject = (JSONObject) economicActivity;
                RPOOneStringEntry rpoEconomicActivityEntry = new RPOOneStringEntry();
                if (!economicActivityJSONObject.isNull(JSON_ECONOMIC_ACTIVITY_ENTRIES_DESCRIPTION)) {
                    rpoEconomicActivityEntry.setBody(economicActivityJSONObject.getString(JSON_ECONOMIC_ACTIVITY_ENTRIES_DESCRIPTION));
                }
                economicActivityEntries.add(rpoEconomicActivityEntry);
                setEffectiveDates(rpoEconomicActivityEntry, economicActivityJSONObject);
            });
        }
        if (!economicActivityEntries.isEmpty()) {
            person.setEconomicActivityEntries(economicActivityEntries);
        }
    }

    private static void parseEquityEntries(JSONObject jsonObject, RPOLegalPerson person) {
        List<RPOEquityEntry> equities = new ArrayList<RPOEquityEntry>();
        JSONArray equitiesJSON = jsonObject.getJSONArray(JSON_EQUITY_ENTRIES);
        if (equitiesJSON != null) {
            equitiesJSON.forEach(equity -> {
                RPOEquityEntry rpoEquityEntry = new RPOEquityEntry();
                JSONObject equityJSONObject = (JSONObject) equity;
                if (!equityJSONObject.isNull(JSON_EQUITY_ENTRIES_APPROVED_AMOUNT)) {
                    rpoEquityEntry.setApprovedAmount(equityJSONObject.getFloat(JSON_EQUITY_ENTRIES_APPROVED_AMOUNT));
                }
                if (!equityJSONObject.isNull(JSON_EQUITY_ENTRIES_APPROVED_CURRENCY)) {
                    rpoEquityEntry.setApprovedCurrency(equityJSONObject.getString(JSON_EQUITY_ENTRIES_APPROVED_CURRENCY));
                }
                if (!equityJSONObject.isNull(JSON_EQUITY_ENTRIES_PAID_AMOUNT)) {
                    rpoEquityEntry.setApprovedAmount(equityJSONObject.getFloat(JSON_EQUITY_ENTRIES_PAID_AMOUNT));
                }
                if (!equityJSONObject.isNull(JSON_EQUITY_ENTRIES_PAID_CURRENCY)) {
                    rpoEquityEntry.setApprovedCurrency(equityJSONObject.getString(JSON_EQUITY_ENTRIES_PAID_CURRENCY));
                }
                if (!equityJSONObject.isNull(JSON_EQUITY_ENTRIES_INVESTMENT_AMOUNT)) {
                    rpoEquityEntry.setApprovedAmount(equityJSONObject.getFloat(JSON_EQUITY_ENTRIES_INVESTMENT_AMOUNT));
                }
                if (!equityJSONObject.isNull(JSON_EQUITY_ENTRIES_INVESTMENT_CURRENCY)) {
                    rpoEquityEntry.setApprovedCurrency(equityJSONObject.getString(JSON_EQUITY_ENTRIES_INVESTMENT_CURRENCY));
                }
                setEffectiveDates(rpoEquityEntry, equityJSONObject);
                equities.add(rpoEquityEntry);
            });
        }
        if (!equities.isEmpty()) {
            person.setEquityEntries(equities);
        }
    }

    private static void parseLegalFormEntries(JSONObject jsonObject, RPOLegalPerson person) {
        List<RPOOneStringEntry> legalForms = new ArrayList<RPOOneStringEntry>();
        JSONArray legalFormsJSON = jsonObject.getJSONArray(JSON_LEGAL_FORM_ENTRIES);
        if (legalFormsJSON != null) {
            legalFormsJSON.forEach(legalFormIt -> {
                JSONObject legalFormEntryJSONObject = (JSONObject) legalFormIt;
                RPOOneStringEntry legalForm = new RPOOneStringEntry();
                if (!legalFormEntryJSONObject.isNull(JSON_LEGAL_FORM_ENTRIES_LEGAL_FORM)) {
                    JSONObject legalFormJSONObject = (JSONObject) legalFormEntryJSONObject.getJSONObject(JSON_LEGAL_FORM_ENTRIES_LEGAL_FORM);
                    if (!legalFormJSONObject.isNull(JSON_LEGAL_FORM_ENTRIES_LEGAL_FORM_NAME)) {
                        legalForm.setBody(legalFormJSONObject.getString(JSON_LEGAL_FORM_ENTRIES_LEGAL_FORM_NAME));
                        setEffectiveDates(legalForm, legalFormEntryJSONObject);
                        legalForms.add(legalForm);
                    }
                }
            });
        }
        if (!legalForms.isEmpty()) {
            person.setLegalForms(legalForms);
        }
    }

    private static void parseLegalStatusEntries(JSONObject jsonObject, RPOLegalPerson person) {
        List<RPOOneStringEntry> legalStatusEntries = new ArrayList<>();
        JSONArray legalStatusJSON = jsonObject.getJSONArray(JSON_LEGAL_STATUS_ENTRIES);
        if (legalStatusJSON != null) {
            legalStatusJSON.forEach(legalStatus -> {
                JSONObject legalStatusJSONObject = (JSONObject) legalStatus;
                RPOOneStringEntry rpoLegalStatusEntry = new RPOOneStringEntry();
                if (!legalStatusJSONObject.isNull(JSON_LEGAL_STATUS_ENTRIES_BODY)) {
                    rpoLegalStatusEntry.setBody(legalStatusJSONObject.getString(JSON_LEGAL_STATUS_ENTRIES_BODY));
                }
                setEffectiveDates(rpoLegalStatusEntry, legalStatusJSONObject);
                legalStatusEntries.add(rpoLegalStatusEntry);
            });
        }
        if (!legalStatusEntries.isEmpty()) {
            person.setLegalStatusEntries(legalStatusEntries);
        }
    }

    private static void parseNameEntries(JSONObject jsonObject, RPOLegalPerson person) {
        List<RPOOneStringEntry> nameEntries = new ArrayList<>();
        JSONArray nameJSON = jsonObject.getJSONArray(JSON_NAME_ENTRIES);
        if (nameJSON != null) {
            nameJSON.forEach(name -> {
                JSONObject nameJSONObject = (JSONObject) name;
                RPOOneStringEntry rpoNameEntry = new RPOOneStringEntry();
                if (!nameJSONObject.isNull(JSON_NAME_ENTRIES_NAME)) {
                    rpoNameEntry.setBody(nameJSONObject.getString(JSON_NAME_ENTRIES_NAME));
                }
                setEffectiveDates(rpoNameEntry, nameJSONObject);
                nameEntries.add(rpoNameEntry);
            });
        }
        if (!nameEntries.isEmpty()) {
            person.setNameEntries(nameEntries);
        }
    }

    private static void parsePredecessorSuccessorEntries(JSONObject jsonObject, RPOLegalPerson person, Boolean successor) {
        List<RPOPredecessorSuccessorEntry> predecessorSucessorEntries = new ArrayList<>();
        JSONArray predecessorSucessorJSON = jsonObject.getJSONArray(successor == true ? JSON_SUCCESSOR_ENTRIES : JSON_PREDECESSOR_ENTRIES);
        if (predecessorSucessorJSON != null) {
            predecessorSucessorJSON.forEach(it -> {
                JSONObject JSONObject = (JSONObject) it;
                System.out.println("pse");
                RPOPredecessorSuccessorEntry rpoPredecessorEntry = new RPOPredecessorSuccessorEntry();
                if (!JSONObject.isNull(JSON_ENTRIES_ICO)) {
                    rpoPredecessorEntry.setIco(JSONObject.getBigInteger(JSON_ENTRIES_ICO));
                }
                if (!JSONObject.isNull(JSON_ENTRIES_FULL_NAME)) {
                    rpoPredecessorEntry.setName(JSONObject.getString(JSON_ENTRIES_FULL_NAME));
                }
                setEffectiveDates(rpoPredecessorEntry, JSONObject);
                predecessorSucessorEntries.add(rpoPredecessorEntry);
            });
        }
        if (!predecessorSucessorEntries.isEmpty()) {
            if (successor == true) {
                person.setSuccessorEntries(predecessorSucessorEntries);
            } else {
                System.out.println("psed");
                person.setPredecessorEntries(predecessorSucessorEntries);
            }
        }
    }

    private static void parseShareEntries(JSONObject jsonObject, RPOLegalPerson person) {
        List<RPOShareEntry> shares = new ArrayList<RPOShareEntry>();
        JSONArray sharesJSON = jsonObject.getJSONArray(JSON_SHARE_ENTRIES);
        if (sharesJSON != null) {
            sharesJSON.forEach(shareIt -> {
                JSONObject shareJSONObject = (JSONObject) shareIt;
                RPOShareEntry share = new RPOShareEntry();
                if (!shareJSONObject.isNull(JSON_SHARE_ENTRIES_PRICE)) {
                    share.setPrice(shareJSONObject.getFloat(JSON_SHARE_ENTRIES_PRICE));
                }
                if (!shareJSONObject.isNull(JSON_SHARE_ENTRIES_CURRENCY)) {
                    share.setCurrency(shareJSONObject.getString(JSON_SHARE_ENTRIES_CURRENCY));
                }
                if (!shareJSONObject.isNull(JSON_SHARE_ENTRIES_AMOUNT)) {
                    share.setAmount(shareJSONObject.getInt(JSON_SHARE_ENTRIES_AMOUNT));
                }
                if (!shareJSONObject.isNull(JSON_SHARE_ENTRIES_TRANSFER)) {
                    share.setTransferDescription(shareJSONObject.getString(JSON_SHARE_ENTRIES_TRANSFER));
                }
                if (!shareJSONObject.isNull(JSON_SHARE_ENTRIES_TYPE)) {
                    JSONObject shareTypeJsonObject = (JSONObject) shareJSONObject.getJSONObject(JSON_SHARE_ENTRIES_TYPE);
                    if (!shareTypeJsonObject.isNull(JSON_SHARE_ENTRIES_NAME)) {
                        share.setType(shareTypeJsonObject.getString(JSON_SHARE_ENTRIES_NAME));
                    }
                }
                if (!shareJSONObject.isNull(JSON_SHARE_ENTRIES_FORM)) {
                    JSONObject shareFormJsonObject = (JSONObject) shareJSONObject.getJSONObject(JSON_SHARE_ENTRIES_FORM);
                    if (!shareFormJsonObject.isNull(JSON_SHARE_ENTRIES_NAME)) {
                        share.setForm(shareFormJsonObject.getString(JSON_SHARE_ENTRIES_NAME));
                    }
                }
                setEffectiveDates(share, shareJSONObject);
                shares.add(share);
            });
        }
        if (!shares.isEmpty()) {
            person.setShareEntries(shares);
        }
    }

    private static void parseStakeholderStatutoryEntries(JSONObject jsonObject, RPOLegalPerson person, boolean isStatutory) {
        List<RPOStatutoryStakeholderEntry> statutoriesStakeholders = new ArrayList<RPOStatutoryStakeholderEntry>();
        JSONArray jsonArray = jsonObject.getJSONArray(isStatutory ? JSON_STATUTORY_ENTRIES : JSON_STAKEHOLDER_ENTRIES);
        System.out.println("a");
        if (jsonArray != null) {
            jsonArray.forEach(iter -> {
                System.out.println("ab");
                JSONObject mainJSONObject = (JSONObject) iter;
                RPOStatutoryStakeholderEntry statutoryStakeholder = new RPOStatutoryStakeholderEntry();
                if (!mainJSONObject.isNull(JSON_FULL_NAME)) {
                    statutoryStakeholder.setFullName(mainJSONObject.getString(JSON_FULL_NAME));
                }
                if (!mainJSONObject.isNull(JSON_PERSON_FORMATTED_NAME)) {
                    statutoryStakeholder.setFormattedName(mainJSONObject.getString(JSON_PERSON_FORMATTED_NAME));
                }
                if (!mainJSONObject.isNull(JSON_ADDRESS_FORMATTED)) {
                    statutoryStakeholder.setFormattedAddress(mainJSONObject.getString(JSON_ADDRESS_FORMATTED));
                }
                if (!mainJSONObject.isNull(JSON_ADDRESS_STREET)) {
                    statutoryStakeholder.setStreet(mainJSONObject.getString(JSON_ADDRESS_STREET));
                }
                if (!mainJSONObject.isNull(JSON_ADDRESS_BUILDING_NR)) {
                    statutoryStakeholder.setBuildingNr(mainJSONObject.getString(JSON_ADDRESS_BUILDING_NR));
                }
                if (!mainJSONObject.isNull(JSON_ADDRESS_COUNTRY)) {
                    statutoryStakeholder.setCountry(mainJSONObject.getString(JSON_ADDRESS_COUNTRY));
                }
                if (!mainJSONObject.isNull(JSON_ADDRESS_DISTRICT)) {
                    statutoryStakeholder.setDistrict(mainJSONObject.getString(JSON_ADDRESS_DISTRICT));
                }
                if (!mainJSONObject.isNull(JSON_ADDRESS_MUNICIPALITY)) {
                    statutoryStakeholder.setMunicipality(mainJSONObject.getString(JSON_ADDRESS_MUNICIPALITY));
                }
                if (!mainJSONObject.isNull(JSON_ADDRESS_POSTAL_CODE)) {
                    statutoryStakeholder.setPostalCode(mainJSONObject.getString(JSON_ADDRESS_POSTAL_CODE));
                }
                if (!mainJSONObject.isNull(JSON_ENTRIES_ICO)) {
                    statutoryStakeholder.setIco(mainJSONObject.getString(JSON_ENTRIES_ICO));
                }
                if (!mainJSONObject.isNull(JSON_STAKEHOLDER_TYPE)) {
                    JSONObject stakeholderTypeJsonObject = (JSONObject) mainJSONObject.getJSONObject(JSON_STAKEHOLDER_TYPE);
                    if (!stakeholderTypeJsonObject.isNull(JSON_NAME)) {
                        statutoryStakeholder.setType(stakeholderTypeJsonObject.getString(JSON_NAME));
                    }
                }
                setEffectiveDates(statutoryStakeholder, mainJSONObject);
                statutoriesStakeholders.add(statutoryStakeholder);
            });
        }
        if (!statutoriesStakeholders.isEmpty()) {
            if (isStatutory) {
                System.out.println("abs");
                person.setStatutoryEntries(statutoriesStakeholders);
            } else {
                person.setStakeholderEntries(statutoriesStakeholders);
            }
        }
    }

    private static void parseMainActivityCode(JSONObject jsonObject, RPOLegalPerson person) {
        JSONObject maJSONObject = (JSONObject) jsonObject.getJSONObject(JSON_MAIN_ACTIVITY_CODE);
        if (!maJSONObject.isNull(JSON_NAME_ENTRIES_NAME)) {
            person.setMainActivityCode(maJSONObject.getString(JSON_NAME_ENTRIES_NAME));
        }
    }
    
    private static void parseESA2010Code(JSONObject jsonObject, RPOLegalPerson person) {
        JSONObject esaJSONObject = (JSONObject) jsonObject.getJSONObject(JSON_MAIN_ACTIVITY_CODE);
        if (!esaJSONObject.isNull(JSON_NAME_ENTRIES_NAME)) {
            person.setEsa2010Code(esaJSONObject.getString(JSON_NAME_ENTRIES_NAME));
        }
    }

private static void setEffectiveDates(AbstractRPOEntry identEntry, JSONObject jsonIdentifier) {
        if (!jsonIdentifier.isNull(JSON_EFFECTIVE_FROM)) {
            identEntry.setEffectiveFrom(LocalDate.parse(jsonIdentifier.getString(JSON_EFFECTIVE_FROM), DateTimeFormatter.ofPattern(DATE_FORMAT)));
        }
        if (!jsonIdentifier.isNull(JSON_EFFECTIVE_TO)) {
            identEntry.setEffectiveTo(LocalDate.parse(jsonIdentifier.getString(JSON_EFFECTIVE_TO), DateTimeFormatter.ofPattern(DATE_FORMAT)));
        }
    }
}
