/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rpo;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 *
 * @author sprlajur
 */
public class RPOLegalPerson {

    private int rpo_id;
    
    private Long cin;
    
    private String name;
    
    private String formatted_address;
    
    private LocalDateTime createdAt;
    
    private LocalDate established_on;
    
    private LocalDate terminated_on;
    
    private String registration_office;
    
    private String registration_nr;

    public void setRegistration_nr(String registration_nr) {
        this.registration_nr = registration_nr;
    }

    public String getRegistration_nr() {
        return registration_nr;
    }

    public int getRpo_id() {
        return rpo_id;
    }

    public Long getCin() {
        return cin;
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

    public void setCin(Long cin) {
        this.cin = cin;
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

}
