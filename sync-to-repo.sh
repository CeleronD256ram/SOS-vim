#!/usr/bin/env bash
# sync-to-repo.sh
#
# Overwrites this repository's content with the LazyVim configuration
# currently installed at ~/.config/nvim on your local machine.
#
# Usage (run from the root of the cloned SOS-vim repository):
#   bash sync-to-repo.sh
#
# After the script finishes, review the changes with:
#   git diff --stat
# and then commit and push:
#   git add -A
#   git commit -m "chore: sync lazyvim config from ~/.config/nvim"
#   git push

set -euo pipefail

NVIM_CONFIG="${HOME}/.config/nvim"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── sanity checks ────────────────────────────────────────────────────────────
if [ ! -d "${NVIM_CONFIG}" ]; then
  echo "Error: ${NVIM_CONFIG} does not exist." >&2
  exit 1
fi

if [ ! -d "${REPO_DIR}/.git" ]; then
  echo "Error: ${REPO_DIR} is not a git repository." >&2
  exit 1
fi

# ── preserve files that belong to the repo, not to the nvim config ───────────
PRESERVE=(".git" ".gitignore" "LICENSE" "README.md" "sync-to-repo.sh")

echo "Cleaning repository (keeping git-specific and meta files)..."
# Build the -not ( -name A -o -name B ... ) expression dynamically from PRESERVE.
find_args=("${REPO_DIR}" -mindepth 1 -maxdepth 1 -not \()
for i in "${!PRESERVE[@]}"; do
  [ "${i}" -gt 0 ] && find_args+=(-o)
  find_args+=(-name "${PRESERVE[${i}]}")
done
find_args+=(\))
while IFS= read -r -d '' item; do
  rm -rf "${item}"
  echo "  removed: $(basename "${item}")"
done < <(find "${find_args[@]}" -print0)

# ── copy the local LazyVim config into the repo ───────────────────────────────
echo ""
echo "Copying ${NVIM_CONFIG}/ → ${REPO_DIR}/ ..."
rsync -a --exclude='.git' "${NVIM_CONFIG}/" "${REPO_DIR}/"

echo ""
echo "Done. Summary of changes:"
git -C "${REPO_DIR}" --no-pager diff --stat || true
git -C "${REPO_DIR}" --no-pager status --short || true

echo ""
echo "Next steps:"
echo "  1. Review the changes above."
echo "  2. git add -A"
echo "  3. git commit -m 'chore: sync lazyvim config from ~/.config/nvim'"
echo "  4. git push"
