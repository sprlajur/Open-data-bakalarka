/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.OrderEntity;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author sprlajur
 */
public class OrderEntityDAO extends AbstractEntityDAO {

    public OrderEntityDAO(EntityManager em) {
        this.entityManager = em;
    }

    public List<OrderEntity> findAll() {
        return entityManager.createNamedQuery(OrderEntity.Q_ORDER_ENTITY_FIND_ALL, OrderEntity.class)
                .getResultList();
    }

    public OrderEntity findByInternalNr(String orderNr) {
        return entityManager.createNamedQuery(OrderEntity.Q_ORDER_ENTITY_FIND_BY_INTERNAL_NR, OrderEntity.class)
                .setParameter(OrderEntity.SQL_PARAM_INTERNAL_NR, orderNr)
                .getSingleResult();
    }
}
