# Contributing to KDE Plasma 6 Installation Scripts

We welcome contributions to make these installation scripts better! Here's how you can help:

## How to Contribute

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run the tests
5. Submit a pull request

## Testing

Before submitting a PR, please:

1. Test script syntax:
```bash
bash -n scripts/install_plasma6.sh
```

2. Run requirements test:
```bash
./tests/test_requirements.sh
```

3. Verify documentation links:
```bash
for file in $(find . -name "*.md"); do
  grep -o '\[.*\]([^)]*)' "$file"
done
```

## Code Style

- Use shellcheck for shell scripts
- Follow Markdown best practices
- Keep documentation up to date

## Pull Request Process

1. Update documentation
2. Add tests if needed
3. Update CHANGELOG.md
4. Reference any related issues
