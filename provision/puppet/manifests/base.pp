Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

class system-update{
  exec { 'apt-get update':
    command => "sudo /usr/bin/apt-get -y update",
    before => Exec["apt-get_upgrade"],
  }
  
  exec {"apt-get_upgrade":
    command => "sudo /usr/bin/apt-get -y upgrade && /usr/bin/touch /root/upgraded",
    unless => "/usr/bin/test -s /root/updated"
    }
  }

#Compiler
class compiler {
  Package { ensure => "installed"}

  $dependencies = [
    "flex", "g++", "automake", "autoconf", "make", "bison", "build-essential", "llvm"
  ]

  package { $dependencies:
    require => Exec['apt-get update'],
  }
}

include system-update
include compiler