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
public class ContractEntityDAO extends AbstractEntityDAO {

    public ContractEntityDAO(EntityManager em) {
        this.entityManager = em;
    }

    public List<ContractEntity> getAllContracts() {
        return entityManager.createNamedQuery(ContractEntity.Q_CONTRACT_ENTITY_FIND_ALL)
                .getResultList();
    }

    public static String getIcoFromContract(ContractEntity contract, String partyName) {
        String[] partiesICOs = contract.getPartiesIco().split(";;");
        for (String partiesICO : partiesICOs) {
            if (partiesICO.contains(partyName)) {
                return partiesICO.replaceAll("[^0-9]", "");
            }
        }
        return null;
    }

    public ContractEntity getContractByID(Integer id) {
        return entityManager.find(ContractEntity.class, id);
    }

    public ContractEntity getContractByContractNr(String contractNr) {
        return entityManager.createNamedQuery(ContractEntity.Q_CONTRACT_ENTITY_FIND_BY_CONTRACT_NR, ContractEntity.class)
                .setParameter(ContractEntity.SQL_PARAM_CONTRACT_NR, contractNr)
                .getSingleResult();
    }
}
