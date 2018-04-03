package ph.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;
//import ph.dao.SpecialityDAO;
import ph.dao.VetDAO;
//import ph.po.Speciality;
import ph.po.Vet;

//@WebServlet(name = "VetServlet")
@WebServlet("/VetServlet")
//Vets Management Servlet
public class VetServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        //doPost方法会被多个表单调用 ,查询医生,增加医生,增加专业  因此这里需要根据不同表单传递的标示参数调用不同的方法
        String m = request.getParameter("m");
        if("search".equals(m))
        {
            search(request, response);
        }
//        else if("addVet".equals(m))
//        {
//            addVet(request, response);
//        }
//        else if("addSpec".equals(m))
//        {
//            addSpec(request, response);
//        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {


    }

    private void search(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
    {
        String vname=request.getParameter("vname");
        String sname=request.getParameter("sname");
        try
        {
            List<Vet> vets=new VetDAO().search(vname, sname);
            if(0==vets.size())
            {
                request.setAttribute("msg", "没有相关医生信息");
                request.getRequestDispatcher("/vetsearch.jsp").forward(request, response);
            }
            else
            {
                request.setAttribute("vets", vets);
                request.getRequestDispatcher("/vetsearch_result.jsp").forward(request, response);
            }
        }
        catch (Exception e)
        {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("/vetsearch.jsp").forward(request, response);
        }
    }
}
