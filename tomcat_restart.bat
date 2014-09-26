net stop Tomcat7

del C:\site\Tomcat7.0\logs\* /s/q
del C:\site\Tomcat7.0\logs\*  /s/q

rd C:\site\Tomcat7.0\work\Catalina\ /s/q
echo not  net start Tomcat7
pause;