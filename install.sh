echo "========================"
echo "brew install start"
echo "========================"
echo ""

# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update-reset
brew tap Homebrew/bundle
brew bundle

echo ""
echo "========================"
echo "brew install end"
echo "========================"
echo ""
