# dhall-github-actions
Typecheck, template and modularize your GitHub Actions definitions with Dhall

<img src="dhall-github-actions.png" alt="dhall-github-actions logo" height="300px"/>

## Usage
```dhall
let GitHubAction =
      https://raw.githubusercontent.com/shoukoo/dhall-github-actions/v0.0.1/api/package.dhall sha256:8a324e32d64c2b3ace0ded116d922b6858deb49f4f4d0903572a444664ab6ac5

in  GitHubAction.Workflow::{
    , name = "test checkout"
    , on = GitHubAction.On::{ push = Some GitHubAction.OnPush::{=} }
    , jobs = toMap
        { build = GitHubAction.Jobs::{
          , name = Some "Reporting issue"
          , runs-on = [ "self-hosted" ]
          , steps =
            [ GitHubAction.ActionActionsCheckout::{=}
            , GitHubAction.ActionActionsCache.fn
                { id = "cache"
                , path = "jsonnet"
                , key = "jsonnet"
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


