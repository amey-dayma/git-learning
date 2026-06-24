variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "github_username" {
  description = "GitHub username/owner"
  type        = string
}

variable "repositories" {
  description = "Map of GitHub repositories to create"
  type = map(object({
    name                   = string
    description            = optional(string, "")
    private                = optional(bool, false)
    auto_init              = optional(bool, true)
    has_issues             = optional(bool, true)
    has_projects           = optional(bool, true)
    has_wiki               = optional(bool, false)
    has_downloads          = optional(bool, false)
    is_template            = optional(bool, false)
    default_branch         = optional(string, "main")
    allow_merge_commit     = optional(bool, true)
    allow_squash_merge     = optional(bool, true)
    allow_rebase_merge     = optional(bool, true)
    allow_auto_merge       = optional(bool, false)
    delete_branch_on_merge = optional(bool, true)
    topics                 = optional(list(string), [])
  }))
}
