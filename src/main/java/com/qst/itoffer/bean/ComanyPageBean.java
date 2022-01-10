package com.qst.itoffer.bean;

import com.qst.itoffer.dao.CompanyDao;

import java.util.ArrayList;
import java.util.List;

public class ComanyPageBean {
    //每页显示记录数
    private int pageSize = 10;
    //当前页码
    private int pageNo = 1;
    //总页数
    private int totalPages;
    //每页数据记录集合
    private List<Company> pageData = new ArrayList<Company>();
    //是否有下一页
    private boolean hasNextPage;
    //是否有上一页
    private boolean hasPreviousPage;

    public ComanyPageBean() {
    }

    public ComanyPageBean(int pageSize, int pageNo) {
        this.pageSize = pageSize;
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getTotalPages() {
        //获取总记录数
        CompanyDao dao = new CompanyDao();
        int recordCount = dao.getRecordCount();
        //返回总页数
        return (recordCount + pageSize - 1) / pageSize;
    }

    public List<Company> getPageData() {
        //查询当页记录
        CompanyDao dao = new CompanyDao();
        List<Company> list = dao.getCompanyPageList(pageNo, pageSize);
        return list;
    }

    //若当前页数小于总页数，则有下一页
    public boolean isHasNextPage() {
        return (this.getPageNo() < this.getTotalPages());
    }

    //若当前页数大于1，则有上一页
    public boolean isHasPreviousPage() {
        return (this.getPageNo() > 1);
    }
}
