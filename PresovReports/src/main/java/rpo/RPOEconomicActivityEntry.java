/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rpo;

import java.time.LocalDate;

/**
 *
 * @author sprlajur
 */
public class RPOEconomicActivityEntry extends AbstractRPOEntry {

    private String description;

    protected LocalDate suspendedFrom;

    protected LocalDate suspendedTo;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDate getSuspendedFrom() {
        return suspendedFrom;
    }

    public void setSuspendedFrom(LocalDate suspendedFrom) {
        this.suspendedFrom = suspendedFrom;
    }

    public LocalDate getSuspendedTo() {
        return suspendedTo;
    }

    public void setSuspendedTo(LocalDate suspendedTo) {
        this.suspendedTo = suspendedTo;
    }

}
