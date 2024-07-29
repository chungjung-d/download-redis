# Install pnpm globally
npm install -g pnpm

Remove-Item -Recurse -Force .\build\windows\app
# Copy app directory to build/linux
Copy-Item -Recurse -Force .\app .\build\windows

# Change directory to build/linux/app
Set-Location .\build\windows\app

# Install dependencies using pnpm
npm install

# Remove .gitignore file
Remove-Item .gitignore

# Change directory back to the root
Set-Location -Path (Join-Path -Path (Get-Location) -ChildPath '..\..\..')

# Configure global git user name and email
git config --global user.name 'Jaeyong Sung'
git config --global user.email 'buttercrab@users.noreply.github.com'

# Add all changes to git staging
git add .

# Commit changes with a message
git commit -m "[auto] build node_modules" 2>&1 | out-null

# Loop to pull and push changes up to 3 times
for ($i = 1; $i -le 3; $i++) {
    git pull --rebase
    git push
    if ($?) { break }
    Start-Sleep -Seconds 1
}