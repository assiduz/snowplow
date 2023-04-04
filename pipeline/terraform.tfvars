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
    public_key = "ssh-rsa adcsdvsdvd+OUOM8pDTOLOcLibMC7JCxq1nzzn7MolAvrIHqrgkTdR7vrxWExZdFy+eu8CKS2KVXqO55uDSRG+UGKJikcwO5M9pDaia5eaG9JXnNvNKrZPQDwRE2HLEz/dcsdcscscscsc+15jki+LAULNQWtv3/4rJeemTdg2WGPkxhCsSuogg+nMjW7tJahPClyeOCcyzh1URvkwXOjxfIiQpzsdO3ZWHcF1ep9J63uuCsImfepe9DRbk/K46h6nXIwN2fEsMDZIqkx+7ioiwaVpwDf1SNovI07NjDTdDGuFy8sR8yeEw3J1hYWz5V8OEvv bibinnahas@Bibins-MacBook-Pro.local"
  }
]

# --- Iglu Server Configuration
# Iglu Server DNS output from the Iglu Server stack
iglu_server_dns_name = "http://<output_ip_iglu>"
# Used for API actions on the Iglu Server
# Change this to the same UUID from when you created the Iglu Server
iglu_super_api_key = "54673827-7386-1987-4576-000000000000"

# --- Snowplow Postgres Loader
postgres_db_enabled  = false

postgres_db_name     = "dummy"
postgres_db_username = "dummy"
# Change and keep this secret!
postgres_db_password = "dummy"
# IP ranges that you want to query the Pipeline Postgres Cloud SQL instance from directly over the internet.  An alternative access method is to leverage
# the Cloud SQL Proxy service which creates an IAM authenticated tunnel to the instance
#
# Details: https://cloud.google.com/sql/docs/postgres/sql-proxy
#
# Note: this exposes your data to the internet - take care to ensure your allowlist is strict enough
postgres_db_authorized_networks = []
# Note: the size of the database instance determines the number of concurrent connections - each Postgres Loader instance creates 10 open connections so having
# a sufficiently powerful database tier is important to not running out of connection slots
postgres_db_tier = "db-g1-small"

# See for more information: https://registry.terraform.io/modules/snowplow-devops/collector-pubsub-ce/google/latest#telemetry
# Telemetry principles: https://docs.snowplowanalytics.com/docs/open-source-quick-start/what-is-the-quick-start-for-open-source/telemetry-principles/
user_provided_id  = ""
telemetry_enabled = true

# --- SSL Configuration (optional)
ssl_information = {
  certificate_id = "xxx"
  enabled        = false
}

# --- Extra Labels to append to created resources (optional)
labels = {}
