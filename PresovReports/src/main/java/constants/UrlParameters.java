/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package constants;

/**
 *
 * @author sprlajur
 */
public enum UrlParameters {
    PARTY_DETAIL_ICO_PARAMETER("ico");

    private final String parameter;

    UrlParameters(String parameter) {
        this.parameter = parameter;
    }

    public String getURLParameter() {
        return "?" + parameter + "=";
    }
    
    public String getParameter(){
        return parameter;
    }
}
