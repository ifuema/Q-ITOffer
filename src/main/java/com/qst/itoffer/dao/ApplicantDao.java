package com.qst.itoffer.dao;

import com.qst.itoffer.util.DBUtil;

import java.sql.*;
import java.util.Date;

public class ApplicantDao {
    /**
     * 验证Email是否被注册
     * @param email
     * @return
     */
    public boolean isExistEmail(String email) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //查询指定邮箱的结果
        String sql = "select * from tb_applicant where applicant_email = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            //若已有记录则返回true
            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return false;
    }

    /**
     * 求职者信息注册保存
     * @param email
     * @param password
     */
    public void save(String email, String password) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        //插入一条求职者数据
        String sql = "insert into tb_applicant values (null,?,?,?)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            //实例化一个Date获取毫秒数，用来构造一个Timestamp对象
            pstmt.setTimestamp(3, new Timestamp(new Date().getTime()));

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pstmt, conn);
        }
    }

    /**
     * 注册用户登录
     * @param email
     * @param password
     * @return
     */
    public int login(String email, String password) {
        int applicantID = 0;
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //查询数据库内符合用户输入信息的记录
        String sql = "select applicant_id from tb_applicant where applicant_email = ? and applicant_pwd = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            //若有记录则将id替换为查询到的id
            if (rs.next()) {
                applicantID = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return applicantID;
    }

    /**
     * 判断是否已有简历
     * @param applicantID
     * @return
     */
    public int isExistResume(int applicantID) {
        int resumeID = 0;
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //查询指定求职者id的简历，并降序排列
        String sql = "select basicinfo_id from tb_resume_basicinfo where applicant_id = ? order by basicinfo_id desc";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, applicantID);
            rs = pstmt.executeQuery();
            //若有记录则取第一条（最后更新的）简历id
            if (rs.next()) {
                resumeID = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return resumeID;
    }
}
