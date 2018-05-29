package ph.utils;

import javax.servlet.annotation.WebFilter;
import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import ph.po.User;

//@WebFilter(filterName = "AuthenticFilter")
@WebFilter("/*")
public class AuthenticFilter implements Filter
{
    private static List<String> adminAuths = new ArrayList<String>();

    static
    {
        adminAuths.add("/index.jsp");

        adminAuths.add("/vetsearch.jsp");
        adminAuths.add("/vetsearch_result.jsp");
        adminAuths.add("/vetadd.jsp");

        adminAuths.add("/customersearch.jsp");
        adminAuths.add("/customersearch_result.jsp");
        adminAuths.add("/customerdetail.jsp");
        adminAuths.add("/customeradd.jsp");

        adminAuths.add("/petSearch.jsp");
        adminAuths.add("/petSearchResult.jsp");
        adminAuths.add("/newPetAdd.jsp");

        adminAuths.add("/visitSearch.jsp");
        adminAuths.add("/visitSearchResult.jsp");
        adminAuths.add("/addCaseHistory.jsp");
        adminAuths.add("/showCaseHistory.jsp");
    }
    public void destroy()
    {
        System.out.println("身份验证过滤器已销毁");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException
    {
        HttpServletRequest httpreq = (HttpServletRequest) request;
        HttpSession session = httpreq.getSession(true);
        String requestURI = httpreq.getRequestURI();
        requestURI = requestURI.substring(requestURI.lastIndexOf("/"));
        System.out.println("身份验证过滤器URI：" + requestURI);
        if (adminAuths.contains(requestURI))
        {
            User user = (User) session.getAttribute("user");
            if (user == null)
            {
                request.setAttribute("msg", "请先登录");
                request.getRequestDispatcher("/index.jsp").forward(httpreq, response);
            }
            else if (user.getRole().equals("admin"))
            {
                System.out.println("当前登录用户是系统管理员");
                chain.doFilter(request, response);
            }
            else
            {
                request.setAttribute("msg", "该页面只有管理员能够访问");
                request.getRequestDispatcher("/index.jsp").forward(httpreq, response);
            }
        }
        else
        {
            chain.doFilter(request, response);
        }
    }

    public void init(FilterConfig config) throws ServletException
    {
        System.out.println("身份验证过滤器初始化");
    }

}
