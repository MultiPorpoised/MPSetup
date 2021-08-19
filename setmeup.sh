# TODO: allow customization and overrides
# Temporarily set working directory to MPSetup root
pushd "${BASH_SOURCE%/*}/" > /dev/null || exit

sudo apt-get update
sudo apt-get install git curl python3 python3-venv python3-pip software-properties-common apt-file
sudo apt-get update # update again to fill apt-file cache

# Set up system-wide python libraries (e.g. those used by vim)
pip3 install wheel

# Set up default venv
if [ -e ~/venv ]; then
    echo "~/venv already exists. Skipping creation."
else
    echo "Creating ~/venv"
    python3 -m venv ~/venv
    . ~/venv/bin/activate
    pip3 install wheel
    deactivate
fi

# Set .vimrc, .tmux.conf, and .bashrc to be the ones from this project.
# Does not modify the files if they already exist.
for FILE in .vimrc .tmux.conf .bashrc; do
    if [ -e ~/$FILE ]; then
        echo "~/$FILE already exists. If you wish to overwrite it, first remove it."
    else
        echo "softlinking $FILE"
        ln -s $(pwd)/$FILE ~/$FILE
    fi
done

if [ -e ~/.vim/bundle/Vundle.vim ]; then
    echo "Vundle already installed, skipping clone"
else
    echo "Setting up Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
echo "\n" | vim +PluginInstall! +qall

# Return working directory to previous state
popd > /dev/null

echo "Completed successfully!"
