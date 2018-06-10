package cn.mesie.model;

public class Major {

    private int id;
    private String name;
    private int instituid;
    private int departmentid;
    private int universityid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getInstituid() {
        return instituid;
    }

    public void setInstituid(int instituid) {
        this.instituid = instituid;
    }

    public int getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(int departmentid) {
        this.departmentid = departmentid;
    }

    public int getUniversityid() {
        return universityid;
    }

    public void setUniversityid(int universityid) {
        this.universityid = universityid;
    }
}
