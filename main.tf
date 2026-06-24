terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = var.github_username
}

resource "github_repository" "repo" {
  for_each = var.repositories

  name        = each.value.name
  description = each.value.description
  private     = each.value.private
  visibility  = each.value.private ? "private" : "public"

  auto_init            = each.value.auto_init
  has_issues           = each.value.has_issues
  has_projects         = each.value.has_projects
  has_wiki             = each.value.has_wiki
  has_downloads        = each.value.has_downloads
  is_template          = each.value.is_template
  default_branch       = each.value.default_branch
  allow_merge_commit   = each.value.allow_merge_commit
  allow_squash_merge   = each.value.allow_squash_merge
  allow_rebase_merge   = each.value.allow_rebase_merge
  allow_auto_merge     = each.value.allow_auto_merge
  delete_branch_on_merge = each.value.delete_branch_on_merge

  topics = each.value.topics
}
