package it.objectmethod.world;

import org.apache.catalina.startup.Tomcat;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainer;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "it.objectmethod.world")
public class WebConfig extends WebMvcConfigurerAdapter{

	//Logger log = Logger.getLogger(this.getClass());

	@Value("${frontend.allpath}")
	private String path;
	
	@Value("${frontend.js.path}")
	private String jsPath;
	
	@Value("${frontend.css.path}")
	private String cssPath;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//log.debug("Path js: "+path);
		if (!registry.hasMappingForPattern("/js/**")) {
			registry.addResourceHandler("/js/**").addResourceLocations("file:"+jsPath);
		}
		if (!registry.hasMappingForPattern("/css/**")) {
			registry.addResourceHandler("/css/**").addResourceLocations("file:"+cssPath);
		}/*
        if (!registry.hasMappingForPattern("/webjars/**")) {
            registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
        }*/
	}

	@Bean
	public InternalResourceViewResolver internalViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/jsp/");
		viewResolver.setSuffix(".jsp");
		viewResolver.setOrder(1);
		return viewResolver;
	}

	@Bean
	public TomcatEmbeddedServletContainerFactory tomcatFactory() {
		return new TomcatEmbeddedServletContainerFactory() {
			@Override
			protected TomcatEmbeddedServletContainer getTomcatEmbeddedServletContainer(Tomcat tomcat) {
				tomcat.enableNaming();
				TomcatEmbeddedServletContainer container = super.getTomcatEmbeddedServletContainer(tomcat);
				return container;
			}
		};
	}


}
