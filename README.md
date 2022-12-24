# mydots

This is a repo of my personal dotfiles for `macOS`. The main philosophy is to
use a [modern unix](https://github.com/ibraheemdev/modern-unix) workflow.

## Inspiration

These dotfiles have been inspired by the following (and many more) people. I
thank them for so openly sharing their great work.

<!-- TODO: Add links -->
- Mathias Bynens
- Tran

## Development Log of these dotfiles

The following a personal log for how these dotfiles were slowly built up over
time. It is meant for my personal recollection.

1. The repo was created on github and cloned locally.
2. Create a `.gitignore` file using
   [`gi`](https://docs.gitignore.io/install/command-line#linux-zsh) command line
   utility

   ```bash
   gi macos,R,VisualStudioCode,Python >> .gitignore
   ```

3. Update this `README.md` with this log and additional details.
4. Create a `.config` directory and various subdirectories using

   ```bash
   mkdir .config/{alacritty,brew,macos}
   ```

5. Create a descriptive `Brewfile` bundle using

   ```bash
   cd .config/brew
   brew bundle dump --describe
   ```

<!-- TODO: Install gi instruction + script -->