package ph.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;


import ph.dao.PetDAO;
import ph.dao.VetDAO;
import ph.po.Pet;
import ph.dao.VisitDAO;
import ph.po.Vet;
import ph.po.Visit;

//@WebServlet(name = "VisitServlet")
@WebServlet("/VisitServlet")
public class VisitServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String mode = request.getParameter("mode");
        if("search".equals(mode))
        {
            searchPet(request, response);
        }
        else if("saveCaseHistory".equals(mode))
        {
            saveCaseHistory(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String mode = request.getParameter("mode");
        if ("showCaseHistory".equals(mode))//浏览病历
        {
            showCaseHistory(request, response);
        }
        else if ("addCaseHistory".equals(mode))
        {
            addCaseHistory(request, response);
        }
    }

    private void searchPet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
    {
        String petName = request.getParameter("petName");
        String ownerName = request.getParameter("ownerName");
        try
        {
//            List<Pet> pets = new PetDAO().search(petName, "");
            List<Pet> pets = new PetDAO().search(petName, ownerName);
            if(0==pets.size())
            {
                request.setAttribute("msg", "没有查到宠物信息");
                request.getRequestDispatcher("/visitSearch.jsp").forward(request, response);
            }
            else
            {
                request.setAttribute("pets", pets);
                request.getRequestDispatcher("/visitSearchResult.jsp").forward(request, response);
            }
        }
        catch (Exception e)
        {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("/visitSearch.jsp").forward(request, response);
        }
    }

    private void showCaseHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            VisitDAO visitDAO = new VisitDAO();
            List<Visit> visits = visitDAO.getVisitsByPetId(Integer.parseInt(request.getParameter("petId")));
            request.setAttribute("visits", visits);
            if (0 == visits.size())
            {
                request.setAttribute("msg", "没有找到历史病历");
            }
            request.getRequestDispatcher("/showCaseHistory.jsp").forward(request, response);
        }
        catch (Exception e)
        {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("/showCaseHistory.jsp").forward(request, response);
        }
    }

    private void addCaseHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            VetDAO vetDAO = new VetDAO();
            List<Vet> vets = vetDAO.getAll();
            request.setAttribute("vets", vets);
            request.getRequestDispatcher("/addCaseHistory.jsp").forward(request, response);
        }
        catch (Exception e)
        {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("/visitSearch.jsp").forward(request, response);
        }
    }

    private void saveCaseHistory(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        try
        {
            Visit visit = new Visit();
            visit.setPetId(Integer.parseInt(request.getParameter("pid")));
            visit.setVetId(Integer.parseInt(request.getParameter("vid")));
            //缺少visitdate,原因是在visitDAO.save()中用MySQL的CURDATE()函数获取当前日期
            visit.setDescription(request.getParameter("description"));
            visit.setTreatment(request.getParameter("treatment"));
            VisitDAO visitDAO = new VisitDAO();
            visitDAO.save(visit);
//            request.setAttribute("msg", "病历添加成功");
            String petName = request.getParameter("petName");
            request.setAttribute("msg", "宠物"+ petName + "的病历添加成功");;
            request.getRequestDispatcher("/visitSearch.jsp").forward(request, response);
        }
        catch (Exception e)
        {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("/visitSearch.jsp").forward(request, response);
        }
    }
}
