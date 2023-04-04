## Execution steps
- Login to GCP from Terminal
```
gcloud auth login # login with desired user
gcloud auth application-default login # login with desired user (enter Y if prompted)
```

- Clone this repo to local
```
cd snowplow
```

## set up iglu server
```
cd iglu_server
```
- update terraform.tfvars with correct params
```terraform
terraform init
terraform apply -target=module.iglu_db.google_sql_database.db -target=module.iglu_db.google_sql_database_instance.instance -target=module.iglu_db.google_sql_user.user -target=module.iglu_db.random_id.db_name_suffix
```
PS: above command takes approximately 20 mins

```terraform
terraform apply -target=module.iglu_server.data.google_compute_image.ubuntu_20_04 -target=module.iglu_server.google_compute_firewall.egress -target=module.iglu_server.google_compute_firewall.ingress -target=module.iglu_server.google_compute_firewall.ingress_ssh -target=module.iglu_server.google_compute_health_check.hc -target=module.iglu_server.google_compute_instance_template.tpl -target=module.iglu_server.google_compute_region_instance_group_manager.grp -target=module.iglu_server.google_project_iam_member.sa_cloud_sql_client -target=module.iglu_server.google_project_iam_member.sa_logging_log_writer -target=module.iglu_server.google_service_account.sa -target=module.iglu_server.module.telemetry[0].random_id.auto_generated_id -target=module.iglu_server.module.telemetry[0].snowplow_track_self_describing_event.telemetry
```
PS: above command takes approximately 5 mins

```terraform
terraform apply -target=module.iglu_lb.google_compute_backend_service.lb_backend -target=module.iglu_lb.google_compute_global_address.ip -target=module.iglu_lb.google_compute_global_forwarding_rule.lb_http_forwarding_rule -target=module.iglu_lb.google_compute_target_http_proxy.lb_target_http_proxy -target=module.iglu_lb.google_compute_url_map.lb_url_map
```
PS: above command takes approximately 5 mins
PS: Save output IP for specifying in the pipeline code

## set up pipeline
```
cd ../pipeline
```

```terraform
terraform init
```

```terraform
terraform apply -target=module.bad_1_topic.google_pubsub_topic.topic -target=module.raw_topic.google_pubsub_topic.topic -target=module.enriched_topic.google_pubsub_topic.topic
```
PS: above command takes approximately 3 mins

```terraform
terraform apply -target=module.collector_pubsub.data.google_compute_image.ubuntu_20_04 -target=module.collector_pubsub.google_compute_firewall.egress -target=module.collector_pubsub.google_compute_firewall.ingress -target=module.collector_pubsub.google_compute_firewall.ingress_ssh -target=module.collector_pubsub.google_compute_health_check.hc -target=module.collector_pubsub.google_compute_instance_template.tpl -target=module.collector_pubsub.google_compute_region_instance_group_manager.grp -target=module.collector_pubsub.google_project_iam_member.sa_logging_log_writer -target=module.collector_pubsub.google_project_iam_member.sa_pubsub_publisher -target=module.collector_pubsub.google_project_iam_member.sa_pubsub_viewer -target=module.collector_pubsub.google_service_account.sa -target=module.collector_pubsub.module.telemetry[0].random_id.auto_generated_id -target=module.collector_pubsub.module.telemetry[0].snowplow_track_self_describing_event.telemetry
```
PS: above command takes approximately 5 mins

```terraform
terraform apply -target=module.collector_lb.google_compute_backend_service.lb_backend -target=module.collector_lb.google_compute_global_address.ip -target=module.collector_lb.google_compute_global_forwarding_rule.lb_http_forwarding_rule -target=module.collector_lb.google_compute_global_forwarding_rule.lb_https_forwarding_rule[0] -target=module.collector_lb.google_compute_ssl_policy.lb_target_https_ssl_policy[0] -target=module.collector_lb.google_compute_target_http_proxy.lb_target_http_proxy -target=module.collector_lb.google_compute_target_https_proxy.lb_target_https_proxy[0] -target=module.collector_lb.google_compute_url_map.lb_url_map
```
PS: Save output IP for Collector

```terraform
terraform apply -target=module.enrich_pubsub.data.google_compute_image.ubuntu_20_04 -target=module.enrich_pubsub.google_compute_firewall.egress -target=module.enrich_pubsub.google_compute_firewall.ingress_ssh -target=module.enrich_pubsub.google_compute_instance_template.tpl -target=module.enrich_pubsub.google_compute_region_instance_group_manager.grp -target=module.enrich_pubsub.google_project_iam_member.sa_logging_log_writer -target=module.enrich_pubsub.google_project_iam_member.sa_pubsub_publisher -target=module.enrich_pubsub.google_project_iam_member.sa_pubsub_subscriber -target=module.enrich_pubsub.google_project_iam_member.sa_pubsub_viewer -target=module.enrich_pubsub.google_project_iam_member.sa_storage_object_viewer -target=module.enrich_pubsub.google_pubsub_subscription.in -target=module.enrich_pubsub.google_service_account.sa -target=module.enrich_pubsub.module.telemetry[0].random_id.auto_generated_id -target=module.enrich_pubsub.module.telemetry[0].snowplow_track_self_describing_event.telemetry
```


