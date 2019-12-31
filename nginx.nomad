{
    "Job": {
        "Affinities": null,
        "AllAtOnce": false,
        "Constraints": null,
        "CreateIndex": 25427,
        "Datacenters": [
            "vultr"
        ],
        "Dispatched": false,
        "ID": "nginx",
        "JobModifyIndex": 84082,
        "Meta": null,
        "Migrate": null,
        "ModifyIndex": 84082,
        "Name": "nginx",
        "Namespace": "default",
        "ParameterizedJob": null,
        "ParentID": "",
        "Payload": null,
        "Periodic": null,
        "Priority": 50,
        "Region": "global",
        "Reschedule": null,
        "Spreads": null,
        "Stable": false,
        "Status": "running",
        "StatusDescription": "",
        "Stop": false,
        "SubmitTime": 1577232657426729295,
        "TaskGroups": [
            {
                "Affinities": null,
                "Constraints": null,
                "Count": 1,
                "EphemeralDisk": {
                    "Migrate": false,
                    "SizeMB": 300,
                    "Sticky": false
                },
                "Meta": null,
                "Migrate": null,
                "Name": "nginx",
                "Networks": null,
                "ReschedulePolicy": null,
                "RestartPolicy": {
                    "Attempts": 2,
                    "Delay": 15000000000,
                    "Interval": 1800000000000,
                    "Mode": "fail"
                },
                "Services": null,
                "Spreads": null,
                "Tasks": [
                    {
                        "Affinities": null,
                        "Artifacts": null,
                        "Config": {
                            "image": "sabbene/docker-nginx:latest",
                            "port_map": [
                                {
                                    "http": 8080.0
                                },
                                {
                                    "https": 4443.0
                                }
                            ]
                        },
                        "Constraints": null,
                        "DispatchPayload": null,
                        "Driver": "docker",
                        "Env": null,
                        "KillSignal": "",
                        "KillTimeout": 5000000000,
                        "Kind": "",
                        "Leader": false,
                        "LogConfig": {
                            "MaxFileSizeMB": 10,
                            "MaxFiles": 10
                        },
                        "Meta": null,
                        "Name": "nginx",
                        "Resources": {
                            "CPU": 500,
                            "Devices": null,
                            "DiskMB": 0,
                            "IOPS": 0,
                            "MemoryMB": 256,
                            "Networks": [
                                {
                                    "CIDR": "",
                                    "Device": "",
                                    "DynamicPorts": [
                                        {
                                            "Label": "http",
                                            "To": 0,
                                            "Value": 0
                                        },
                                        {
                                            "Label": "https",
                                            "To": 0,
                                            "Value": 0
                                        }
                                    ],
                                    "IP": "",
                                    "MBits": 10,
                                    "Mode": "",
                                    "ReservedPorts": null
                                }
                            ]
                        },
                        "Services": [
                            {
                                "AddressMode": "auto",
                                "CanaryTags": null,
                                "CheckRestart": null,
                                "Checks": [
                                    {
                                        "AddressMode": "",
                                        "Args": null,
                                        "CheckRestart": null,
                                        "Command": "",
                                        "GRPCService": "",
                                        "GRPCUseTLS": false,
                                        "Header": null,
                                        "Id": "",
                                        "InitialStatus": "",
                                        "Interval": 10000000000,
                                        "Method": "",
                                        "Name": "service: \"nginx\" check",
                                        "Path": "/",
                                        "PortLabel": "",
                                        "Protocol": "",
                                        "TLSSkipVerify": false,
                                        "TaskName": "",
                                        "Timeout": 2000000000,
                                        "Type": "tcp"
                                    }
                                ],
                                "Connect": null,
                                "Id": "",
                                "Meta": null,
                                "Name": "nginx",
                                "PortLabel": "http",
                                "Tags": [
                                    "http",
                                    "nginx"
                                ]
                            }
                        ],
                        "ShutdownDelay": 0,
                        "Templates": null,
                        "User": "",
                        "Vault": null,
                        "VolumeMounts": [
                            {
                                "Destination": "/usr/share/nginx/html",
                                "ReadOnly": false,
                                "Volume": "certs"
                            }
                        ]
                    }
                ],
                "Update": {
                    "AutoPromote": false,
                    "AutoRevert": false,
                    "Canary": 0,
                    "HealthCheck": "checks",
                    "HealthyDeadline": 180000000000,
                    "MaxParallel": 1,
                    "MinHealthyTime": 10000000000,
                    "ProgressDeadline": 600000000000,
                    "Stagger": 30000000000
                },
                "Volumes": {
                    "certs": {
                        "Name": "certs",
                        "ReadOnly": true,
                        "Source": "nginx-data",
                        "Type": "host"
                    }
                }
            }
        ],
        "Type": "system",
        "Update": {
            "AutoPromote": false,
            "AutoRevert": false,
            "Canary": 0,
            "HealthCheck": "",
            "HealthyDeadline": 0,
            "MaxParallel": 1,
            "MinHealthyTime": 0,
            "ProgressDeadline": 0,
            "Stagger": 30000000000
        },
        "VaultToken": "",
        "Version": 23
    }
}
