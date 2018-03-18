/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author sprlajur
 */
@Entity
@Table(name = "orders")
@NamedQueries({
    @NamedQuery(name = "OrderEntity.findAll", query = "SELECT o FROM OrderEntity o")})
public class OrderEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    @Size(max = 255)
    @Column(name = "order_nr")
    private String orderNr;
    @Size(max = 255)
    @Column(name = "supplier")
    private String supplier;
    @Size(max = 2147483647)
    @Column(name = "order_text")
    private String orderText;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "value")
    private BigDecimal value;
    @Size(max = 255)
    @Column(name = "currency")
    private String currency;
    @Column(name = "production_date")
    @Temporal(TemporalType.DATE)
    private Date productionDate;
    @Column(name = "release_date")
    @Temporal(TemporalType.DATE)
    private Date releaseDate;
    @Size(max = 25)
    @Column(name = "ico")
    private String ico;
    @Size(max = 2147483647)
    @Column(name = "supplier_address")
    private String supplierAddress;
    @Size(max = 255)
    @Column(name = "office_organization_structure")
    private String officeOrganizationStructure;
    @Size(max = 255)
    @Column(name = "approver_name")
    private String approverName;
    @Size(max = 255)
    @Column(name = "approver_function")
    private String approverFunction;
    @Column(name = "issue_date")
    @Temporal(TemporalType.DATE)
    private Date issueDate;
    @Size(max = 2147483647)
    @Column(name = "release_notes")
    private String releaseNotes;
    @Size(max = 255)
    @Column(name = "completeness_status")
    private String completenessStatus;
    @Size(max = 20)
    @Column(name = "contract_nr")
    private String contractNr;
    @Size(max = 5)
    @Column(name = "contract_year")
    private String contractYear;

    public OrderEntity() {
    }

    public OrderEntity(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNr() {
        return orderNr;
    }

    public void setOrderNr(String orderNr) {
        this.orderNr = orderNr;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getOrderText() {
        return orderText;
    }

    public void setOrderText(String orderText) {
        this.orderText = orderText;
    }

    public BigDecimal getValue() {
        return value;
    }

    public void setValue(BigDecimal value) {
        this.value = value;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public Date getProductionDate() {
        return productionDate;
    }

    public void setProductionDate(Date productionDate) {
        this.productionDate = productionDate;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getIco() {
        return ico;
    }

    public void setIco(String ico) {
        this.ico = ico;
    }

    public String getSupplierAddress() {
        return supplierAddress;
    }

    public void setSupplierAddress(String supplierAddress) {
        this.supplierAddress = supplierAddress;
    }

    public String getOfficeOrganizationStructure() {
        return officeOrganizationStructure;
    }

    public void setOfficeOrganizationStructure(String officeOrganizationStructure) {
        this.officeOrganizationStructure = officeOrganizationStructure;
    }

    public String getApproverName() {
        return approverName;
    }

    public void setApproverName(String approverName) {
        this.approverName = approverName;
    }

    public String getApproverFunction() {
        return approverFunction;
    }

    public void setApproverFunction(String approverFunction) {
        this.approverFunction = approverFunction;
    }

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public String getReleaseNotes() {
        return releaseNotes;
    }

    public void setReleaseNotes(String releaseNotes) {
        this.releaseNotes = releaseNotes;
    }

    public String getCompletenessStatus() {
        return completenessStatus;
    }

    public void setCompletenessStatus(String completenessStatus) {
        this.completenessStatus = completenessStatus;
    }

    public String getContractNr() {
        return contractNr;
    }

    public void setContractNr(String contractNr) {
        this.contractNr = contractNr;
    }

    public String getContractYear() {
        return contractYear;
    }

    public void setContractYear(String contractYear) {
        this.contractYear = contractYear;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderEntity)) {
            return false;
        }
        OrderEntity other = (OrderEntity) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.OrderEntity[ id=" + id + " ]";
    }
    
}