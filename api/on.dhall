let Delete = ./on.delete.dhall

let PullRequest = ./on.pull_request.dhall

let Push = ./on.push.dhall

let Release = ./on.release.dhall

let WorkflowDispatch = ./on.workflow_dispatch.dhall


in { Type = { push: Optional Push.Type
, pull_request: Optional PullRequest.Type
, release: Optional Release.Type
, workflow_dispatch: Optional WorkflowDispatch.Type
, delete: Optional Delete.Type
},
default = { push = None Push.Type
, pull_request = None PullRequest.Type
, release = None Release.Type
, workflow_dispatch = None WorkflowDispatch.Type
, delete = None Delete.Type
}
}
