exit_after_auth = false
pid_file        = "./pidfile"

auto_auth {
  method "approle" {
    mount_path = "auth/approle"
    config = {
      role_id_file_path                   = "DIR_REPLACE/roleid"
      secret_id_file_path                 = "DIR_REPLACE/secretid"
      remove_secret_id_file_after_reading = true
    }
  }

  sink "file" {
    config = {
      path = "DIR_REPLACEapproleToken"
    }
  }
}

cache {
  use_auto_auth_token = true
}

listener "tcp" {
  address     = "127.0.0.1:8007"
  tls_disable = true
}


vault {
  address = "http://127.0.0.1:8200"
}
