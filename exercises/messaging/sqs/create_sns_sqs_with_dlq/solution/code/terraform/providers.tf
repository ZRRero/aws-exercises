provider "aws" {
  alias = "master_region"

  default_tags {
    tags = {
      Author = "<Your name or email>"
      Type = "messaging"
    }
  }
}