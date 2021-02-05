# dhall-github-actions
Typecheck, template and modularize your GitHub Actions definitions with Dhall

<img src="dhall-github-actions.png" alt="dhall-github-actions logo" height="300px"/>

## Usage
```dhall
let GitHubAction =
      https://raw.githubusercontent.com/shoukoo/dhall-github-actions/v0.0.1/api/package.dhall sha256:6b0b369c615de63aaf766f8d0374a19be401fd73f136fbf1a0e12b8f39fdc558

in  GitHubAction.Workflow::{
    , name = "Reporting issue"
    , on = GitHubAction.On::{ push = Some GitHubAction.OnPush::{=} }
    , jobs = toMap
        { build = GitHubAction.Jobs::{
          , name = Some "Reporting issue"
          , runs-on = [ "self-hosted" ]
          , steps =
            [ GitHubAction.ActionActionsCheckout::{=}
            , GitHubAction.ActionActionsCache.fn
                { id = "cache"
                , path = "cache"
                , key = "cache"
                , hashFiles = [ "key.file" ]
                }
            , GitHubAction.ActionActionsGitHubScript.fn
                { id = "post-comment"
                , name = "Post Comment"
                , script =
                    ''
                    github.issues.createComment({
                      issue_number: context.issue.number,
                      owner: context.repo.owner,
                      repo: context.repo.repo,
                      body: ' Thanks for reporting!'
                    })
                    ''
                }
            ]
          }
        }
    }
```

## Development
Please be sure to run `dhall format` against your change before creating a PR
### How to add a new action?
1. The action must come from a verified GitHub account e.g AWS, Hashicorp..etc. This can ensure the action is safe to use.
2. New action must inherit `steps.dhall` record type, this way the new action can get all the goodies. Here is an example:
```
let Step = ./steps.dhall

let With = ./action.actions.github-script.with.dhall

in  { Type = Step.Type ⩓ { `with` : With.Type }
    , default = Step.default ⫽ { uses = Some "actions/github-script@v3" }
    }
```
3. New action file must follow this naming convention: `actions.<account name>.<action name>`
4. New record type must be added to `api/package.dhall`, and also use this format for the `key`: `actions/checkout`
5. Add your new action in `api/stepUnion.dhall`
