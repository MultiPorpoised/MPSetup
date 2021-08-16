# TODO: allow customization and overrides
# Temporarily set working directory to MPSetup root
pushd "${BASH_SOURCE%/*}/" > /dev/null || exit

# TODO: install necessary packages
sudo apt-get update
sudo apt-get install python3 python3-venv

# Set up default venv
if [ -e ~/venv ]; then
    echo "~/venv already exists. Skipping creation."
else
    echo "Creating ~/venv"
    python3 -m venv ~/venv
fi

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
