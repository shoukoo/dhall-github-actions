  { Workflow = ./workflow.dhall
  , ActionActionsCheckout = ./action.actions.checkout.dhall
  , Defaults = ./defaults.dhall
  , Jobs = ./jobs.dhall
  , JobsContainer = ./jobs.container.dhall
  , JobsService = ./jobs.services.dhall
  , JobsSteps = ./jobs.steps.dhall
  , JobStrategy = ./jobs.strategy.dhall
  , On = ./on.dhall
  , OnDelete = ./on.delete.dhall
  , OnPullRequest = ./on.pull_request.dhall
  , OnPush = ./on.push.dhall
  , OnRelease = ./on.release.dhall
  , OnWorkflowDispatch = ./on.workflow_dispatch.dhall
  , Step = ./jobs.steps.dhall
  }
