# SOS-vim

Neovim survival kit.
## About

A neovim on steroids, ready to use. This repository is based on the configuration used in the *Arch Linux* ([Omarchy](https://github.com/basecamp/omarchy))


### Requirements

- Neovim > 0.11 ([see how to install it here.](https://github.com/neovim/neovim/blob/master/INSTALL.md))
- `git` instalado

### Install

1. **Clone this repository**

   open the terminal and run:

   ```bash
   git clone https://github.com/CeleronD256ram/SOS-vim.git
   ```

2. **Copy/Move the files to the Neovim configuration folder.**

   ```bash
   mkdir -p ~/.config/nvim
   cp -r SOS-vim/* ~/.config/nvim/
   ```

   > *If* a configuration already exists, you can back it up first:
   ```bash
   mv ~/.config/nvim ~/.config/nvim-backup
   ```

3. **open neovim:**

   ```bash
   nvim
   ```

---


After opening Neovim, the package manager **[lazyvim](https://www.lazyvim.org/)** It will install the packages automatically =)

---

## Atualizando o repositório com sua config local (Arch Linux / LazyVim)

> **Cenário:** você já usa o LazyVim em `~/.config/nvim` e quer sobrescrever tudo neste repositório com essa configuração.

### Passo a passo manual

1. **Clone o repositório** (se ainda não clonou):

   ```bash
   git clone https://github.com/CeleronD256ram/SOS-vim.git
   cd SOS-vim
   ```

2. **Remova os arquivos antigos** (mantendo apenas os arquivos do git e metadados do projeto):

   ```bash
   # Apaga tudo exceto .git, .gitignore, LICENSE, README.md e sync-to-repo.sh
   find . -mindepth 1 -maxdepth 1 \
     -not \( \
       -name '.git' -o \
       -name '.gitignore' -o \
       -name 'LICENSE' -o \
       -name 'README.md' -o \
       -name 'sync-to-repo.sh' \
     \) \
     -exec rm -rf {} +
   ```

3. **Copie sua config atual para dentro do repositório:**

   ```bash
   rsync -a --exclude='.git' ~/.config/nvim/ .
   ```

4. **Revise o que mudou:**

   ```bash
   git diff --stat
   git status
   ```

5. **Commit e push:**

   ```bash
   git add -A
   git commit -m "chore: sync lazyvim config from ~/.config/nvim"
   git push
   ```

---

### Usando o script automático

O arquivo `sync-to-repo.sh` faz todos os passos acima de uma vez.

1. Certifique-se de estar dentro da pasta do repositório clonado:

   ```bash
   cd SOS-vim
   ```

2. Execute o script:

   ```bash
   bash sync-to-repo.sh
   ```

3. Confira o resumo exibido, e então faça o commit e push:

   ```bash
   git add -A
   git commit -m "chore: sync lazyvim config from ~/.config/nvim"
   git push
   ```

---

