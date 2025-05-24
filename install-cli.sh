#!/bin/bash

echo "📥 Downloading SMSMobileAPI CLI script..."

curl -s -O https://smsmobileapi.com/downloads-cli/smsmobileapi.sh

if [ ! -f smsmobileapi.sh ]; then
    echo "❌ Failed to download smsmobileapi.sh"
    exit 1
fi

# Convert to UNIX format if dos2unix exists
if command -v dos2unix &> /dev/null; then
    dos2unix smsmobileapi.sh >/dev/null 2>&1
fi

chmod +x smsmobileapi.sh
sudo mv smsmobileapi.sh /usr/local/bin/smsmobileapi

echo "✅ Installation complete."
echo ""

# Prompt for API key
read -p "🔐 Enter your SMSMobileAPI API key to save it (optional, just press Enter to skip): " USER_API_KEY

if [ -n "$USER_API_KEY" ]; then
    CONFIG_PATH="$HOME/.smsmobileapi.conf"
    echo "apikey=$USER_API_KEY" > "$CONFIG_PATH"
    chmod 600 "$CONFIG_PATH"
    echo "✅ API key saved to $CONFIG_PATH"
else
    echo "ℹ️ You can manually create ~/.smsmobileapi.conf with your API key:"
    echo "apikey=YOUR_API_KEY"
fi

echo ""
echo "🚀 You can now run:"
echo "smsmobileapi send --to \"+3247xxxxxxx\" --message \"Hello\" --via sms"
