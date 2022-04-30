# Goes through all the directories in the current directory and assumes they are git repositories.
# Check if each repository is up to date with version on the git server.
# If not it will yell which directory isn't up to date.

curdir="$PWD"
for d in */; do
  cd "$curdir/$d"
  if [[ -d "./.git" ]]; then
    git fetch
    if ! [[ "$(git status)" == *"nothing to commit, working tree clean"* ]]; then
      echo "Not the same as the git server: $d"
    fi
  else
    echo "Doesn't have a git server: $d"
  fi
done
cd $curdir

echo "Done"
