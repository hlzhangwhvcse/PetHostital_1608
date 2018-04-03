package ph.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ph.po.Speciality;
import ph.po.Vet;
public class VetDAO
{
    /**
     * 根据医生名 专业名查找 医生、 专业 、以及关联关系表，讲找到的医生封装成医生集合，并且为每一个医生封装其专业集合
     *
     * @param vname
     *            vetname医生名
     * @param sname
     *            specialityname 专业名
     * @return 医生集合
     * @throws Exception
     */
    public List<Vet> search(String vname, String sname) throws Exception
    {
        List<Vet> vets = new ArrayList<Vet>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ph", "root", "123456");
            // 1.找符合条件的医生
//            String sql = "SELECT distinct t_vet.* FROM db_ph.t_vet_speciality INNER JOIN db_ph.t_vet ON (t_vet_speciality.vetId = t_vet.id) INNER JOIN db_ph.t_speciality ON (t_vet_speciality.specId = t_speciality.id) where t_vet.name like ? and t_speciality.name like ?";
            String sql ="SELECT distinct t_vet.* \n" +
                    "FROM t_vet, t_speciality, t_vet_speciality\n" +
                    "where t_vet.id = t_vet_speciality.vetId and\n" +
                    "      t_speciality.id = t_vet_speciality.specId and\n" +
                    "      t_vet.name like ? and \n" +
                    "      t_speciality.name like ?";
                    ps = con.prepareStatement(sql);
            ps.setString(1, "%" + vname + "%");
            ps.setString(2, "%" + sname + "%");
            rs = ps.executeQuery();
            while (rs.next())
            {
                Vet v = new Vet();// 这里查询的是t_vet.* 所以使用Vet封装
                v.setId(rs.getInt("id"));
                v.setName(rs.getString("name"));
                vets.add(v);
            }

            // 2.循环上面找到的医生，根据医生id为每一个医生封装专业集合==>有vetid 要找所有关联的speciality
            for (Vet v : vets)
            {
//                sql = "SELECT t_speciality.* FROM    db_ph.t_vet_speciality    INNER JOIN db_ph.t_speciality         ON (t_vet_speciality.specId = t_speciality.id) where t_vet_speciality.vetId=?";
                sql = "select t_speciality.* \n" +
                        "FROM  t_speciality, t_vet_speciality \n" +
                        "where t_vet_speciality.specId = t_speciality.id and\n" +
                        "      t_vet_speciality.vetId = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, v.getId());
                rs = ps.executeQuery();
                while (rs.next())
                {
                    Speciality s = new Speciality();// 这里查找的是t_speciality.* 所以使用Speciality封装
                    s.setId(rs.getInt("id"));
                    s.setName(rs.getString("name"));
                    v.getSpecs().add(s);
                }
            }

        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
            throw new Exception("找不到驱动:" + e.getMessage());
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            throw new Exception("SQL异常:" + e.getMessage());
        }
        finally
        {
            if (rs != null)
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
        return vets;
    }


    /**
     * 根据医生Id，删除医生表的对应记录*
     * @param vetId
     *            vetId 医生Id
     * @return void
     * @throws Exception
     */
    public void delete(int vetId) throws Exception
    {
        Connection con = null;
        PreparedStatement ps = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ph","root","123456");//  协议://域名(ip):端口/资源（数据库名）
            ps = con.prepareStatement("delete from t_vet where id=?");
            ps.setInt(1, vetId);
            ps.executeUpdate();
        }
        catch(ClassNotFoundException e)
        {
            e.printStackTrace();
            throw new Exception("找不到驱动:"+e.getMessage());//异常不能在底层丢失了
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            throw new Exception("数据库操作错误:"+e.getMessage());
        }
        finally
        {
            if(ps!=null)
            {
                ps.close();
            }
            if(con!=null)
            {
                con.close();
            }
        }
    }
}
