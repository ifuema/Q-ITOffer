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

public class CompanyDao {
    /**
     * 查询所有正在招聘中的企业信息及该企业的最新职位信息
     * @return
     */
    public List<Company> getCompanyList() {
        List<Company> list = new ArrayList<Company>();
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select tb_company.company_id,company_pic,job_id,job_name,job_salary,job_area,job_endtime from tb_company left outer join tb_job on tb_job.company_id=tb_company.company_id where company_state=1 and job_id in(select max(job_id) from tb_job where job_satate=1 group by company_id)";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Company company = new Company();
                Job job = new Job();
                company.setCompanyId(rs.getInt("company_id"));
                company.setCompanyPic(rs.getString("company_pic"));
                job.setJobId(rs.getInt("job_id"));
                job.setJobName(rs.getString("job_name"));
                job.setJobArea(rs.getString("job_area"));
                job.setJobSalary(rs.getString("job_salary"));
                job.setJobEnddate(rs.getTimestamp("job_endtime"));
                company.getJobs().add(job);
                list.add(company);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return list;
    }

    /**
     * 根据企业标识查询企业详情
     * @param companyID
     * @return
     */
    public Company getCompanyByID(String companyID) {
        Company company = new Company();
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //根据企业标识查询企业所有信息
        String sql = "select * from tb_company where company_id = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(companyID));
            rs = pstmt.executeQuery();
            while (rs.next()) {
                company.setCompanyId(rs.getInt("company_id"));
                company.setCompanyArea(rs.getString("company_area"));
                company.setCompanyBrief(rs.getString("company_brief"));
                company.setCompanyPic(rs.getString("company_pic"));
                company.setCompanySize(rs.getString("company_size"));
                company.setCompanyType(rs.getString("company_type"));
                company.setCompanyViewnum(rs.getInt("company_viewnum"));
                company.setCompanyName(rs.getString("company_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return company;
    }

    /**
     * 查询所需分页的总记录数
     * @return
     */
    public int getRecordCount() {
        int recordCount = 0;
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //查询所有正在招聘中且有正在招聘职位的企业总数
        String sql = "select count(*) from tb_company left outer join tb_job on tb_job.company_id=tb_company.company_id where company_state=1 and job_id in(select max(job_id) from tb_job where job_satate=1 group by company_id)";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                recordCount = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return recordCount;
    }

    /**
     * 分页查询首页所需要的所有企业信息及职位信息
     * @param pageNo
     * @param pageSize
     * @return
     */
    public List<Company> getCompanyPageList(int pageNo, int pageSize) {
        //定义本页记录的起始索引值
        int firstIndex = pageSize * (pageNo - 1);

        List<Company> list = new ArrayList<Company>();
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //查询给定索引内的所有正在招聘中的企业信息及该企业的最新职位信息
        String sql = "select tb_company.company_id,company_pic,job_id,job_name,job_salary,job_area,job_endtime from tb_company left outer join tb_job on tb_job.company_id=tb_company.company_id where company_state=1 and job_id in(select max(job_id) from tb_job where job_satate=1 group by company_id) limit ?,?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, firstIndex);
            //终止索引
            pstmt.setInt(2, firstIndex + pageSize);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                Company company = new Company();
                Job job = new Job();
                company.setCompanyId(rs.getInt("company_id"));
                company.setCompanyPic(rs.getString("company_pic"));
                job.setJobId(rs.getInt("job_id"));
                job.setJobName(rs.getString("job_name"));
                job.setJobArea(rs.getString("job_area"));
                job.setJobSalary(rs.getString("job_salary"));
                job.setJobEnddate(rs.getTimestamp("job_endtime"));
                company.getJobs().add(job);
                list.add(company);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeJDBC(rs, pstmt, conn);
        }
        return list;
    }
}
