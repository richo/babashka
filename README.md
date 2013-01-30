A [babushka](1) like clone, written in bash.

## Installing

Clone this repo to the location of your choice, and add `babashka/bin` to your path.

```bash
git clone https://github.com/richo/babashka
echo "export PATH=$PWD/babashka/bin:\${PATH}" >>.bashrc
```

## Organising deps

`babashka` looks for dependencies in the `deps/` folder within the current directory, so firstly make this folder. Then write dependencies in files ending in `.bash` within that folder, for example `deps/server.bash`.

## Writing deps

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
  # Don't need process if this dep doesn't have meet or is_met
}

mysql_server() {
  function is_met() {
    which mysqld
  }
  function meet() {
    sudo aptitude install mysql-server
  }
  process
}

mysql_client() {
  function is_met() {
    which mysql
  }
  function meet() {
    sudo aptitude install mysql-client
  }
  process
}
```

## Running deps

Then invoke:

```bash

babashka zsh_installed
babashka mysql_environment
```

[1]: https://babushka.me
