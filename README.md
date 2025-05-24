# SMSMobileAPI CLI

Send **SMS and WhatsApp messages via SSH** using your own mobile device and real phone number.  
Perfect for developers, sysadmins, and automation — secure, private, and simple.

---

## 📦 Features

- Send SMS or WhatsApp messages from the command line
- Uses your own mobile number (no third-party SMS gateway)
- Fast installation, works on any Linux server
- Ideal for scripts, CRON jobs, and server alerts
- 3-day free trial, no credit card required
- Full control over logs and message privacy

---

## ⚙️ Requirements

- A Linux system (Ubuntu, CentOS, Debian, etc.)
- `curl` installed
- Your own Android or iOS phone
- The **official SMSMobileAPI mobile app**, required to send messages from your device:
  - Android: https://play.google.com/store/apps/details?id=com.smsmobileapiapp  
  - iOS: https://apps.apple.com/us/app/sms-mobile-api/id6667092442

---

## 📲 Download the Mobile App

To use this CLI, install the **SMSMobileAPI** app on your mobile phone.  
The app connects your device to the API and allows messages to be sent using your real number (SMS or WhatsApp).

Download links:

- Google Play: https://play.google.com/store/apps/details?id=com.smsmobileapiapp  
- App Store: https://apps.apple.com/us/app/sms-mobile-api/id6667092442

Once installed, your API key is generated and linked to your device.  
You get 3 days of free trial access — no registration or credit card required.

---

## 📥 Installation

Install the CLI in one command:

```bash
curl -O https://smsmobileapi.com/downloads-cli/install-cli.sh && bash install-cli.sh
```

This will:

- Download the latest version of the script
- Make it available globally as `smsmobileapi`
- Optionally prompt for your API key and store it

---

## 🚀 Usage Example

Send an SMS:

```bash
smsmobileapi send --to "+32471234567" --message "Hello from server" --via sms
```

Send a WhatsApp message:

```bash
smsmobileapi send --to "+32471234567" --message "Hello from server" --via whatsapp
```

You can also provide your API key directly:

```bash
smsmobileapi send --apikey "your_api_key" --to "+32471234567" --message "With API key" --via sms
```

---

## 🔐 How to Store Your API Key

You can store your API key in a config file to avoid typing it every time.

Create a file:

```bash
nano ~/.smsmobileapi.conf
```

With content:

```ini
apikey=YOUR_API_KEY
```

Make it private:

```bash
chmod 600 ~/.smsmobileapi.conf
```

The script will automatically detect and use this key.

---

## 🔒 Privacy & Control

SMS and WhatsApp messages are sent directly from **your own mobile phone** using **your own number**.  
There is no external gateway involved. You are in full control:

- Your number is used as the sender
- You own the logs and delivery history
- Your messages are private and traceable
- A `from=ssh` tag is included to mark SSH-originated messages

---

## 📤 Example Response

```bash
🧾 Response: {"success":true,"message":"SMS sent successfully"}
```

---

## 📌 Versioning

Version is stored in the `VERSION` file.  
Full release notes in [`CHANGELOG.md`](CHANGELOG.md)

---

## 📄 License

MIT License — see [`LICENSE`](LICENSE)
