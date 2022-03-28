# repostyle
A set of tools to ensure code quality

# Contents
- `hooks` - Git hooks (managed by [`pre-commit`](https://github.com/pre-commit/pre-commit))
- `setup.sh` - Bash script to perform all necessary configuration automatically

# Plugins
- Black (formats)
- Flake8

# Notes
- Doesn't replace `'` with `"`
- Line length is limited by 79 symbols (for `Black`)