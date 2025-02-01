package com.webbible.soulinku.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SiteMeshConfig extends ConfigurableSiteMeshFilter{

    @Bean
	public FilterRegistrationBean<SiteMeshConfig> siteMeshFilter() {
		FilterRegistrationBean<SiteMeshConfig> filter = new FilterRegistrationBean<SiteMeshConfig>();
		filter.setFilter(new SiteMeshConfig());
		return filter;
	}
    
    @Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
    
                // 모든 경로(/*)에 대해 default.jsp라는 Decorator를 타라
		builder.addDecoratorPath("/*", "/user_default.jsp")
		.addDecoratorPath(CONFIG_FILE_DEFAULT, AUTO_RELOAD_PARAM)
               // /admin/*라는 url은 admin_default.jsp라는 Decorator를 타라
		       .addDecoratorPath("/admin/*", "/admin_default.jsp")
               // /sitemap라는 url은 어떠한 Decorator도 타지 않게 제외
               // Map decorators to path patterns.		
		               .addDecoratorPath("**/popup/*", "popup.jsp")
		               // Exclude path from decoration.
		               .addExcludedPath("/login")
		               .addExcludedPath("**/download/*")
		               .addExcludedPath("**/ajax/*")
		               .addExcludedPath("**/api/*")
		               .setMimeTypes("text/html")
		       .addExcludedPath("/sitemap");
	}

    

}
