# 📄 Changelog – SMSMobileAPI CLI

All notable changes to this project will be documented in this file.

---

## [v1.0.0] – 2025-05-24

### ✨ Added
- **New CLI SSH support**: Send SMS and WhatsApp messages from the terminal using `smsmobileapi`.
- `from=ssh` flag is automatically included in all requests for traceability.
- Optional API key configuration file: `~/.smsmobileapi.conf`.

### 🛠 Improved
- Better error handling for missing parameters.
- Automatic detection and use of stored API key.
- Interactive setup for API key during installation.

### 📦 Installation Example
```bash
curl -O https://smsmobileapi.com/downloads-cli/install-cli.sh && bash install-cli.sh
