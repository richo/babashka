A [babushka](1) like clone, written in bash.

Write deps with a similar form to their babushka counterparts:

```bash

# dep zsh_installed
zsh_installed () {
  function is_met {
    which zsh
  }
  function meet {
    sudo aptitude install zsh
  }
  process # Process line is important, you must include it.
}
```

Then invoke:

```bash

babashka zsh_installed

```

[1]: https://babushka.me
