function(name, namespace, driver, url, username) {
    apiVersion: 'v1',
    kind: 'ConfigMap',
    metadata: {
        name: name,
        namespace: namespace
    },
    data: {
        datasource_driver: driver,
        datasource_url: url,
        datasource_username: username
    }
}