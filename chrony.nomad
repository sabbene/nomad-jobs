{
    "Job": {
        "Affinities": null,
        "AllAtOnce": false,
        "Constraints": null,
        "CreateIndex": 77279,
        "Datacenters": [
            "vultr"
        ],
        "Dispatched": false,
        "ID": "chrony",
        "JobModifyIndex": 83688,
        "Meta": null,
        "Migrate": null,
        "ModifyIndex": 83688,
        "Name": "chrony",
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
        "SubmitTime": 1577213579730711476,
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
                "Name": "chrony",
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
                            "network_mode": "host",
                            "cap_add": [
                                "SYS_TIME"
                            ],
                            "image": "sabbene/docker-chrony:latest"
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
                        "Name": "chrony",
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
                                    "DynamicPorts": null,
                                    "IP": "",
                                    "MBits": 10,
                                    "Mode": "",
                                    "ReservedPorts": [
                                        {
                                            "Label": "ntp",
                                            "To": 0,
                                            "Value": 123
                                        }
                                    ]
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
                                        "AddressMode": "host",
                                        "Args": [
                                            "foo",
                                            ">",
                                            "/dev/udp/${NOMAD_IP_ntp}/123"
                                        ],
                                        "CheckRestart": null,
                                        "Command": "/bin/echo",
                                        "GRPCService": "",
                                        "GRPCUseTLS": false,
                                        "Header": null,
                                        "Id": "",
                                        "InitialStatus": "",
                                        "Interval": 10000000000,
                                        "Method": "",
                                        "Name": "chrony check",
                                        "Path": "",
                                        "PortLabel": "",
                                        "Protocol": "",
                                        "TLSSkipVerify": false,
                                        "TaskName": "",
                                        "Timeout": 2000000000,
                                        "Type": "script"
                                    }
                                ],
                                "Connect": null,
                                "Id": "",
                                "Meta": null,
                                "Name": "chrony",
                                "PortLabel": "ntp",
                                "Tags": [
                                    "global",
                                    "cache"
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
                    "AutoRevert": true,
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
        "Version": 4
    }
}
