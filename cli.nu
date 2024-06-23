const BASE_DIR = "E:/Workspace/Work"

const GITHUB_DELIMITER = "->"
const GITLAB_DELIMITER = "/"

# Get all the projects from GitLab
glab api /projects?owned=yes | from json | select "id" "name" "path_with_namespace" "visibility" | save "data/projs.json" -f
# Filter out the projects that are not archived
gh api /user/repos | from json | select full_name html_url archived private | save "data/repos.json" -f