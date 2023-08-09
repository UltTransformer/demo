# Create new storage bucket in the US multi-region
# with standard storage

resource "google_storage_bucket" "gcp-demo-bucket" {
  name                        = "cn-gcp-demo-bucket-2uec2bec"
  location                    = "US"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}
