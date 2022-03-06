local namespace = import 'namespace.jsonnet';
local configmap = import 'configmap.jsonnet';
local secret = import 'secret.jsonnet';
local service = import 'service.jsonnet';
local deployment = import 'deployment.jsonnet';

local PORT = 8080;
local ISTIO_ENABLED = false;

function(
    NAME='camunda',
    NAMESPACE='camunda',
    IMAGE='camunda/camunda-bpm-platform',
    VERSION='tomcat-7.17.0-SNAPSHOT',
    DATASOURCE_DRIVER='com.microsoft.sqlserver.jdbc.SQLServerDriver',
    DATASOURCE_URL='jdbc:sqlserver://mssql.mssql.svc.cluster.local:1433;databaseName=camunda;trustServerCertificate=true;',
    DATASOURCE_USERNAME='sa',
    DATASOURCE_PASSWORD
) [
    namespace(NAMESPACE, ISTIO_ENABLED),
    configmap(NAME, NAMESPACE, DATASOURCE_DRIVER, DATASOURCE_URL, DATASOURCE_USERNAME),
    secret(NAME, NAMESPACE, DATASOURCE_PASSWORD),
    service(NAME, NAMESPACE, PORT),
    deployment(NAME, NAMESPACE, IMAGE, VERSION, PORT)
]
