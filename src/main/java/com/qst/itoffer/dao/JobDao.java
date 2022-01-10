package com.qst.itoffer.dao;

import com.qst.itoffer.bean.Company;
import com.qst.itoffer.bean.Job;
import com.qst.itoffer.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JobDao {
    /**
     * 根据企业编号查询此企业的所有招聘岗位
     * @param companyID
     * @return
     */
    public List<Job> getJobListByCompanyID(String companyID) {
        List<Job> list = new ArrayList<Job>();
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //根据企业编号查询此企业的所有招聘岗位信息
        String sql = "select * from tb_job where company_id = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(companyID));
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setJobName(rs.getString("job_name"));
                job.setJobSalary(rs.getString("job_salary"));
                job.setJobArea(rs.getString("job_area"));
                job.setJobEnddate(rs.getTimestamp("job_endtime"));
                list.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return list;
    }

    /**
     * 根据职位编号查询职位详细信息
     * @param jobid
     * @return
     */
    public Job getJobByID(String jobid) {
        Job job = new Job();
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //根据职位编号查询职位信息和相关公司信息
        String sql = "select tb_job.*,company_pic,tb_company.company_id as tb_company_company_id from tb_job join tb_company on tb_job.company_id = tb_company.company_id where job_id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(jobid));
            rs = pstmt.executeQuery();
            while (rs.next()) {
                job.setJobId(rs.getInt("job_id"));
                job.setJobName(rs.getString("job_name"));
                job.setJobHiringnum(rs.getInt("job_hiringnum"));
                job.setJobSalary(rs.getString("job_salary"));
                job.setJobArea(rs.getString("job_area"));
                job.setJobDesc(rs.getString("job_desc"));
                job.setJobEnddate(rs.getTimestamp("job_endtime"));
                job.setJobState(rs.getInt("job_satate"));
                Company company = new Company();
                company.setCompanyId(rs.getInt("tb_company_company_id"));
                company.setCompanyPic(rs.getString("company_pic"));
                job.setCompany(company);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return job;
    }
}
