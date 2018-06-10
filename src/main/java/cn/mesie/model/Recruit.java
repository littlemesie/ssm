package cn.mesie.model;

import java.util.Date;

public class Recruit {

    private Integer id;
    private Integer companyId;
    private Integer type;
    private String title;
    private String publishdate;
    private String workingcity;
    private Integer salaryllimit;
    private String jobcontent;
    private Integer recruitnum;
    private String contactperson;
    private String phone;
    private String email;

    private Company company;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPublishdate() {
        return publishdate;
    }

    public void setPublishdate(String publishdate) {
        this.publishdate = publishdate;
    }

    public String getWorkingcity() {
        return workingcity;
    }

    public void setWorkingcity(String workingcity) {
        this.workingcity = workingcity;
    }

    public Integer getSalaryllimit() {
        return salaryllimit;
    }

    public void setSalaryllimit(Integer salaryllimit) {
        this.salaryllimit = salaryllimit;
    }

    public String getJobcontent() {
        return jobcontent;
    }

    public void setJobcontent(String jobcontent) {
        this.jobcontent = jobcontent;
    }

    public Integer getRecruitnum() {
        return recruitnum;
    }

    public void setRecruitnum(Integer recruitnum) {
        this.recruitnum = recruitnum;
    }

    public String getContactperson() {
        return contactperson;
    }

    public void setContactperson(String contactperson) {
        this.contactperson = contactperson;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }
}
