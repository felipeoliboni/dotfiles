# 🌌 Noctalia Dotfiles

Um setup minimalista, estético e funcional baseado no **Hyprland**, rodando sobre o **CachyOS**. Este ambiente foi construído focando em produtividade e uma identidade visual coesa (Noctalia).

![Banner](https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/banners/dotfiles.webp) *(Sugestão: Adicione um screenshot real aqui)*

## 🛠️ Stack Tecnológica

*   **OS:** [CachyOS](https://cachyos.org/) (Arch-based)
*   **WM:** [Hyprland](https://hyprland.org/)
*   **Shell:** [Fish Shell](https://fishshell.com/) (com configurações do CachyOS)
*   **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/) / [Alacritty](https://alacritty.org/)
*   **Barra/UI:** Noctalia Shell (baseado em Quickshell/dms)
*   **Editor:** [Micro](https://micro-editor.github.io/) (Catppuccin Macchiato)
*   **Navegador:** Firefox
*   **File Manager:** Nautilus

## 🎨 Tema: Noctalia

O setup utiliza o tema **Noctalia**, uma paleta de cores escura e sofisticada que se estende por todo o sistema, desde o terminal até as interfaces do sistema via `dms`.

## ⌨️ Atalhos Principais (Keybindings)

| Atalho | Ação |
| :--- | :--- |
| `Super` + `Enter` | Abrir Terminal (Kitty) |
| `Super` + `D` | Menu de Aplicativos (Launcher) |
| `Super` + `Q` | Fechar Janela Ativa |
| `Super` + `E` | Gerenciador de Arquivos (Nautilus) |
| `Super` + `B` | Navegador (Firefox) |
| `Super` + `S` | Spotify Player |
| `Super` + `F` | Modo Tela Cheia |
| `Super` + `V` | Histórico do Clipboard |
| `Super` + `X` | Menu de Energia (Power Menu) |
| `Print` | Screenshot (Seleção de Região) |
| `Super` + `1-9` | Alternar entre Workspaces |

## 🚀 Como instalar

> **Aviso:** Estes dotfiles são pessoais. Recomendo analisar os arquivos antes de aplicar no seu sistema.

### Pré-requisitos
Certifique-se de ter os pacotes necessários instalados:
```bash
sudo pacman -S hyprland kitty fish nautilus micro firefox polkit-gnome hyprshot
```

### Instalação Manual
1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/dotfiles.git ~/dotfiles
   ```
2. Copie as configurações:
   ```bash
   cp -r ~/dotfiles/.config/* ~/.config/
   ```

## 📐 Configuração de Monitores
O setup está configurado para dois monitores:
- **HDMI-A-1:** Principal (1920x1080 @ 100Hz)
- **DVI-D-1:** Secundário (1920x1080 @ 60Hz)

---
Feito com ☕ por [Felipe](https://github.com/seu-usuario).
