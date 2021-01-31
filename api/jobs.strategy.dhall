{ Type = { matrix : Optional (List { mapKey : Text, mapValue : List Text })
, fail-fast : Optional Bool
, max-parallel : Optional Natural
},
default = { matrix = None (List { mapKey : Text, mapValue : List Text }) , fail-fast = None Bool, max-parallel = None Natural }
}

