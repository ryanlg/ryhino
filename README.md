# Ryhino Project
Ryhino is the codename of a Homelab project that I started in late 2019 when I bought my first enterprise server - a used Dell R720. Then I got a proper switch, then another server, then, oh well. Now sitting behind me is a 15U rack with 3 servers that I actually don't knwo what to do with.

# Components
- Terraform: `.tf` config files that describe my AWS infrastructure, mainly Route 53 at this point.
- VMs: Various configurations related to services deployed on VMs, e.g. docker images or composes.

# Legacy History
This repo is pivoted from my old Terraform configs repo, which was hosted on Gitlab. To make sure I don't lose history, Terraform files are now moved under `terraform/` in a new commit, and other components are in their corresponding top-level directories.
