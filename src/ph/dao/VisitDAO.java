package ph.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ph.po.Visit;
public class VisitDAO
{
    public List<Visit> getVisitsByPetId(int petId) throws Exception
    {
        List<Visit> visits = new ArrayList<Visit>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ph", "root", "root");
//            ps = con.prepareStatement("select visit.*,vet.name from t_visit as visit inner join t_vet as vet on (visit.vetId=vet.id) where visit.petId=?");
            ps = con.prepareStatement("select t_vet.name, t_visit.*\n" +
                    " from t_vet, t_visit\n" +
                    " where t_vet.id = t_visit.vetId\n" +
                    " and   t_visit.petId=?");
            ps.setInt(1,petId);
            rs = ps.executeQuery();
            while(rs.next())
            {
                Visit visit=new Visit();
                visit.setId(rs.getInt("id"));
                visit.setPetId(petId);
                visit.setVetId(rs.getInt("vetId"));
                visit.setVisitdate(rs.getString("visitdate"));
                visit.setDescription(rs.getString("description"));
                visit.setTreatment(rs.getString("treatment"));
                visit.setVetName(rs.getString("name"));
                visits.add(visit);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new Exception("数据库访问出现异常:" + e);
        }
        finally
        {
            if(rs!=null)
            {
                rs.close();
            }
            if (ps != null)
            {
                ps.close();
            }
            if (con != null)
            {
                con.close();
            }
        }
        return visits;
    }

    public void save(Visit visit) throws Exception
    {
        Connection con = null;
        PreparedStatement ps = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ph","root", "root");// 协议://域名(ip):端口/资源（数据库名）

//            ps = con.prepareStatement("insert into t_visit value(null,?,?,CURDATE(),?,?)");
            ps = con.prepareStatement("insert into t_visit value(null,?,?,NOW(),?,?)");
            ps.setInt(1, visit.getPetId());
            ps.setInt(1, visit.getPetId());
            ps.setInt(2, visit.getVetId());
            ps.setString(3, visit.getDescription());
            ps.setString(4, visit.getTreatment());

            ps.executeUpdate();
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
            throw new Exception("找不到驱动:" + e.getMessage());// 异常不能在底层丢失了
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            throw new Exception("数据库操作错误:" + e.getMessage());
        }
        finally
        {
            if (ps != null)
            {
                ps.close();
            }
            if (con != null)
            {
                con.close();
            }
        }
    }
}
