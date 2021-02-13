# dhall-github-actions
Typecheck, template and modularize your GitHub Actions definitions with Dhall

<img src="dhall-github-actions.png" alt="dhall-github-actions logo" height="300px"/>

## Usage
```dhall
let GA =
      https://raw.githubusercontent.com/shoukoo/dhall-github-actions/v0.0.4/package.dhall

in  GA.Workflow::{
    , name = "Test actions"
    , on = GA.On::{ push = Some GA.OnPush::{ branches = Some [ "test" ] } }
    , jobs = toMap
        { build = GA.Jobs::{
          , name = Some "test actions"
          , runs-on = [ "self-hosted" ]
          , steps =
            [ GA.Resource.Step GA.Step::{=}
            , GA.Resource.ActionsCache
                GA.actions/cache::{
                , id = Some "action-cache"
                , `with` = GA.actions/cache/with::{
                  , path = "file.lock"
                  , key = "file_lock"
                  }
                }
            , GA.Resource.ActionsCheckout GA.actions/checkout::{=}
            , GA.Resource.ActionsGitHubScript
                GA.actions/github-script::{
                , `with` = GA.actions/github-script/with::{
                  , script =
                      ''
                      github.issues.createComment({
                      issue_number: context.issue.number,
                      owner: context.repo.owner,
                      repo: context.repo.repo,
                      body: '👋 Thanks for reporting!'
                      })
                      ''
                  }
                }
            , GA.Resource.ActionsSetupGo
                GA.actions/setup-go::{
                , `with` = Some GA.actions/setup-go/with::{
                  , go-version = Some "100"
                  }
                }
            ]
          }
        }
    }
```

## List of supported actions
- [actions/cache](https://github.com/actions/cache)
- [actions/checkout](https://github.com/actions/checkout)
- [actions/github-script](https://github.com/actions/github-script)
- [actions/setup-go](https://github.com/actions/setup-go)
- [actions/setup-node](https://github.com/actions/setup-node)

## Development
Please be sure to run `dhall format` against your change before creating a PR
### How to add a new action?
1. The action must come from a verified GitHub account e.g. AWS, Hashicorp..etc. This is to ensure they're safe to consume.
2. New action must inherits steps.dhall record type, this way it can get all the optional fields. Here is an example:
```
let Step = ./steps.dhall

let With = ./action.actions.github-script.with.dhall

in  { Type = Step.Type ⩓ { `with` : With.Type }
    , default = Step.default ⫽ { uses = Some "actions/github-script@v3" }
    }
```
3. New action file must follow this naming convention: `actions.<account name>.<action name>`.
5. Add your new action in both `api/stepUnion.dhall` and `api/package.dhall`
