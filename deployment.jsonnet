function(name, namespace, image, version, port) {
    apiVersion: 'apps/v1',
    kind: 'Deployment',
    metadata: {
        name: name,
        namespace: namespace
    },
    spec: {
        replicas: 1,
        selector: {
            matchLabels: {
                app: name
            }
        },
        template: {
            metadata: {
                labels: {
                    app: name
                }
            },
            spec: {
                containers: [
                    {
                        name: name,
                        image: '%s:%s' % [image, version],
                        resources: {
                            requests: { memory: '300Mi', cpu: '250m' },
                            limits: { memory: '1Gi', cpu: '500m' }
                        },
                        ports: [
                            { containerPort: port }
                        ],
                        env: [
                            {
                                name: 'DB_DRIVER',
                                valueFrom: {
                                    configMapKeyRef: {
                                        name: name,
                                        key: 'datasource_driver'
                                    },
                                }
                            },
                            {
                                name: 'DB_URL',
                                valueFrom: {
                                    configMapKeyRef: {
                                        name: name,
                                        key: 'datasource_url'
                                    }
                                }
                            },
                            {
                                name: 'DB_USERNAME',
                                valueFrom: {
                                    configMapKeyRef: {
                                        name: name,
                                        key: 'datasource_username'
                                    }
                                }
                            },
                            {
                                name: 'DB_PASSWORD',
                                valueFrom: {
                                    secretKeyRef: {
                                        name: name,
                                        key: 'datasource_password'
                                    }
                                }
                            }
                            
                        ]
                    }
                ]
            }
        }
    }
}
