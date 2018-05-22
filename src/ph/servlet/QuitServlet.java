package ph.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.net.URLEncoder;

//@WebServlet(name = "QuitServlet")
@WebServlet("/QuitServlet")
public class QuitServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.getSession(true).invalidate();//session.invalidate()是将session设置为失效，一般在退出时使用
//		response.sendRedirect("index.jsp?para=退出成功");
        response.sendRedirect("index.jsp?para="+URLEncoder.encode("退出成功", "UTF-8"));
    }
}
