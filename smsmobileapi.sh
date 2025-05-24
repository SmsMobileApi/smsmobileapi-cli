#!/bin/bash

BASE_URL="https://api.smsmobileapi.com/sendsms/"

CONFIG_FILE="$HOME/.smsmobileapi.conf"
API_KEY_FROM_FILE=""

# Load API key from config file if it exists
if [[ -f "$CONFIG_FILE" ]]; then
    API_KEY_FROM_FILE=$(grep '^apikey=' "$CONFIG_FILE" | cut -d '=' -f2- | tr -d '\r')
fi

function usage() {
    echo "Usage: smsmobileapi send [--apikey <your_api_key>] --to <number> --message <text> [--via sms|whatsapp]"
    echo "Or store your API key in ~/.smsmobileapi.conf like this:"
    echo "apikey=YOUR_API_KEY"
}

if [[ "$1" == "send" ]]; then
    shift
    VIA_SMS=0
    VIA_WHATSAPP=0
    API_KEY=""
    
    while [[ "$#" -gt 0 ]]; do
        case $1 in
            --apikey) API_KEY="$2"; shift ;;
            --to) TO="$2"; shift ;;
            --message) MESSAGE="$2"; shift ;;
            --via)
                case $2 in
                    sms) VIA_SMS=1 ;;
                    whatsapp) VIA_WHATSAPP=1 ;;
                    *) echo "❌ Invalid value for --via. Use 'sms' or 'whatsapp'."; usage; exit 1 ;;
                esac
                shift
                ;;
            *) echo "Unknown parameter: $1"; usage; exit 1 ;;
        esac
        shift
    done

    # Fallback to config file API key
    if [[ -z "$API_KEY" && -n "$API_KEY_FROM_FILE" ]]; then
        API_KEY="$API_KEY_FROM_FILE"
    fi

    # Final check
    if [[ -z "$API_KEY" ]]; then
        echo "❌ API key not provided and not found in ~/.smsmobileapi.conf"
        exit 1
    fi

    RESPONSE=$(curl -s -X POST "$BASE_URL" \
    -d "recipients=$TO" \
    -d "message=$MESSAGE" \
    -d "apikey=$API_KEY" \
    -d "sendsms=$VIA_SMS" \
    -d "sendwa=$VIA_WHATSAPP" \
    -d "from=ssh")

    echo "🧾 Response: $RESPONSE"
else
    usage
fi
