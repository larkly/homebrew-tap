# Larkly Homebrew Tap

Custom Homebrew tap for [lazystack](https://github.com/larkly/lazystack) and other Larkly projects.

## Available Formulae

| Formula | Description |
|--------|-------------|
| [lazystack](https://github.com/larkly/lazystack) | Fast, keyboard-driven TUI for managing OpenStack resources |

## Installation

```bash
brew install larkly/tap/lazystack
```

Using the fully-qualified name taps this repository and trusts the formula in one step.

### "Refusing to load formula ... from untrusted tap"

Current Homebrew releases only load formulae from third-party taps you have
explicitly trusted. If `brew install lazystack`, `brew upgrade lazystack` or
`brew info lazystack` fails with this error (typically on an install that
predates tap trust, or after a plain `brew tap larkly/tap`), trust the tap once:

```bash
brew trust larkly/tap
```
## Updating

Formulae are automatically updated via CI when new releases are published.

## License

See the [lazystack](https://github.com/larkly/lazystack) repository for license information.
