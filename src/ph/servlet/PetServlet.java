package ph.servlet;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.util.List;
import ph.dao.PetDAO;
import ph.po.Pet;
import ph.dao.UserDAO;
import ph.po.User;

//@WebServlet(name = "PetServlet")
@WebServlet("/PetServlet")
public class PetServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        //doPost方法会被多个表单调用，查询宠物、增加宠物,因此这里需要根据不同表单传递的标示参数调用不同的方法
        String m = request.getParameter("m");
        if("search".equals(m))
        {
            searchPet(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String m = request.getParameter("m");
        if("deletePet".equals(m))
        {
            deletePet(request, response);
        }
    }

    //查询宠物的处理逻辑，by hlzhang 20180424
    private void searchPet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
    {
        String petName = request.getParameter("petName");
        String ownerName = request.getParameter("ownerName");
        try
        {
            List<Pet> pets = new PetDAO().search(petName, ownerName);
            if(0==pets.size())
            {
                request.setAttribute("msg", "没有查到宠物信息");
                request.getRequestDispatcher("/petSearch.jsp").forward(request, response);
            }
            else
            {
                request.setAttribute("pets", pets);
                request.getRequestDispatcher("/petSearchResult.jsp").forward(request, response);
            }
        }
        catch (Exception e)
        {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("/petSearch.jsp").forward(request, response);
        }
    }

    //在宠物管理页面执行删除宠物操作 by hlzhang，20180424
    private void deletePet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
//            new PetDAO().delete(Integer.parseInt(request.getParameter("petId")));
            String strPetId = request.getParameter("petId");
            int petId = Integer.parseInt(strPetId);
            PetDAO petDAO = new PetDAO();
            petDAO.delete(petId);
            request.setAttribute("msg", "成功删除宠物："+request.getParameter("petName"));
            request.getRequestDispatcher("/petSearch.jsp").forward(request, response);
        }
        catch (Exception e)
        {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("/petSearch.jsp").forward(request, response);
        }
    }
}
