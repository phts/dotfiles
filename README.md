# Dotfiles

*DEPRECATED in favor of [dtfls](https://github.com/phts/dtfls).*

---

Tool to backup/restore config files.

This is my _bicycle_ and does not aim at originality.

`dotfiles` can be exported as a global executable file via symlink, `$PATH`, etc.

## Folder structure

Each set of configs should be placed in separate folders.
Names of such folders should not contain spaces.
These folders should contain the same hierarchy which should be
in the user folder (`~`) of the target system.

Mapping of local path to system path for particular configs can be changed
in a file `path.user`.

Additionally there is a support for post-install scripts. They can be added in
`postinstall.user` file.

Both `path.user` and `postinstall.user` files should have `+x` permission
and should be placed in the config storage root.
`examples/path.user.example` and `examples/postinstall.user.example` are
presented in this repo in order to simply copy, rename and add own content.

### Example

Config structure example:

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
      |_ zsh
      |  \_ .zshrc
      |
      |_ path.user
      \_ postinstall.user

And a workflow example:

    $ cd "my configs"
    $ git pull                          <--- pull changes from your repo with configs
    $ dotfiles install git              <--- install git configs from the repo to the system
    $ dotfiles pull sublime-text-3      <--- copy Sublime Text configs from the system to the local repo
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

* Pull configs from the system to the local folder

        dotfiles pull [APP]...
