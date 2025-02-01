package com.webbible.soulinku.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@Configuration
@Import(DbConfig.class)
@MapperScan(basePackages = "com.webbible.soulinku.mapper")
public class MybatiseConfig {

    @Autowired
    private DbConfig dbConfig;

    /*
    private final ApplicationContext applicationContext;

    public MybatiseConfig(ApplicationContext applicationContext){
        this.applicationContext = applicationContext;
    }
    */
    


    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
        //https://coding-nyan.tistory.com/163
        //https://frontierdev.tistory.com/215
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dbConfig.dataSource());
        sqlSessionFactoryBean.setConfigLocation(new PathMatchingResourcePatternResolver().getResource("classpath:mybatis-config.xml"));
        sqlSessionFactoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mybatis/mapper/*.xml"));
        
        //sqlSessionFactoryBean.setConfigLocation(applicationContext.getResources("classpath:mybatis-config.xml"));
        //sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/mapper/*.xml"));

        sqlSessionFactoryBean.setTypeAliasesPackage("com.webbible.soulinku.dto");
        
        // 패키지명 주의
        return sqlSessionFactoryBean.getObject();
    }
    @Bean
    public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory){
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
