# TODO: allow customization and overrides
# Temporarily set working directory to MPSetup root
pushd "${BASH_SOURCE%/*}/" > /dev/null || exit

# TODO: install necessary packages

# TODO: set up other dotfiles
# Set .vimrc to be the one from this project.
# Does not modify the file if it already exists.
if [ -e ~/.vimrc ]; then
    echo "~/.vimrc already exists. If you wish to overwrite it, first remove it."
else
    echo "softlinking .vimrc"
    ln -s $(pwd)/.vimrc ~/.vimrc
fi

# Return working directory to previous state
popd > /dev/null

echo "Completed successfully!"
