package com.qst.itoffer.bean;

import java.util.Date;

public class Applicant {
    //求职者标识
    private int applicantId;
    //求职者邮箱
    private String applicantEmail;
    //求职者密码
    private String applicantPwd;
    //求职者注册时间
    private Date applicantRegistDate;

    public Applicant() {
    }

    public Applicant(int applicantId, String applicantEmail, String applicantPwd) {
        this.applicantId = applicantId;
        this.applicantEmail = applicantEmail;
        this.applicantPwd = applicantPwd;
    }

    public int getApplicantId() {
        return applicantId;
    }

    public void setApplicantId(int applicantId) {
        this.applicantId = applicantId;
    }

    public String getApplicantEmail() {
        return applicantEmail;
    }

    public void setApplicantEmail(String applicantEmail) {
        this.applicantEmail = applicantEmail;
    }

    public String getApplicantPwd() {
        return applicantPwd;
    }

    public void setApplicantPwd(String applicantPwd) {
        this.applicantPwd = applicantPwd;
    }

    public Date getApplicantRegistDate() {
        return applicantRegistDate;
    }

    public void setApplicantRegistDate(Date applicantRegistDate) {
        this.applicantRegistDate = applicantRegistDate;
    }
}
