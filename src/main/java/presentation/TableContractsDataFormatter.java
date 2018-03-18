/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation;

import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author sprlajur
 */
public class TableContractsDataFormatter {

    private static final int MAX_SUBJECT_LENGTH = 150;

    public static Object dataOrEmptyString(Object data) {
        if (data == null) {
            return "";
        }
        return data;
    }

    public static String dateFormatter(String dbDate) {
        if (dbDate == null) {
            return "";
        }
        return LocalDate.parse(dbDate).format(DateTimeFormatter.
                ofPattern("dd.MM.yyyy"));
    }

    public static String formatSubject(String data) {
        if (data == null) {
            return "";
        }
        if (data.length() < 150) {
            data = data.trim().substring(0, data.length());
        } else {
            data = data.trim().substring(0, MAX_SUBJECT_LENGTH) + "...";
        }
        return data.trim();
    }

    public static String formatParties(String data, int partyOrd) {
        if (data == null) {
            return "";
        }
        try {
            data = data.split(";;")[partyOrd];
        } catch (IndexOutOfBoundsException e) {
            return "";
        }
        data = data.trim();
        return data.charAt(data.length() - 1) == ',' ? data.substring(0, data.length() - 1) : data;
    }
}
