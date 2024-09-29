workspace=$1

if [ -z "$workspace" ]; then
  echo "Usage: ghconfig.sh <workspace>"
  exit 1
fi

# move ~/.ssh/personal/* to 
echo "Copying ~/.ssh/$workspace/* to ~/.ssh/"
cp ~/.ssh/$workspace/* ~/.ssh/

echo "Copying ~/.config/gh/$workspace/* to ~/.config/gh/"
cp ~/.config/gh/$workspace/* ~/.config/gh/
