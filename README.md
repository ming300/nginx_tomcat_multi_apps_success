nginx_tomcat_multi_apps_success nginx和tomcat多个应用配制成功!
===============================

nginx tomcat multi apps by  Virtual host,Nginx configuration to pass site directly to tomcat webapp with context



# nginx version
	nginx-1.7.4-win32-setup.exe  http://kevinworthington.com/nginx-for-windows/


# Setup the Virtual host
## Add a Host entry to the Engine portion of $CATALINA_HOME/conf/server.xml
	```
	<Engine name="Catalina" defaultHost="localhost">   
	      <Realm className="org.apache.catalina.realm.LockOutRealm">      
		<Realm className="org.apache.catalina.realm.UserDatabaseRealm"  resourceName="UserDatabase"/>
	      </Realm>

		<Host name="localhost"  appBase="webapps" unpackWARs="true" autoDeploy="true">
			<!-- SingleSignOn valve, share authentication between web applications
			Documentation at: /docs/config/valve.html -->
			<!--
			<Valve className="org.apache.catalina.authenticator.SingleSignOn" />
			-->
			<!-- Access log processes all example.
			Documentation at: /docs/config/valve.html
			Note: The pattern used is equivalent to using pattern="common" -->
			<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
			prefix="localhost_access_log." suffix=".txt"
			pattern="%h %l %u %t &quot;%r&quot; %s %b" />
		</Host>
		<Host name="cms.echoidea.cn" appBase="apps_cms" unpackWARS="true" autoDeploy="true">
			<Alias>cms.echoidea.cn</Alias>
		</Host>

		<Host name="weixin.echoidea.cn" appBase="apps_weixin" unpackWARS="true" autoDeploy="true">
			
		</Host>

		<Host name="yesido.asia" appBase="apps_yesido" unpackWARS="true" autoDeploy="true">
			<Alias>www.yesido.asia</Alias>
		</Host>


		<Host name="echoidea.cn" appBase="apps_echoidea" unpackWARS="true" autoDeploy="true">
			<Alias>www.echoidea.cn</Alias>
		</Host>
	</Engine>
	```


# Create the appBase directory $CATALINA_HOME/apps_echoidea/

# Configure the context with $CATALINA_HOME/apps_echoidea/ROOT/META-INF/context.xml
	```
	<Context path="/" 
	    antiResourceLocking="false" />
	```
# Deploy blah to $CATALINA_HOME/apps_echoidea/ROOT. This may be as simple as changing app.war to ROOT.war.

# Make sure nginx is still copacetic
Just proxy requests for echoidea.cn to localhost and tomcat will take care of the rest:
```
server {
  listen  80; 
  server_name echoidea.cn www.echoidea.cn;

  location / { 
    proxy_pass                          http://127.0.0.1:8080/;
    proxy_set_header Host               $host;
    proxy_set_header X-Real-IP          $remote_addr;  
    proxy_set_header X-Forwarded-For    $proxy_add_x_forwarded_for;
  }
}

```



# test
	need to debug,change the web site location to 127.0.0.1
	
	for windowns xp
		C:\WINDOWS\system32\drivers\etc\hosts
	
	
	```

127.0.0.1       cms.echoidea.cn
127.0.0.1       weixin.echoidea.cn
127.0.0.1       www.yesido.asia
127.0.0.1       yesido.asia
127.0.0.1       www.echoidea.cn

127.0.0.1       echoidea.cn	
	```
