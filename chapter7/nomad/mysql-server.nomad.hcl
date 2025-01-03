job "mysql-server" {
  datacenters = ["dc1"]
  type        = "service"

  group "mysql-server" {
    count = 1

    restart {
      attempts = 10
      interval = "5m"
      delay    = "25s"
      mode     = "delay"
    }

    task "mysql-server" {
      driver = "docker"

      env = {
        "MYSQL_ROOT_PASSWORD" = "gettingstartedwithvaultexamplepassword" # WARNING: SETTING MYSQL PASSWORD THIS WAY IS VERY INSECURE AND THIS IS FOR THE PURPOSES OF THIS BOOK ONLY. DO NOT USE THIS IN PRODUCTION!
      }

      config {
        image = "hashicorp/mysql-portworx-demo:latest"
        ports = ["db"]
      }
      
      resources {
        cpu    = 500
        memory = 1024
      }

      service {
        name = "mysql-server"
        port = "db"
        provider = "nomad"

        check {
          type     = "tcp"
          interval = "5s"
          timeout  = "2s"
        }
      }
    }
    
    network {
      port "db" {
        static = 3306
      }
    }
  }
}
