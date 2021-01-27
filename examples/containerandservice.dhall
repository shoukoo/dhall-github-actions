let GitHubActions = ../package.dhall

in GitHubActions.ContainerAndService::{ image = "nginx"
, crendential = Some { username = "test", password = "test" }
, ports =  Some [ 9090, 8080 ]
, volumes = Some [ "/data/my_data" ]
, options = Some "--cpus 1"
}

