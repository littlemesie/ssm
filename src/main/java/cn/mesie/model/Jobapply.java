package cn.mesie.model;

public class Jobapply {

    private Integer id;
    private Integer stuid;
    private Integer recruitid;
    private Integer comid;
    private Integer resumeid;
    private Integer status;

    private Company company;
    private Recruit recruit;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public Integer getRecruitid() {
        return recruitid;
    }

    public void setRecruitid(Integer recruitid) {
        this.recruitid = recruitid;
    }

    public Integer getComid() {
        return comid;
    }

    public void setComid(Integer comid) {
        this.comid = comid;
    }

    public Integer getResumeid() {
        return resumeid;
    }

    public void setResumeid(Integer resumeid) {
        this.resumeid = resumeid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Recruit getRecruit() {
        return recruit;
    }

    public void setRecruit(Recruit recruit) {
        this.recruit = recruit;
    }
}
