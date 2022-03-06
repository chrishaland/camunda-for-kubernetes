# camunda-for-kubernetes
Microsoft SQL Server deployment for Kubernetes, written in jsonnet.

```
jsonnet \
  --tla-str NAME='camunda' \
  --tla-str NAMESPACE='camunda' \
  --tla-str IMAGE='chrishaland/camunda-for-kubernetes' \
  --tla-str VERSION='tomcat-7.17.0-SNAPSHOT' \
  --tla-str DATASOURCE_DRIVER='com.microsoft.sqlserver.jdbc.SQLServerDriver' \
  --tla-str DATASOURCE_URL='jdbc:sqlserver://mssql.mssql.svc.cluster.local:1433;databaseName=camunda;trustServerCertificate=true;' \
  --tla-str DATASOURCE_USERNAME='sa' \
  --tla-str DATASOURCE_PASSWORD='yourStrong(!)Password' \
  --yaml-stream \
  main.jsonnet | kubectl apply --filename -
```