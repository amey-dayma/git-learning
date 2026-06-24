output "repository_urls" {
  description = "URLs of created repositories"
  value = {
    for name, repo in github_repository.repo :
    name => repo.html_url
  }
}

output "repository_full_names" {
  description = "Full names (owner/repo) of created repositories"
  value = {
    for name, repo in github_repository.repo :
    name => repo.full_name
  }
}

output "repository_clone_urls" {
  description = "HTTPS clone URLs of created repositories"
  value = {
    for name, repo in github_repository.repo :
    name => repo.clone_url
  }
}

output "repository_ssh_urls" {
  description = "SSH clone URLs of created repositories"
  value = {
    for name, repo in github_repository.repo :
    name => repo.ssh_clone_url
  }
}
