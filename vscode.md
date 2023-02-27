# Preparando o Visual Studio Code para React Native

## Instale as Extensões

* React Native Tools
* Babel JavaScript
* Flow Language Support
* ESLint
* Prettier – Code formatter
* Auto Close Tag/Auto Complete Tag/Auto Rename Tag
* Color Highlight
* Git Blame
* TO DO Highlight
* Bracket Pair Colorizer
* markdownlint
* Search node_modules
* npm Intellisense
* Code Spell Checker
* change-case
* Brazilian Portuguese - Code Spell Checker

* <https://www.developers-zone.com/best-way-to-create-react-native-app-in-visual-studio-code/#:~:text=At%20the%20very%20first%20before,able%20to%20debug%20your%20code.>

## Configure o idioma para português (opcional)

* Instale a extensão Brazilian Portuguese Language Pack
* Nas configurações (Arquivo - Configurações) ou (File - Settings) procure por cSpell.language e coloque "en,PT_BR"

[Referência](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker-portuguese-brazilian)

## Crie o atalho para iniciar o emulador a partir do VsCode

* Acesse o menu TERMINAL -> Configurar Tarefas
* Crie uma nova tarefa e configure o comando conforme mostrado abaixo:

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Emulador Android",
            "type": "shell",
            "command": "/opt/android_sdk/emulator/emulator -avd android_react"
        }
    ]
}
```
