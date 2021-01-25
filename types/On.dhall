let Delete = ./events/Delete.dhall
let Pull_request = ./events/Pull_request.dhall
let Push = ./events/Push.dhall
let Release = ./events/Release.dhall
let Repository_dispatch = ./events/RepositoryDispatch.dhall
let Workflow_dispatch = ./events/WorkflowDispatch.dhall
let Check_run = ./events/CheckRun.dhall

in { push: Optional Push
, pull_reuqest: Optional Pull_reuqest
, push: Optional Push
, release: Optional Release
, repository_dispatch: Optional RepositoryDispatch
, workflow_dispatch: Optional WorkflowDispatch
, delete: Optional Delete
, check_run: Optional CheckRun
}


