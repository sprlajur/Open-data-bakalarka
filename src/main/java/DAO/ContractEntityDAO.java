/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.ContractEntity;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author sprlajur
 */
public class ContractEntityDAO extends AbstractEntityDAO{
    
    public ContractEntityDAO(EntityManager em){
        this.entityManager = em;
    }

    public List<ContractEntity> getAllContracts() {
        Query q = entityManager.createNamedQuery("ContractEntity.findAll");
        return q.getResultList();
    }
    
    public static String getIcoFromContract(ContractEntity contract, String partyName){
        String [] partiesICOs = contract.getPartiesIco().split(";;");
        for(int i = 0; i < partiesICOs.length; i++){
            if(partiesICOs[i].contains(partyName)){
                return partiesICOs[i].replaceAll("[^\\d.]", "");
            }
        }
        return null;
    }
}
