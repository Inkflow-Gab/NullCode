# OpenCode UNLIMITED (NullCode bundle)

Proxy + OpenCode CLI wrapper for Android/Termux and proot Ubuntu (WARP-rotated free gateway).  
**Updated in this repo:** `pair` helper command added, install/update script + commands separated for easy copy-paste.

> **NullCode app pairing note:** this bundle is the proxy/CLI wrapper. To pair the **NullCode Android app** with a NullCode/OpenCode **server**, generate the pairing link/QR on the **server machine** (server pairing command/menu), then paste/scan it in the app. `opencode-unlimited pair` prints help and will try `POST http://127.0.0.1:4096/api/pair` if a local server with pairing API is running.

---

## Install (curl)

```bash
curl -fsSL https://raw.githubusercontent.com/Inkflow-Gab/NullCode/main/opencode-unlimited/install.sh | bash
```

## Install (manual / local folder)

```bash
bash /storage/emulated/0/nullopens/opencode-unlimited/install.sh
```

```bash
python3 /storage/emulated/0/nullopens/opencode-unlimited/setup.py install
```

## Update

```bash
curl -fsSL https://raw.githubusercontent.com/Inkflow-Gab/NullCode/main/opencode-unlimited/install.sh | bash
```

```bash
opencode-proxy repair
```

```bash
opencode-proxy status
```

---

## Commands (copy 1 by 1)

### Start / stop

```bash
opencode-unlimited
```

```bash
opencode-unlimited start
```

```bash
opencode-unlimited start --continue
```

```bash
opencode-unlimited stop
```

```bash
opencode-unlimited restart
```

```bash
opencode-unlimited status
```

### Pairing helper

```bash
opencode-unlimited pair
```

```bash
opencode-proxy status
```

```bash
curl -sS -X POST http://127.0.0.1:4096/api/pair
```

### Proxy / diagnostics

```bash
opencode-proxy start
```

```bash
opencode-proxy stop
```

```bash
opencode-proxy status
```

```bash
opencode-proxy logs
```

```bash
opencode-proxy doctor
```

```bash
opencode-proxy repair
```

### Install / maintenance

```bash
python3 ~/.opencode-proxy/setup.py install
```

```bash
python3 ~/.opencode-proxy/setup.py status
```

---

## Paths (this install)

- Setup: `~/.opencode-proxy/setup.py`
- Binaries: `~/.local/bin/opencode-unlimited`, `~/.local/bin/opencode`, `~/.local/bin/opencode-proxy`
- API: `http://127.0.0.1:8080/v1`
- Dashboard: `http://127.0.0.1:8081`

## Notes

- `install.sh` re-downloads latest bundle files from this repo and runs `setup.py install` (safe to re-run for updates).
- If `pair` prints help only: start/run the NullCode/OpenCode server on that machine and generate a pairing link there, then paste/scan it into the NullCode app.
