/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.InvoiceEntity;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author sprlajur
 */
public class InvoiceEntityDAO extends AbstractEntityDAO{
    
    public InvoiceEntityDAO(EntityManager em){
        this.entityManager = em;
    }
    
    public List<InvoiceEntity> findAll(){
        return entityManager.createNamedQuery(InvoiceEntity.Q_INVOICE_ENTITY_FIND_ALL, InvoiceEntity.class)
                .getResultList();
    }
}
