package com.qst.itoffer.dao;

import com.qst.itoffer.bean.ResumeBasicinfo;
import com.qst.itoffer.util.DBUtil;

import java.sql.*;

public class ResumeDao {
    /**
     * 简历基本信息添加和主键标识查询
     * @param basicinfo
     * @param applicantID
     * @return
     */
    public int add(ResumeBasicinfo basicinfo, int applicantID) {
        int basicinfoID = 0;
        //添加一条新简历信息
        String sql = "insert into tb_resume_basicinfo values(null,?,?,?,?,?,?,?,?,?,?,?)";

        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //关闭事务自动提交
            conn.setAutoCommit(false);

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, applicantID);
            pstmt.setString(2, basicinfo.getRealName());
            pstmt.setString(3, basicinfo.getGender());
            pstmt.setTimestamp(4, basicinfo.getBirthday() == null ? null : new Timestamp(basicinfo.getBirthday().getTime()));
            pstmt.setString(5, basicinfo.getCurrentLoc());
            pstmt.setString(6, basicinfo.getResidentLoc());
            pstmt.setString(7, basicinfo.getTelephone());
            pstmt.setString(8, basicinfo.getEmail());
            pstmt.setString(9, basicinfo.getJobIntension());
            pstmt.setString(10, basicinfo.getJobExperience());
            pstmt.setString(11, basicinfo.getHeadShot());
            pstmt.executeUpdate();
            //根据求职者id查询简历id
            String sql2 = "select basicinfo_id from tb_resume_basicinfo where applicant_id = ?";

            pstmt = conn.prepareStatement(sql2);
            pstmt.setInt(1, applicantID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                basicinfoID = rs.getInt(1);
            }
            //事务提交
            conn.commit();

        } catch (SQLException e) {
            try {
                //事务回滚
                conn.rollback();

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return basicinfoID;
    }

    /**
     * 简历照片更新
     * @param basicinfoId
     * @param newFileName
     */
    public void updateHeadShot(int basicinfoId, String newFileName) {
        //更新简历照片名字
        String sql = "update tb_resume_basicinfo set head_shot = ? where basicinfo_id = ?";
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newFileName);
            pstmt.setInt(2, basicinfoId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pstmt, conn);
        }
    }

    /**
     * 根据用户标识查询简历基本信息
     * @param applicantID
     * @return
     */
    public ResumeBasicinfo selectBasicinfoByID(int applicantID) {
        ResumeBasicinfo resume = new ResumeBasicinfo();
        //查询指定求职者id的简历信息，并降序排列
        String sql = "select * from tb_resume_basicinfo where applicant_id = ? order by basicinfo_id desc";

        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, applicantID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                //将查询结果封装到JavaBean对象ResumeBasicinfo中
                resume.setBasicinfoId(rs.getInt("basicinfo_id"));
                resume.setBirthday(rs.getTimestamp("birthday"));
                resume.setCurrentLoc(rs.getString("current_loc"));
                resume.setEmail(rs.getString("email"));
                resume.setGender(rs.getString("gender"));
                resume.setHeadShot(rs.getString("head_shot"));
                resume.setJobExperience(rs.getString("job_experience"));
                resume.setJobIntension(rs.getString("job_intension"));
                resume.setRealName(rs.getString("realname"));
                resume.setResidentLoc(rs.getString("resident_loc"));
                resume.setTelephone(rs.getString("telephone"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return resume;
    }

    /**
     * 更新简历基本信息
     * @param basicinfo
     */
    public void update(ResumeBasicinfo basicinfo) {
        //更新简历基本信息
        String sql = "update tb_resume_basicinfo set realname = ?,gender = ?,birthday = ?,current_loc = ?,resident_loc = ?,telephone = ?,email = ?,job_intension = ?,job_experience = ? where basicinfo_id = ?";

        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, basicinfo.getRealName());
            pstmt.setString(2, basicinfo.getGender());
            pstmt.setTimestamp(3, basicinfo.getBirthday() == null ? null : new Timestamp(basicinfo.getBirthday().getTime()));
            pstmt.setString(4, basicinfo.getCurrentLoc());
            pstmt.setString(5, basicinfo.getResidentLoc());
            pstmt.setString(6, basicinfo.getTelephone());
            pstmt.setString(7, basicinfo.getEmail());
            pstmt.setString(8, basicinfo.getJobIntension());
            pstmt.setString(9, basicinfo.getJobExperience());
            pstmt.setInt(10, basicinfo.getBasicinfoId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pstmt, conn);
        }
    }
}
