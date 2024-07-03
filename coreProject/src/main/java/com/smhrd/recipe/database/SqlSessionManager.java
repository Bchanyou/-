package com.smhrd.recipe.database;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
   
   private static SqlSessionFactory sqlSessionFactory;

   static {

      String path = "com/smhrd/recipe/database/mybatis-config.xml";

      try {
         Reader reader = Resources.getResourceAsReader(path);
         
         sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
         
      } catch (IOException e) {
         e.printStackTrace();
      }

   }
   
   public static SqlSessionFactory getSqlSessionFactory() {
      return sqlSessionFactory;
   }

}
