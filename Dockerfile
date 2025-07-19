FROM juyonghyeon/ubuntu:1.0.2
ARG JAR_PATH=build/libs/secondhand-0.0.1-SNAPSHOT.jar
ARG PORT=3000
COPY ${JAR_PATH} app.jar
RUN mkdir uploads

ENV SPRING_PROFILES_ACTIVE=default,prod
ENV DB_URL=**
ENV DB_PASSWORD=**
ENV DB_USERNAME=**

ENV PYTHON_BASE=/python_project/.venv/bin
ENV PYTHON_TREND=/python_project/source
ENV PYTHON_BASE2=/python_project/.venv/bin
ENV PYTHON_RESTAURANT=/python_project/source
ENV DDL_AUTO=none
ENV KAKAO_APIKEY=c858d489f854551908c3038c2f174e0a

ENTRYPOINT ["java", "-Ddb.password=${DB_PASSWORD}","-Ddb.url=${DB_URL}", "-Ddb.username=${DB_USERNAME}", "-Dfile.path=/uploads", "-Dfile.url=/uploads", "-Dpython.base=${PYTHON_BASE}", "-Dpython.trend=${PYTHON_TREND}", "-Dpython.base2=${PYTHON_BASE2}", "-Dpython.restaurant=${PYTHON_RESTAURANT}", "-Dspring.profiles.active=${SPRING_PROFILES_ACTIVE}", "-Dddl.auto=${DDL_AUTO}",  "-Dkakao.apikey=${KAKAO_APIKEY}", "-jar", "app.jar"]

EXPOSE ${PORT}