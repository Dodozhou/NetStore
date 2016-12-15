package com.star.estore.dao;

import com.star.estore.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by hp on 2016/12/4.
 */
public class PrivilegeDao {
    //role 角色名称
    //pname 权限名称
    public boolean checkPrivilege(String role,String pname){
        String sql = "select privileges.name from privileges,role,userprivilege where privileges.id =userprivilege.privilege_id and role.role=userprivilege.role and role.role=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        List<Object> pnames = null;
        try {
            pnames = (List<Object>) runner.query(sql,new ColumnListHandler(),role);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        /*System.out.println("role："+role+"  needed privilege："+pname);
        System.out.println("current privilege："+pnames);*/
        return (pnames.contains(pname));
    }

}
