package cn.mesie.model;

import java.util.Date;

public class Internship {

    private Integer id;
    private Integer stuid;
    private Integer comid;
    private String position;
    private String jobintro;
    private String jobcontent;
    private String outcome;
    private String starttime;
    private String endtime;
    private String instructor;
    private String instructorphone;
    private Integer state;

    Student student;

    Company company;

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

    public Integer getComid() {
        return comid;
    }

    public void setComid(Integer comid) {
        this.comid = comid;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getJobintro() {
        return jobintro;
    }

    public void setJobintro(String jobintro) {
        this.jobintro = jobintro;
    }

    public String getJobcontent() {
        return jobcontent;
    }

    public void setJobcontent(String jobcontent) {
        this.jobcontent = jobcontent;
    }

    public String getOutcome() {
        return outcome;
    }

    public void setOutcome(String outcome) {
        this.outcome = outcome;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public String getInstructorphone() {
        return instructorphone;
    }

    public void setInstructorphone(String instructorphone) {
        this.instructorphone = instructorphone;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }
}
