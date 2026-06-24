# GitHub Repository Terraform

This Terraform configuration creates GitHub repositories using the GitHub provider.

## Prerequisites

1. **Terraform** installed (v1.0+)
2. **GitHub account** with personal access token
3. **GitHub Personal Access Token** with `repo` and `admin:repo_hook` scopes

## Setup

### 1. Generate GitHub Personal Access Token

1. Go to GitHub Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click "Generate new token (classic)"
3. Select these scopes:
   - `repo` (Full control of private repositories)
   - `admin:repo_hook` (Full control of repository hooks)
4. Copy the token

### 2. Configure Variables

1. Copy the example file:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` and fill in:
   ```hcl
   github_token    = "your_github_pat_here"
   github_username = "your_username_here"
   ```

3. Define repositories in the `repositories` map

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Plan the Changes

```bash
terraform plan
```

### 5. Apply the Configuration

```bash
terraform apply
```

## Example Repository Configuration

```hcl
repositories = {
  "project1" = {
    name        = "my-first-repo"
    description = "My first repository"
    private     = false
    auto_init   = true
    topics      = ["python", "terraform"]
  }

  "project2" = {
    name           = "my-private-repo"
    description    = "A private repository"
    private        = true
    has_issues     = true
    has_wiki       = true
    has_downloads  = false
    is_template    = false
  }
}
```

## Available Options

- `name` - Repository name (required)
- `description` - Repository description
- `private` - Whether repository is private (default: false)
- `auto_init` - Initialize with README (default: true)
- `has_issues` - Enable GitHub Issues (default: true)
- `has_projects` - Enable GitHub Projects (default: true)
- `has_wiki` - Enable GitHub Wiki (default: false)
- `has_downloads` - Enable Downloads (default: false)
- `is_template` - Make repository a template (default: false)
- `default_branch` - Default branch name (default: "main")
- `allow_merge_commit` - Allow merge commits (default: true)
- `allow_squash_merge` - Allow squash merging (default: true)
- `allow_rebase_merge` - Allow rebase merging (default: true)
- `allow_auto_merge` - Allow auto merge (default: false)
- `delete_branch_on_merge` - Delete branch on merge (default: true)
- `topics` - Repository topics (default: [])

## Outputs

After applying, these outputs will be available:
- `repository_urls` - Web URLs of repositories
- `repository_full_names` - Full names (owner/repo)
- `repository_clone_urls` - HTTPS clone URLs
- `repository_ssh_urls` - SSH clone URLs

View outputs:
```bash
terraform output
```

## Security Notes

⚠️ **Important**: Never commit `terraform.tfvars` to version control!

Alternative: Use environment variables
```bash
export TF_VAR_github_token="your_token"
export TF_VAR_github_username="your_username"
terraform apply
```

## Cleanup

To destroy all created repositories:

```bash
terraform destroy
```

## Useful Commands

```bash
# Format configuration
terraform fmt

# Validate configuration
terraform validate

# Show current state
terraform show

# List resources
terraform state list

# Remove a repository from state
terraform state rm 'github_repository.repo["project1"]'
```

## Troubleshooting

**Error: "Invalid or expired token"**
- Verify GitHub PAT is correct and has proper scopes

**Error: "Repository already exists"**
- The repository already exists on GitHub; Terraform can't recreate it
- Either import it: `terraform import github_repository.repo[key] repo-name`
- Or change the repository name

**Error: "You don't have permission"**
- Ensure your GitHub token has the required scopes
- Check repository permissions in your GitHub account
