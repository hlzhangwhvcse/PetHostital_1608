package ph.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import ph.po.Pet;

public class PetDAO
{
    /**
     * 根据ownerId查找t_pet表 将找到的记录封装成Pet对象通过集合返回
     * @param ownerId
     * @return
     * @throws Exception
     */
    public List<Pet> getPetsByOwnerId(int ownerId) throws Exception
    {
        List<Pet> pets = new ArrayList<Pet>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ph","root","root");//  协议://域名(ip):端口/资源（数据库名）
            ps = con.prepareStatement("select * from t_pet where ownerId=?");
            ps.setInt(1, ownerId);
            rs = ps.executeQuery();
            while(rs.next())
            {
                Pet pet=new Pet();
                pet.setBirthdate(rs.getString("birthdate"));
                pet.setId(rs.getInt("id"));
                pet.setName(rs.getString("name"));
                pet.setOwnerId(ownerId);
                pet.setPhoto(rs.getString("photo"));
                pets.add(pet);
            }
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
            if(rs!=null)
            {
                rs.close();
            }
            if(ps!=null)
            {
                ps.close();
            }
            if(con!=null)
            {
                con.close();
            }
        }
        return pets;
    }
}
