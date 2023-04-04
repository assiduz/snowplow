output "collector_ip_address" {
  description = "The IP address for the Pipeline Collector"
  value       = module.collector_lb.ip_address
}
