{
    "Job": {
        "Affinities": null,
        "AllAtOnce": false,
        "Constraints": null,
        "CreateIndex": 83718,
        "Datacenters": [
            "vultr"
        ],
        "Dispatched": false,
        "ID": "netdata",
        "JobModifyIndex": 83718,
        "Meta": null,
        "Migrate": null,
        "ModifyIndex": 83718,
        "Name": "netdata",
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
        "SubmitTime": 1577214898854299343,
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
                "Name": "netdata`",
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
                            "image": "netdata/netdata:latest",
                            "port_map": [
                                {
                                    "netdata_ui": 19999.0
                                }
                            ],
                            "volumes": [
                                "/proc:/host/proc",
                                "/sys:/host/sys",
                                "/var/run/docker.sock:/var/run/docker.sock"
                            ],
                            "cap_add": [
                                "SYS_PTRACE"
                            ]
                        },
                        "Constraints": null,
                        "DispatchPayload": null,
                        "Driver": "docker",
                        "Env": {
                            "PGID": "1000"
                        },
                        "KillSignal": "",
                        "KillTimeout": 5000000000,
                        "Kind": "",
                        "Leader": false,
                        "LogConfig": {
                            "MaxFileSizeMB": 10,
                            "MaxFiles": 10
                        },
                        "Meta": null,
                        "Name": "netdata",
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
                                            "Label": "netdata_ui",
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
                                        "Name": "alive",
                                        "Path": "",
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
                                "Name": "netdata",
                                "PortLabel": "netdata_ui",
                                "Tags": [
                                    "metrics",
                                    "http"
                                ]
                            }
                        ],
                        "ShutdownDelay": 0,
                        "Templates": null,
                        "User": "",
                        "Vault": null,
                        "VolumeMounts": null
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
                "Volumes": null
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
        "Version": 0
    }
}
