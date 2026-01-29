# WMT — Windows Maintenance Tool

Ferramenta simples em PowerShell para manutenção e limpeza básica do Windows, focada em manter o sistema limpo, organizado e com melhor desempenho no dia a dia.

Projeto criado para automatizar tarefas recorrentes como limpeza de arquivos temporários, lixeira e organização da pasta Downloads.

---

## 🚀 Funcionalidades

- Limpeza de arquivos temporários do sistema
- Esvaziamento da lixeira
- Organização da pasta Downloads (arquivos antigos)
- Execução modular (scripts separados)
- Geração automática de log
- Compatível com Windows PowerShell 5.1+

---

## 🛡️ Observações

- Scripts utilizam apenas comandos nativos do Windows
- Projeto utiliza apenas caracteres ASCII (compatível com ambientes corporativos)
- Recomenda-se testar os scripts antes de uso em produção

---

## 📌 Possíveis melhorias futuras
- Barra de progresso
- Agendamento automático
- Empacotamento em .exe


O comportamento do script pode ser controlado no arquivo `config.ps1` através da variável `$DRY_RUN`, onde `true` executa apenas simulações (sem remover arquivos) e `false` realiza a limpeza efetiva.