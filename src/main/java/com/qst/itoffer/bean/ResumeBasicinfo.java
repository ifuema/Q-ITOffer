package com.qst.itoffer.bean;

import com.qst.itoffer.dao.ResumeDao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ResumeBasicinfo {
    // 简历标识
    private int basicinfoId;
    // 姓名
    private String realName;
    // 性别
    private String gender;
    // 出生日期
    private Date birthday;
    // 当前所在地
    private String currentLoc;
    // 户口所在地
    private String residentLoc;
    // 手机
    private String telephone;
    // 邮件
    private String email;
    // 求职意向
    private String jobIntension;
    // 工作经验
    private String jobExperience;
    // 头像
    private String headShot;
    //简历信息更新结果
    private String resumeUpdateResult;
    //出生日期的字符串形式
    private String strbirthday;

    public ResumeBasicinfo() {
    }

    public ResumeBasicinfo(String realName, String gender, Date birthday, String currentLoc, String residentLoc, String telephone, String email, String jobIntension, String jobExperience) {
        this.realName = realName;
        this.gender = gender;
        this.birthday = birthday;
        this.currentLoc = currentLoc;
        this.residentLoc = residentLoc;
        this.telephone = telephone;
        this.email = email;
        this.jobIntension = jobIntension;
        this.jobExperience = jobExperience;
    }

    //更新简历信息，并将保存更新结果
    public void setResumeUpdate(ResumeBasicinfo resumeBasicinfo) {
        ResumeDao dao = new ResumeDao();
        try {
            dao.update(resumeBasicinfo);
            resumeUpdateResult = "更新成功！";
        } catch (Exception e) {
            resumeUpdateResult = "更新失败！";
        }
    }

    public int getBasicinfoId() {
        return basicinfoId;
    }

    public void setBasicinfoId(int basicinfoId) {
        this.basicinfoId = basicinfoId;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    //将birthday转换成String类型并更新strbirthday
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        this.strbirthday = birthday == null ? "" : sdf.format(birthday);
    }

    public String getCurrentLoc() {
        return currentLoc;
    }

    public void setCurrentLoc(String currentLoc) {
        this.currentLoc = currentLoc;
    }

    public String getResidentLoc() {
        return residentLoc;
    }

    public void setResidentLoc(String residentLoc) {
        this.residentLoc = residentLoc;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getJobIntension() {
        return jobIntension;
    }

    public void setJobIntension(String jobIntension) {
        this.jobIntension = jobIntension;
    }

    public String getJobExperience() {
        return jobExperience;
    }

    public void setJobExperience(String jobExperience) {
        this.jobExperience = jobExperience;
    }

    public String getHeadShot() {
        return headShot;
    }

    public void setHeadShot(String headShot) {
        this.headShot = headShot;
    }

    public String getStrbirthday() {
        return strbirthday;
    }

    //将strbirthday转换成Date类型并更新birthday
    public void setStrbirthday(String strbirthday) {
        this.strbirthday = strbirthday;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date birthdayDate = null;
        try {
            birthdayDate = sdf.parse(strbirthday);
        } catch (ParseException e) {
        }
        this.setBirthday(birthdayDate);
    }

    public String getResumeUpdateResult() {
        return resumeUpdateResult;
    }
}
