# TODO: allow customization and overrides
# Temporarily set working directory to MPSetup root
pushd "${BASH_SOURCE%/*}/" > /dev/null || exit

# TODO: install necessary packages


# TODO: set up other dotfiles
# Set .vimrc and .tmux.conf to be the ones from this project.
# Does not modify the files if they already exist.
for FILE in .vimrc .tmux.conf; do
    if [ -e ~/$FILE ]; then
        echo "~/$FILE already exists. If you wish to overwrite it, first remove it."
    else
        echo "softlinking $FILE"
        ln -s $(pwd)/$FILE ~/$FILE
    fi
done

# Return working directory to previous state
popd > /dev/null

echo "Completed successfully!"
