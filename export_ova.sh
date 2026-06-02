#!/bin/bash

# 1. Build the VM using Vagrant
echo "--- Starting VM build with Vagrant ---"
vagrant up

# 2. Run the application setup inside the VM
echo "--- Running application setup inside VM ---"
vagrant ssh -c "cd /vagrant && chmod +x start.sh && ./start.sh"

# 3. Gracefully shut down the VM (Required for export)
echo "--- Shutting down VM for export ---"
vagrant halt

# 4. Export to .ova using VirtualBox CLI
echo "--- Exporting to assignment-3.ova ---"
# Remove existing file if it exists
rm -f assignment-3.ova
vboxmanage export "DevOps-Assignment-3" -o assignment-3.ova

# 5. Check file size
FILE_SIZE=$(du -m assignment-3.ova | cut -f1)
echo "--- Export complete. File size: ${FILE_SIZE}MB ---"

if [ $FILE_SIZE -gt 90 ]; then
    echo "WARNING: .ova file is larger than 90MB."
    echo "GitHub has a 100MB limit per file. You might need Git LFS."
fi

# 6. Push to Git
echo "--- Pushing .ova to GitHub ---"
git add assignment-3.ova
git commit -m "Add generated .ova file"
git push

echo "--- Done! ---"
