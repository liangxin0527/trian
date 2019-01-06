package com.dgut.trian.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgut.trian.bean.Admin;
import com.dgut.trian.bean.Teacher;
@WebFilter(filterName="AdminFilter",urlPatterns="/admin/*")
public class AdminFilter implements Filter {

   
    public AdminFilter() {
        // TODO Auto-generated constructor stub
    }

	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest hrequest=(HttpServletRequest) request;
		HttpServletResponse hresponse=(HttpServletResponse) response;
		Teacher teacher=(Teacher) hrequest.getSession().getAttribute("teacher");
		Admin admin=(Admin) hrequest.getSession().getAttribute("admin");
		if(teacher==null&&admin==null){
			hresponse.sendRedirect(hrequest.getContextPath()+"/jsp/index.jsp");
		}
		else{
			chain.doFilter(hrequest, hresponse);
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
