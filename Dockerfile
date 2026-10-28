FROM tomcat:10.1-jdk17

ENV UPLOAD_DIR=/app/uploads/
RUN mkdir -p /app/uploads
VOLUME ["/app/uploads"]

COPY target/BanHang-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
