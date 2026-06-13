<p align="center">
  <a href="https://smoo.ai"><img src="https://smoo.ai/images/logo/logo.svg" alt="Smoo AI" width="220" /></a>
</p>

<h1 align="center">homebrew-tools</h1>

<p align="center">
  <strong>The <a href="https://brew.sh">Homebrew</a> tap for Smoo AI's open-source desktop tools.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Smoo_AI-platform-00A6A6?style=flat-square" alt="Smoo AI">
  <img src="https://img.shields.io/badge/license-MIT-F49F0A?style=flat-square" alt="license">
  <img src="https://img.shields.io/badge/Homebrew-tap-FF6B6C?style=flat-square" alt="Homebrew tap">
</p>

<p align="center">
  <a href="#-install">Install</a> ·
  <a href="#-available-formulas">Formulas</a> ·
  <a href="#-available-casks">Casks</a> ·
  <a href="#-part-of-smoo-ai">Platform</a>
</p>

---

> The Homebrew tap for [Smoo AI](https://smoo.ai) open-source desktop tools. Tap it once, then `brew install` any Smoo AI CLI or desktop app. Browse all of our open-source work at [smoo.ai/open-source](https://smoo.ai/open-source).

## 📦 Install

```bash
brew tap SmooAI/tools
```

## 🍺 Available formulas

### `th` — the Smoo AI CLI

Single Rust binary that drives the whole Smoo AI platform from your terminal: agent orchestration, pearls (work tracking), Jira sync, `api.smoo.ai` (orgs / agents / knowledge / config / jobs / members / observability), `admin.smoo.ai` superadmin verbs, `auth.smoo.ai` OAuth login, sandbox / operator management, the coding TUI, worktrees, audit, and more.

```bash
brew install SmooAI/tools/th

# verify
th --version
th --help
```

Then `th up` to bring the local platform up, `th code` to launch the coding TUI, or `th api whoami` to verify your Smoo platform login. Full docs at [github.com/SmooAI/smooth](https://github.com/SmooAI/smooth).

Available on macOS (Apple Silicon) and Linux (x86_64 + arm64). Windows support is in flight — pearl `th-a165b4` tracks the Cargo feature gating needed for `th` to build without the microsandbox / TUI subtree.

## 🖥️ Available casks

### Smooblue

Native, multi-column [Bluesky](https://bsky.app) desktop client. Written in Rust + Dioxus, backed by Bluesky's official OAuth flow.

```bash
brew install --cask smooblue
```

Source + issues: [github.com/SmooAI/smooblue](https://github.com/SmooAI/smooblue).

## 🔄 How updates land here

Each `vX.Y.Z` tag on an upstream Smoo AI repo triggers a workflow that bumps the corresponding formula or cask file in this tap with the new `version` + `sha256`. So `brew upgrade th` and `brew upgrade --cask smooblue` always pull the latest published release without us hand-editing this repo.

## 🧩 Part of Smoo AI

This tap is part of the [Smoo AI](https://smoo.ai) platform — an AI-powered business platform with AI built into every product. It distributes desktop tools like [`th`](https://github.com/SmooAI/smooth) (the Smoo AI CLI) and [`smooblue`](https://github.com/SmooAI/smooblue) (the Bluesky client).

## 📇 Contact

Brent Rager

- [Email](mailto:brent@smoo.ai)
- [LinkedIn](https://www.linkedin.com/in/brentrager/)
- [Bluesky](https://bsky.app/profile/brentragertech.bsky.social)

Smoo AI on GitHub: [github.com/SmooAI](https://github.com/SmooAI)

## 📄 License

MIT © [Smoo AI](https://smoo.ai)

---

<p align="center">
  Built by <a href="https://smoo.ai"><strong>Smoo AI</strong></a> — AI built into every product.
</p>
