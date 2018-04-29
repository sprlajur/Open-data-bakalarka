/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rpo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 *
 * @author sprlajur
 */
public class RPOLegalPerson {

//    available through premium API
    private int rpo_id;

    private String name;

    private String formatted_address;

    private LocalDateTime createdAt;

    private LocalDate established_on;

    private LocalDate terminated_on;

    private String registration_office;

    private String registration_nr;

//    available through RPO api
    private String source_register;

    private String rpo_API_url;

    private String accounting_entities_API_url;

    private String main_activity_code;

    private String esa2010_code;

    private List<RPOAddressEntry> addressEntries;

    private List<RPOAlternateNameEntry> alternateNameEntries;

    private List<RPOAuthorizationEntry> authorizationEntries;

    private List<RPODepositEntry> depositEntries;

    private List<RPOEconomicActivityEntry> economicActivityEntries;

    private List<RPOEquityEntry> equityEntries;

    public void setRegistration_nr(String registration_nr) {
        this.registration_nr = registration_nr;
    }

    public String getRegistration_nr() {
        return registration_nr;
    }

    public int getRpo_id() {
        return rpo_id;
    }

    public String getName() {
        return name;
    }

    public String getFormatted_address() {
        return formatted_address;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDate getEstablished_on() {
        return established_on;
    }

    public LocalDate getTerminated_on() {
        return terminated_on;
    }

    public String getRegistration_office() {
        return registration_office;
    }

    public void setRpo_id(int rpo_id) {
        this.rpo_id = rpo_id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setFormatted_address(String formatted_address) {
        this.formatted_address = formatted_address;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public void setEstablished_on(LocalDate established_on) {
        this.established_on = established_on;
    }

    public void setTerminated_on(LocalDate terminated_on) {
        this.terminated_on = terminated_on;
    }

    public void setRegistration_office(String registration_office) {
        this.registration_office = registration_office;
    }

    public String getSource_register() {
        return source_register;
    }

    public String getRpo_API_url() {
        return rpo_API_url;
    }

    public String getAccounting_entities_API_url() {
        return accounting_entities_API_url;
    }

    public void setSource_register(String source_register) {
        this.source_register = source_register;
    }

    public void setRpo_API_url(String rpo_API_url) {
        this.rpo_API_url = rpo_API_url;
    }

    public void setAccounting_entities_API_url(String accounting_entities_API_url) {
        this.accounting_entities_API_url = accounting_entities_API_url;
    }

    public List<RPOAddressEntry> getAddressEntries() {
        return addressEntries;
    }

    public void setAddressEntries(List<RPOAddressEntry> addressEntries) {
        this.addressEntries = addressEntries;
    }

    public List<RPOAlternateNameEntry> getAlternateNameEntries() {
        return alternateNameEntries;
    }

    public void setAlternateNameEntries(List<RPOAlternateNameEntry> alternateNames) {
        this.alternateNameEntries = alternateNames;
    }

    public String getMain_activity_code() {
        return main_activity_code;
    }

    public void setMain_activity_code(String main_activity_code) {
        this.main_activity_code = main_activity_code;
    }

    public String getEsa2010_code() {
        return esa2010_code;
    }

    public void setEsa2010_code(String esa2010_code) {
        this.esa2010_code = esa2010_code;
    }

    public List<RPOAuthorizationEntry> getAuthorizationEntries() {
        return authorizationEntries;
    }

    public void setAuthorizationEntries(List<RPOAuthorizationEntry> authorizationEntries) {
        this.authorizationEntries = authorizationEntries;
    }

    public List<RPODepositEntry> getDepositEntries() {
        return depositEntries;
    }

    public void setDepositEntries(List<RPODepositEntry> depositEntries) {
        this.depositEntries = depositEntries;
    }

    public List<RPOEquityEntry> getEquityEntries() {
        return equityEntries;
    }

    public void setEquityEntries(List<RPOEquityEntry> equityEntries) {
        this.equityEntries = equityEntries;
    }

    @Override
    public String toString() {
        return "RPOLegalPerson{" + "rpo_id=" + rpo_id + ", name=" + name + ", formatted_address=" + formatted_address + ", createdAt=" + createdAt + ", established_on=" + established_on + ", terminated_on=" + terminated_on + ", registration_office=" + registration_office + ", registration_nr=" + registration_nr + '}';
    }

    public List<RPOEconomicActivityEntry> getEconomicActivityEntries() {
        return economicActivityEntries;
    }

    public void setEconomicActivityEntries(List<RPOEconomicActivityEntry> economicActivityEntries) {
        this.economicActivityEntries = economicActivityEntries;
    }

}
