{ Type = { image: Text
, env: Optional (List { mapKey: Text, mapValue: Text })
, crendential: Optional { username: Text, password: Text }
, ports: Optional (List Natural)
, volumes: Optional (List Text)
, options: Optional Text
}
,
 default = { env = None (List { mapKey: Text, mapValue: Text })
, crendential = None { username: Text, password: Text }
, ports = None (List Natural)
, volumes = None (List Text)
, options = None Text
}
}

