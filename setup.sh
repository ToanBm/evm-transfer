#!/bin/bash

# GitHub repository URL
REPO_URL="https://github.com/dante4rt/evm-auto-transfer.git"
FOLDER_NAME="evm-auto-transfer"

# Clone the repository
echo "🚀 Cloning repository..."
git clone $REPO_URL

# Navigate into the project directory
cd $FOLDER_NAME || exit

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Check if privateKeys.json already exists
if [ ! -f "privateKeys.json" ]; then
    echo "🔑 Enter your Private Key (without 0x):"
    read -s PRIVATE_KEY

    # Validate Private Key length
    if [ ${#PRIVATE_KEY} -ne 64 ]; then
        echo "❌ Invalid Private Key! It must be exactly 64 hex characters."
        exit 1
    fi

    # Write to privateKeys.json
    echo "[\"0x$PRIVATE_KEY\"]" > privateKeys.json
    echo "✅ privateKeys.json has been created successfully!"
else
    echo "✅ privateKeys.json already exists."
fi

# Start the bot
echo "🚀 Starting the bot..."
npm start
