vault {
  address = "http://127.0.0.1:8200"
}

auto_auth {
  method "approle" {
    config {
      role_id_file_path = "./role_id" 
      secret_id_file_path = "./secret_id"
      remove_secret_id_file_after_reading = false
    }
  }
  
}

cache {
  use_auto_auth_token = true
}

listener "tcp" {
  address = "127.0.0.1:8300"
  tls_disable = true
}
