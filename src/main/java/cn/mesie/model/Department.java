package cn.mesie.model;

public class Department {

    private Integer id;
    private String name;
    private int instituid;
    private int universityid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public int getUniversityid() {
        return universityid;
    }

    public void setUniversityid(int universityid) {
        this.universityid = universityid;
    }
}
