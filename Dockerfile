ARG VERSION=tomcat-7.17.0-SNAPSHOT
FROM ubuntu AS sqljdbc
RUN apt update && \
    apt install --yes curl && \
    curl -LO https://download.microsoft.com/download/4/d/5/4d5a79be-35f8-48d4-a984-473747362f99/sqljdbc_10.2.0.0_enu.tar.gz && \
    tar -xzvf sqljdbc_10.2.0.0_enu.tar.gz

FROM camunda/camunda-bpm-platform:${VERSION}
ARG JRE_VERSION=jre11
COPY --from=sqljdbc /sqljdbc_10.2/enu/mssql-jdbc-10.2.0.${JRE_VERSION}.jar /camunda/lib/mssql-jdbc-10.2.0.jar