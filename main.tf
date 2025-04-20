terraform {
  required_providers {
    snowflake = {
      source  = "Snowflakedb/snowflake"
      version = "1.0.5"
    }
  }
}

provider "snowflake" {
  organization_name = "sfcsupport"
  account_name      = "tusharazeurope"
  user              = "tf_user"
  authenticator     = "SNOWFLAKE_JWT"
  role              = "SYSADMIN"
  private_key       = file("~/keypair/tf_user_private_key.p8")
}

resource "snowflake_database" "db" {
  name = "TF_DEMO"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "TF_DEMO"
  warehouse_size = "xsmall"
  auto_suspend   = 60
}
