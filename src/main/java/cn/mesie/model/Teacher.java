package cn.mesie.model;

public class Teacher {

    private Integer teaid;
    private String teaname;
    private Integer universityid;
    private Integer instituid;
    private Integer departmentid;
    private String email;
    private String mobilephone;
    private String qq;
    private String wechat;

    Department department;

    Institution institution;

    public Integer getTeaid() {
        return teaid;
    }

    public void setTeaid(Integer teaid) {
        this.teaid = teaid;
    }

    public String getTeaname() {
        return teaname;
    }

    public void setTeaname(String teaname) {
        this.teaname = teaname;
    }

    public Integer getUniversityid() {
        return universityid;
    }

    public void setUniversityid(Integer universityid) {
        this.universityid = universityid;
    }

    public Integer getInstituid() {
        return instituid;
    }

    public void setInstituid(Integer instituid) {
        this.instituid = instituid;
    }

    public Integer getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobilephone() {
        return mobilephone;
    }

    public void setMobilephone(String mobilephone) {
        this.mobilephone = mobilephone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Institution getInstitution() {
        return institution;
    }

    public void setInstitution(Institution institution) {
        this.institution = institution;
    }
}
