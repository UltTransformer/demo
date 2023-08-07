# Create new storage bucket in the US multi-region
# with standard storage

resource "google_storage_bucket" "gcp-demo-bucket" {
 name          = "gcp-demo-bucket"
 location      = "US"
 storage_class = "STANDARD"
 uniform_bucket_level_access = true
}

# Upload a text file as an object
# to the storage bucket

resource "google_storage_bucket_object" "default" {
 name         = "gcp-demo-bucket"
 source       = "gcp-demo-bucket"
 content_type = "text/plain"
 bucket       = google_storage_bucket.static.id
}