# Will be prefixed to all resource names
# Use this to easily identify the resources created and provide entropy for subsequent environments
prefix = "ic"

# The project to deploy the infrastructure into
project_id = "xxx"

# Where to deploy the infrastructure
region = "australia-southeast2"

# --- Default Network
# Update to the network you would like to deploy into
#
# Note: If you opt to use your own network then you will need to define a subnetwork to deploy into as well
network    = "default"
subnetwork = ""

# --- SSH
# Update this to your IP Address
ssh_ip_allowlist = ["X.X.X.X/32"]
# Generate a new SSH key locally with `ssh-keygen`
# ssh-keygen -t rsa -b 4096 
ssh_key_pairs = [
  {
    user_name  = "xxx@xxx-MacBook-Pro.local"
    public_key = "ssh-rsa dvdsvsdvsdvsdv+OUOM8pDTOLOcLibMC7JCxq1nzzn7MolAvrIHqrgkTdR7vrxWExZdFy+eu8CKS2KVXqO55uDSRG+UGKJikcwO5M9pDaia5eaG9JXnNvNKrZPQDwRE2HLEz/z8z1EHEjxDGEXpyf7QsI0fV3Of9pYG9EYFjLw+15jki+LAULNQWtv3/4rJeemTdg2WGPkxhCsSuogg+nMjW7tJahPClyeOCcyzh1URvkwXOjxfIiQpzsdO3ZWHcF1ep9J63uuCsImfepe9DRbk/K46h6nXIwN2fEsMDZIqkx+dcdsvsdv xxx@xxx-MacBook-Pro.local"
  },
]

# --- Snowplow Iglu Server
iglu_db_name     = "iglu"
iglu_db_username = "iglu"
# Change and keep this secret!
iglu_db_password = "InCh3ape!"

# Used for API actions on the Iglu Server
# Change this to a new UUID and keep it secret!
iglu_super_api_key = "54673827-7386-1987-4576-000000000000"

# NOTE: To push schemas to your Iglu Server, you can use igluctl
# igluctl: https://docs.snowplowanalytics.com/docs/pipeline-components-and-applications/iglu/igluctl
# igluctl static push --public schemas/ http://CHANGE-TO-MY-IGLU-IP 00000000-0000-0000-0000-000000000000

# See for more information: https://github.com/snowplow-devops/terraform-google-iglu-server-ce#telemetry
# Telemetry principles: https://docs.snowplowanalytics.com/docs/open-source-quick-start/what-is-the-quick-start-for-open-source/telemetry-principles/
user_provided_id  = ""
telemetry_enabled = true

# --- SSL Configuration (optional)
ssl_information = {
  certificate_id = ""
  enabled        = false
}

# --- Extra Labels to append to created resources (optional)
labels = {}
