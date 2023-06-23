# Terraform Agent
Configuration files for spinning up a Terraform Cloud Agent.


# Setup
## Terraform Cloud
 - Log into Terraform cloud
 - Select an organization (or create one if you don't have one already)
 - Click `Settings` on the left pane
 - Under *Security*, click `Agents`
 - Click `Create agent pool`
 - Give it a name (Such as `homelab-pool`)
 - Make sure to copy the `AGENT-TOKEN` given for the container to use

## Local container
 - Copy the `docker-compose.yml` and `.env.example` files to your local machine, and rename `.env.example` to `.env`
 - In the `.env` file:
   - Replace `your-agent-name` with whatever name you want to use
   - Replace `token-from-tf-cloud` with the `AGENT-TOKEN` you copied earlier
 - Bring up the container with `docker compose up -d`


# Usage
## Terraform Cloud
Agents are used per workspace. To use the agent in a workspace, do the following:

 - Create a project and workspace if you haven't already
 - Navigate to your Project/Workspace
 - Click `Settings` on the left pane
 - Scroll down to *Execution Mode*
 - Select `Agent` from the list of options
 - In the *Agent pool* dropdown, select the agent pool you created
 - Scroll to the bottom, and click `Save settings`

## Run usage
In your Terraform project files (local or remote), add a file called `terraformCloud.tf` with the following (or add to existing file):

```terraform
terraform {
    cloud {
        organization = "your-organization-name"
            workspaces {
                name = "your-workspace-name"
        }
    }
}