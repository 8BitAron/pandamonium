


if [[ $* == *--nuke* ]]
then
  echo -e "Nuke is Set 🚀" 
  echo "Generateing list of installed brew Formulae & Casks... tmp/brewlist.txt"
  mkdir -p tmp
  brew list > tmp/brewlist.txt
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
fi


if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if test $(which brew); then
  echo "Homebrew is already installed"
fi

echo "Updating Homebrew..."
brew update

echo "Upgrading Homebrew..."
brew upgrade


echo "Installing Homebrew Formulae from Formulae.md ..."
brew install $(cat ./scripts/Formulae.md)

echo "Installing Homebrew Casks from Casks.md ..."
brew install $(cat ./scripts/Casks.md)
