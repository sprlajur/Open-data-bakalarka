/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rpo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
    
    public static RPOLegalPerson parseData(String jsonData) {
        if (jsonData == null || jsonData.isEmpty()) {
            return null;
        }
        RPOLegalPerson result = new RPOLegalPerson();
        try {
            JSONObject obj = new JSONObject(jsonData);
            if (!obj.isNull(JSON_ID)) {
                result.setRpo_id(obj.getInt(JSON_ID));
            }
            if (!obj.isNull(JSON_NAME)) {
                result.setName(obj.getString(JSON_NAME));
            }
            if (!obj.isNull(JSON_FORMATTED_ADDRESS)) {
                result.setFormatted_address(obj.getString(JSON_FORMATTED_ADDRESS));
            }
            if (!obj.isNull(JSON_CREATED_AT)) {
                result.setCreatedAt(LocalDateTime.parse(obj.getString(JSON_CREATED_AT), DateTimeFormatter.ofPattern(DATE_TIME_FORMAT)));
            }
            if (!obj.isNull(JSON_REGISTRATION_OFFICE)) {
                result.setRegistration_office(obj.getString(JSON_REGISTRATION_OFFICE));
            }
            if (!obj.isNull(JSON_REGISTRATION_NUMBER)) {
                result.setRegistration_nr(obj.getString(JSON_REGISTRATION_NUMBER));
            }
            if (!obj.isNull(JSON_ESTABLISHED_ON)) {
                result.setEstablished_on(LocalDate.parse(obj.getString(JSON_ESTABLISHED_ON), DateTimeFormatter.ofPattern(DATE_FORMAT)));
            }
            if (!obj.isNull(JSON_TERMINATED_ON)) {
                result.setTerminated_on(LocalDate.parse(obj.getString(JSON_TERMINATED_ON), DateTimeFormatter.ofPattern(DATE_FORMAT)));
            }
        } catch (JSONException | NumberFormatException e) {
            e.printStackTrace();
        }
        return result;
    }
}
