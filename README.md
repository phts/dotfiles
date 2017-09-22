# Dotfiles

Tool to backup/restore config files.

This is my _bicycle_ and does not aim at originality.

`dotfiles` can be exported as a global executable file via symlink, `$PATH`, etc.

## Folder structure

Each set of configs should be placed in separate folders.
Names of such folders should not contain spaces.
These folders should contain the same hierarchy which should be
in the user folder (`~`) of the target system.
Optionally this path can be changed for specific configs via
amending `path` file.

Additionally there is a support for post-install scripts. They can be added in `postinstall` file.

### Example:

Some config structure:

    my configs
      \_ git
      |  \_ .gitconfig
      |
      |_ profile
      |  \_ .profile
      |
      |_ sublime-text-3
      |  \_ .config
      |     \_ sublime-text-3
      |        \_ Packages
      |           \_ User
      |              |_ Default (Linux).sublime-keymap
      |              |_ Default (Linux).sublime-mousemap
      |              \_ Preferences.sublime-settings
      |
      \_ zsh
         \_ .zshrc

And a workflow example:

    $ cd "my configs"
    $ git pull                          <--- pull changes from your repo with configs
    $ dotfiles install git              <--- install git configs from the repo to the system
    $ dotfiles update sublime-text-3    <--- copy Sublime Text configs from the system to the local repo
    $ git commit -am "Update Sublime Text configs"    <--- commit updated configs
    $ git push                                        <--- and push

## Methods

* Print difference between local and outside configs

        dotfiles diff [APP]...

* Install local configs to the system

        dotfiles install [APP]...

* Print system installation path

        dotfiles path APP

* Run post-install scripts (it is being run automatically after install)

        dotfiles postinstall [APP]...

* Update local configs from the system

        dotfiles update [APP]...
