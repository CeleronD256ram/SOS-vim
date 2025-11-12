# SOS-vim

Uma config pessoal para clonar e usar em qualquer computador.

## Sobre

Este repositório contém minha configuração pessoal do Neovim, feita em Lua, pronta para ser clonada e usada rapidamente em qualquer ambiente linux.



## Tutorial Básico de Instalação (Linux)

### Requisitos

- Neovim instalado ([veja como instalar aqui](https://github.com/neovim/neovim/blob/master/INSTALL.md))
- `git` instalado

### Passo a passo

1. **Clone este repositório**

   Abra o terminal e execute:

   ```bash
   git clone https://github.com/CeleronD256ram/SOS-vim.git
   ```

2. **Copie/Movimente os arquivos para a pasta de configuração do Neovim**

   ```bash
   mkdir -p ~/.config/nvim
   cp -r SOS-vim/* ~/.config/nvim/
   ```

   > Se já existir uma configuração, você pode fazer backup antes:

   ```bash
   mv ~/.config/nvim ~/.config/nvim-backup
   ```

3. ** Abra o neovim:**

   ```bash
   nvim
   ```

---

## Observações

Após abrir o neovim o gerenciador de pacotes **[lazyvim](https://www.lazyvim.org/)** vai instalar os pacotes automaticamente =)

---

