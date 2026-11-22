<div align="center">

# 🛡️ Remove-Sound-Miner-Windows

### Ferramenta em Batch para remoção completa do minerador **C:\Sound**

[![Windows](https://img.shields.io/badge/Windows-10%20%7C%2011-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://www.microsoft.com/windows)
[![Batch](https://img.shields.io/badge/Batch-.bat-4D4D4D?style=for-the-badge&logo=windows-terminal&logoColor=white)](#)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/cristianogodoi1986/Remove-Sound-Miner-Windows?style=for-the-badge)](https://github.com/cristianogodoi1986/Remove-Sound-Miner-Windows)

</div>

---

## 📌 O que este script faz?

Este script automatiza a **remoção do minerador** que costuma se instalar na pasta `C:\Sound` no Windows 10 e 11.

Ele executa, em sequência:

| Etapa | Ação |
|-------|------|
| **1** | Encerra processos maliciosos (`gtservices.exe`, `mouse.exe`, scripts VBS/JS) |
| **2** | Para e remove serviços de drivers suspeitos (`WinIo64`, `WinRing0_1_2_0`) |
| **3** | Apaga atalhos maliciosos da pasta de Inicialização do usuário |
| **4** | Remove a pasta `C:\Sound` (atributos ocultos/sistema + exclusão forçada) |
| **5** | Lista possíveis tarefas agendadas relacionadas ao minerador |

---

## ▶️ Como usar

1. Baixe o arquivo **[Remove-Sound-Miner.bat](Remove-Sound-Miner.bat)**
2. Clique com o botão direito no arquivo
3. Escolha **Executar como administrador**
4. Aguarde a execução (poucos segundos)
5. **Reinicie o computador**

> ⚠️ **Importante:** o script só funciona corretamente se for executado como Administrador.

---

## 🔄 Se a pasta C:\Sound não sumir

Alguns drivers do minerador podem ficar “presos” no kernel. Nesse caso:

1. Reinicie o Windows no **Modo de Segurança**
2. Execute o script novamente como Administrador
3. Reinicie normalmente

---

## 📁 Arquivos do repositório

```text
Remove-Sound-Miner-Windows/
├── Remove-Sound-Miner.bat   ← script principal
├── README.md               ← este arquivo
└── LICENSE                 ← MIT
```

---

## ⚠️ Aviso de segurança

- Este script **não instala** nada. Ele apenas encerra processos, remove serviços e apaga arquivos/pastas conhecidos do minerador.
- Use apenas em máquinas que você administra.
- Após a limpeza, recomendo rodar uma verificação completa com o **Windows Defender** ou outro antivírus confiável.

---

## 🛠️ Tecnologias

- Batch Script (`.bat`)
- Comandos nativos do Windows: `taskkill`, `sc`, `attrib`, `del`, `rmdir`, `schtasks`

---

## 👨‍💻 Autor

**Cristiano Godoi**  
Suporte técnico • Gestão de Incidentes • Automação Windows

[![GitHub](https://img.shields.io/badge/GitHub-cristianogodoi1986-181717?style=flat&logo=github)](https://github.com/cristianogodoi1986)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Cristiano%20Godoi-0A66C2?style=flat&logo=linkedin)](https://www.linkedin.com/in/cristiano-godoi-franciscano-25508683/)

---

## ⭐ Se este projeto te ajudou

Deixe uma estrela no repositório — isso ajuda outras pessoas a encontrar a solução!

---

<div align="center">

**Remove-Sound-Miner-Windows** — limpeza rápida e direta do minerador C:\Sound

</div>
