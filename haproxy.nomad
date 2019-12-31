{
    "Job": {
        "Affinities": null,
        "AllAtOnce": false,
        "Constraints": null,
        "CreateIndex": 12024,
        "Datacenters": [
            "vultr"
        ],
        "Dispatched": false,
        "ID": "haproxy",
        "JobModifyIndex": 86900,
        "Meta": null,
        "Migrate": null,
        "ModifyIndex": 86900,
        "Name": "haproxy",
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
        "SubmitTime": 1577401166467386144,
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
                "Name": "haproxy",
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
                            "image": "haproxy:2.0",
                            "network_mode": "host",
                            "volumes": [
                                "local/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg",
                                "/mnt/ssl:/ssl"
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
                        "Name": "haproxy",
                        "Resources": {
                            "CPU": 200,
                            "Devices": null,
                            "DiskMB": 0,
                            "IOPS": 0,
                            "MemoryMB": 128,
                            "Networks": [
                                {
                                    "CIDR": "",
                                    "Device": "",
                                    "DynamicPorts": null,
                                    "IP": "",
                                    "MBits": 10,
                                    "Mode": "host",
                                    "ReservedPorts": [
                                        {
                                            "Label": "http",
                                            "To": 0,
                                            "Value": 80
                                        },
                                        {
                                            "Label": "https",
                                            "To": 0,
                                            "Value": 443
                                        },
                                        {
                                            "Label": "haproxy_ui",
                                            "To": 0,
                                            "Value": 1936
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
                                        "PortLabel": "haproxy_ui",
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
                                "Name": "haproxy",
                                "PortLabel": "haproxy_ui",
                                "Tags": null
                            }
                        ],
                        "ShutdownDelay": 0,
                        "Templates": [
                            {
                                "ChangeMode": "restart",
                                "ChangeSignal": "",
                                "DestPath": "local/haproxy.cfg",
                                "EmbeddedTmpl": "defaults\n mode http\n\nuserlist authusers\n    user sabbene insecure-password password\n    user nvidia insecure-password nvidia1234\n\nfrontend stats\n    timeout client 1m\n    bind *:1936\n    stats uri /\n    stats show-legends\n    log global\n\nfrontend http_front\n    timeout connect 10s\n    timeout server 1m\nbind *:80\nbind *:443 ssl crt /ssl/ssl.pem\n    default_backend nginx_back\n\n    acl netdata  hdr_beg(host)        netdata.\n    acl haproxy  hdr_beg(host)        haproxy.\n\nacl nomad  hdr_beg(host)        nomad.\nacl authorized http_auth(authusers)\n    http-request auth realm haproxy if haproxy !authorized\n    http-request auth realm nomad if nomad !authorized\nhttp-request auth realm netdata if netdata !authorized\nuse_backend netdata_back if netdata authorized\n    use_backend haproxy_back if haproxy authorized\nuse_backend nomad_back if nomad authorized\n    acl nginx  hdr_beg(host)        demo.\n    use_backend demo_back if nginx\n    acl nginx  hdr_beg(host)        nginx.\n    use_backend nginx_back if nginx\nacl ntp  hdr_beg(host)        ntp.\n    use_backend ntp_back if ntp\n    acl tides  hdr_beg(host)        tides.\n    use_backend tides_back if tides\n\nbackend demo_back\n    timeout connect 10s\n    timeout server 1m\n    balance roundrobin\n    server-template mywebapp 10 _demo-webapp._tcp.service.consul.0hy.es resolvers consul resolve-opts allow-dup-ip resolve-prefer ipv4 check\n\nbackend nginx_back\n    timeout connect 10s\n    timeout server 1m\n    balance roundrobin\n    server-template nginx 10 _nginx._tcp.service.consul.0hy.es resolvers consul resolve-opts allow-dup-ip resolve-prefer ipv4 check\nbackend ntp_back\nserver-template chrony 10 _chrony._tcp.service.consul.0hy.es resolvers consul resolve-opts allow-dup-ip resolve-prefer ipv4\nbackend haproxy_back\nserver-template haproxy 10 _haproxy._tcp.service.consul.0hy.es port 1936 resolvers consul resolve-opts allow-dup-ip resolve-prefer ipv4 check\nhttp-request del-header Authorization\nbackend tides_back\nserver-template tides 10 _tides._tcp.service.consul.0hy.es: resolvers consul resolve-opts allow-dup-ip resolve-prefer ipv4 check\nbackend nomad_back\n    server-template nomad 10 _nomad._http.service.consul.0hy.es: resolvers consul resolve-opts allow-dup-ip resolve-prefer ipv4 check\n\nbackend netdata_back\n    server-template netdata 10 _netdata._tcp.service.consul.0hy.es: resolvers consul resolve-opts allow-dup-ip resolve-prefer ipv4 check\n\nresolvers consul\n    nameserver consul1 10.12.96.3:8600\n    nameserver consul2 10.12.96.4:8600\n    accepted_payload_size 8192\n    hold valid 5s\n",
                                "Envvars": false,
                                "LeftDelim": "{{",
                                "Perms": "0644",
                                "RightDelim": "}}",
                                "SourcePath": "",
                                "Splay": 5000000000,
                                "VaultGrace": 15000000000
                            }
                        ],
                        "User": "",
                        "Vault": null,
                        "VolumeMounts": null
                    }
                ],
                "Update": null,
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
            "MaxParallel": 0,
            "MinHealthyTime": 0,
            "ProgressDeadline": 0,
            "Stagger": 0
        },
        "VaultToken": "",
        "Version": 94
    }
}
