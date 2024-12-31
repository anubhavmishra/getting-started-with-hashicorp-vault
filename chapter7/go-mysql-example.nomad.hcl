job "go-mysql-example" {
  datacenters = ["dc1"]

  group "example" {
    network {
      port "http" {
        to = 8080
      }
    }

    task "server" {

      vault {
        policies = ["mysql-database-access"]
      }

      driver = "docker"
      config {
        image = "anubhavmishra/go-mysql-example:latest"
        ports = ["http"]
      }

      template {
        data        = <<EOH
          {{ with secret "database/creds/nomadmysqlaccess" }}
          MYSQL_USERNAME="{{.Data.username}}"
          MYSQL_PASSWORD="{{.Data.password}}"
          {{ end }}
          EOH
        env         = true
        destination = "secrets/env.secrets"
      }

      template {
        data        = <<EOH
            {{ range nomadService "mysql-server" }}
            MYSQL_ADDRESS="{{ .Address }}:{{ .Port }}"
            {{ end }}
            EOH
        destination = "local/env.txt"
        env         = true
      }

      service {
        name = "go-mysql-example"
        port = "http"
        provider = "nomad"

        check {
          type     = "http"
          name     = "server_health"
          path     = "/"
          interval = "10s"
          timeout  = "5s"
        }
      }
    }
  }
}


