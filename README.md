A [babushka](1) like clone, written in bash.

Write deps with a similar form to their babushka counterparts:

```bash

# dep zsh_installed
zsh_installed() {
  function is_met() {
    which zsh
  }
  function meet() {
    sudo aptitude install zsh
  }
  process # Process line is important, you must include it.
}

# dep mysql_environment
mysql_environment() {
  requires "mysql_server"
  requires "mysql_client"
}

mysql_server() {
  function is_met() {
    which mysqld
  }
  function meet() {
    sudo aptitude install mysql-server
  }
}

mysql_client() {
  function is_met() {
    which mysql
  }
  function meet() {
    sudo aptitude install mysql-client
  }
}
```

Then invoke:

```bash

babashka zsh_installed
babashka mysql_environment

```

[1]: https://babushka.me
