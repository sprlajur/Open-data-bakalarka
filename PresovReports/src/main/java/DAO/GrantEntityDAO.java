/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.GrantEntity;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author sprlajur
 */
public class GrantEntityDAO extends AbstractEntityDAO {
    
    public GrantEntityDAO(EntityManager em){
        this.entityManager = em;
    }
    
    public List<GrantEntity> findAll(){
        return entityManager.createNamedQuery(GrantEntity.Q_GRANT_ENTITY_FIND_ALL)
                .getResultList();
    }
}
