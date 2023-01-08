# mydots

This is a repo of my personal dotfiles for `macOS`. The main philosophy is to
use a [modern unix](https://github.com/ibraheemdev/modern-unix) workflow.

## Inspiration

These dotfiles have been inspired by the following (and many more) people. I
thank them for so openly sharing their great work.

- [Josh Medeski](https://github.com/joshmedeski/dotfiles/tree/15576d333a884b4fb867a24f121162e4f4293a86)
- [Mathias Bynen's dotfiles](https://github.com/mathiasbynens/dotfiles)
  and in particular [his macOS dotfiles](https://github.com/mathiasbynens/dotfiles/blob/master/.macos)[]
- [Minh Phuc Tran's dotfiles](https://github.com/phuctm97/dotfiles)

## Main utilities

- see `./config/brew/Brewfile` for macos `brew` utilities

## Development Log of these dotfiles

The following a personal log for how these dotfiles were slowly built up over
time. It is meant for my personal recollection.

1.  The repo was created on github and cloned locally.
2.  Create a `.gitignore` file using
    [`gi`](https://docs.gitignore.io/install/command-line#linux-zsh) command line
    utility

    ```bash
    gi macos,R,VisualStudioCode,Python >> .gitignore
    ```

3.  Update this `README.md` with this log and additional details.
4.  Create a `.config` directory and various subdirectories using

    ```bash
    mkdir .config/{alacritty,brew,macos}
    ```

5.  Create a descriptive `Brewfile` bundle using

    ```bash
    cd .config/brew
    brew bundle dump --describe --force
    ```

6.  Update macos default settings

        ```bash
        cd .config/macos
        ./macos.sh
        ```

7.  Update `zsh`
<!-- TODO: Install gi instruction + script -->
