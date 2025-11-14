# 1단계: Maven으로 war 빌드
FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app

# pom 먼저 복사해서 의존성 캐시
COPY pom.xml .
RUN mvn -B dependency:go-offline

# 실제 소스 복사
COPY src ./src

# war 빌드
RUN mvn -B package

# 2단계: Tomcat 이미지에 war 배포
FROM tomcat:9.0

# 기본 ROOT 앱 제거 (원하는 경우)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# 빌드 결과를 Tomcat에 복사
# 생성되는 war 이름이 Week11-1.0-SNAPSHOT.war 같은 거라면
# ROOT.war로 바꿔서 루트(/)로 띄우는 게 깔끔함
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]