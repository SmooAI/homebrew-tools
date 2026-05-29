<a name="readme-top"></a>

<div align="center">
  <a href="https://smoo.ai">
    <img src="https://raw.githubusercontent.com/SmooAI/smooblue/main/assets/icons/icon-256.png" alt="SmooAI" width="160" />
  </a>
</div>

# homebrew-tools

[Homebrew](https://brew.sh) tap for [SmooAI](https://smoo.ai) open-source desktop tools.

## About SmooAI

SmooAI is an AI-powered platform for helping businesses multiply their customer, employee, and developer experience. Learn more at [smoo.ai](https://smoo.ai) and browse all of our open-source work at [smoo.ai/open-source](https://smoo.ai/open-source).

## Install

```bash
brew tap SmooAI/tools
```

## Available formulas

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

## Available casks

### Smooblue

Native, multi-column [Bluesky](https://bsky.app) desktop client. Written in Rust + Dioxus, backed by Bluesky's official OAuth flow.

```bash
brew install --cask smooblue
```

Source + issues: [github.com/SmooAI/smooblue](https://github.com/SmooAI/smooblue).

## How updates land here

Each `vX.Y.Z` tag on an upstream SmooAI repo triggers a workflow that bumps the corresponding formula or cask file in this tap with the new `version` + `sha256`. So `brew upgrade th` and `brew upgrade --cask smooblue` will always pull the latest published release without us hand-editing this repo.

## Contact

Brent Rager

- [Email](mailto:brent@smoo.ai)
- [LinkedIn](https://www.linkedin.com/in/brentrager/)
- [Bluesky](https://bsky.app/profile/brentragertech.bsky.social)

SmooAI on GitHub: [github.com/SmooAI](https://github.com/SmooAI)

## License

MIT © [Smoo AI](https://smoo.ai)
