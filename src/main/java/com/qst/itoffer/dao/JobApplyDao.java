package com.qst.itoffer.dao;

import com.qst.itoffer.bean.Company;
import com.qst.itoffer.bean.Job;
import com.qst.itoffer.bean.JobApply;
import com.qst.itoffer.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class JobApplyDao {
    /**
     * 查询职位申请列表
     * @param applicantId
     * @return
     */
    public List<JobApply> getJobApplyList(int applicantId) {
        List<JobApply> list = new ArrayList<JobApply>();
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //根据求职者id查询求职者信息、申请职位信息、公司信息
        String sql = "select a.apply_id,a.apply_state,a.apply_date,j.job_id,j.job_name,c.company_id,c.company_name from tb_jobapply a join tb_job j on a.job_id = j.job_id join tb_company c on j.company_id = c.company_id where a.applicant_id = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, applicantId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                JobApply ja = new JobApply();
                ja.setApplyId(rs.getInt(1));
                ja.setApplyState(rs.getInt(2));
                ja.setApplicantId(applicantId);
                ja.setApplyDate(rs.getTimestamp(3));
                Job job = new Job();
                job.setJobId(rs.getInt(4));
                job.setJobName(rs.getString(5));
                Company company = new Company();
                company.setCompanyId(rs.getInt(6));
                company.setCompanyName(rs.getString(7));
                job.setCompany(company);
                ja.setJob(job);
                list.add(ja);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return list;
    }

    /**
     * 保存职位申请信息
     * @param jobid
     * @param applicantId
     */
    public void save(String jobid, int applicantId) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        //插入一条职位申请信息
        String sql = "insert into tb_jobapply values(null,?,?,?,?)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(jobid));
            pstmt.setInt(2, applicantId);
            pstmt.setTimestamp(3, new Timestamp(new Date().getTime()));
            //设置职位申请状态
            pstmt.setInt(4, 1);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(null, pstmt, conn);
        }
    }
}
