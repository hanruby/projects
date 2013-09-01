cd C:\tomcat\apache-tomcat-6.0.20\webapps
rd /s /q eatifying
del eatifying.war
xcopy C:\Dass\Business\BUWorkspace\Eatifying\eatifying-modules\web\target\eatifying.war C:\tomcat\apache-tomcat-6.0.20\webapps
cd C:\tomcat\apache-tomcat-6.0.20\bin
set JPDA_TRANSPORT="dt_socket"
set JPDA_ADDRESS="8055"
catalina.bat jpda run