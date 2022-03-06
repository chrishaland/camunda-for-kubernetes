function(name, namespace, password) {
    apiVersion: 'v1',
    kind: 'Secret',
    metadata: {
        name: name,
        namespace: namespace
    },
    data: {
        datasource_password: std.base64(password)
    }
}