provider "google" {
  credentials = file("env0-config.json")
  project     = "synk-demo"
  region      = "us-east-1"
}