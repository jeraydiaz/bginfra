output "resources" {
  description = "List of resources created"
  value       = keys({ for idx, val in data.kubectl_file_documents.this : idx => val })  # Access specific instances using count.index
}
