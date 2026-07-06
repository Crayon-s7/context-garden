#!/usr/bin/env bash
# ============================================================================
#  Context Garden 一键安装脚本
#  用法: curl -fsSL https://raw.githubusercontent.com/Crayon-s7/context-garden/main/scripts/install.sh | bash
# ============================================================================
set -euo pipefail

# 默认安装路径
INSTALL_DIR="${1:-$HOME/context-garden}"
REPO_URL="git@github.com:Crayon-s7/context-garden.git"
REPO_URL_HTTPS="https://github.com/Crayon-s7/context-garden.git"

# 颜色
GREEN='\033[32m'
CYAN='\033[36m'
YELLOW='\033[33m'
BOLD='\033[1m'
RESET='\033[0m'

info()  { printf "${CYAN}ℹ${RESET}  %s\n" "$*"; }
ok()    { printf "${GREEN}✓${RESET}  %s\n" "$*"; }
warn()  { printf "${YELLOW}⚠${RESET}  %s\n" "$*"; }

echo ""
echo "  Context Garden — 一键安装"
echo "  安装路径: $INSTALL_DIR"
echo ""

# ── 1. 检查 git ─────────────────────────────────────────────
if ! command -v git &>/dev/null; then
  echo "✗  需要 git，请先安装: apt install git / brew install git"
  exit 1
fi

# ── 2. 克隆仓库 ─────────────────────────────────────────────
if [[ -d "$INSTALL_DIR/.git" ]]; then
  info "目录已存在，拉取最新更新..."
  cd "$INSTALL_DIR"
  git pull --rebase origin main 2>/dev/null || git pull origin main 2>/dev/null || true
else
  info "克隆仓库到 $INSTALL_DIR ..."
  
  # 优先尝试 SSH，失败则用 HTTPS
  if git clone "$REPO_URL" "$INSTALL_DIR" 2>/dev/null; then
    :
  else
    warn "SSH 克隆失败，使用 HTTPS..."
    git clone "$REPO_URL_HTTPS" "$INSTALL_DIR"
  fi
fi

# ── 3. 设置执行权限 ─────────────────────────────────────────
chmod +x "$INSTALL_DIR/bin/cg"

# ── 4. 添加到 PATH ──────────────────────────────────────────
SHELL_NAME="$(basename "$SHELL")"
RC_FILE="$HOME/.bashrc"
[[ "$SHELL_NAME" == "zsh" ]] && RC_FILE="$HOME/.zshrc"

PATH_LINE="export PATH=\"\$PATH:$INSTALL_DIR/bin\""

if grep -qF "$PATH_LINE" "$RC_FILE" 2>/dev/null; then
  ok "PATH 已配置（$RC_FILE）"
else
  echo "" >> "$RC_FILE"
  echo "# Context Garden" >> "$RC_FILE"
  echo "$PATH_LINE" >> "$RC_FILE"
  ok "已添加到 PATH（$RC_FILE）"
fi

# ── 5. 完成 ─────────────────────────────────────────────────
echo ""
echo "  ┌─────────────────────────────────────────────┐"
echo "  │                                             │"
echo "  │  Context Garden 安装完成！                   │"
echo "  │                                             │"
echo "  │  路径: $INSTALL_DIR"
echo "  │                                             │"
echo "  │  下一步："
echo "  │    source $RC_FILE"
echo "  │    cg help                                  │"
echo "  │    cg skills                                │"
echo "  │                                             │"
echo "  └─────────────────────────────────────────────┘"
echo ""
