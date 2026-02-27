zlorfi's dotfiles
=================

* copy to your ~ ($HOME)
* create symlinks via the `make_my_dotfiles.sh` script
* install a patched [Nerd Font](https://www.nerdfonts.com/) (e.g., Sauce Code Pro) for terminal/editor icons
* change the font of your default terminal app to the installed Nerd Font
* neovim plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim) and will install automatically on first launch
* secrets can be stored inside `zsh_secrets`, for using LiteLLM as a provider, the secrets needs to be in the form of: `export LITELLM_API_KEY=sk-YOUR_SECRET_KEY`
