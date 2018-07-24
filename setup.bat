set DOTFILES_PATH=%~p0dotfiles
echo %DOTFILES_PATH%

mklink "%USERPROFILE%\.ctags" "%DOTFILES_PATH%\.ctags"
mklink "%USERPROFILE%\.tigrc" "%DOTFILES_PATH%\.tigrc"
mklink "%USERPROFILE%\.vimrc" "%DOTFILES_PATH%\.vimrc"
mklink "%USERPROFILE%\.gvimrc" "%DOTFILES_PATH%\.gvimrc"
mklink "%USERPROFILE%\.gitconfig" "%DOTFILES_PATH%\.gitconfig"

mklink /D "%USERPROFILE%\.vim" "%DOTFILES_PATH%\.vim"


