# VSCode

!!! warning
    Section needs revision

## VSCode cheats for livecoding

- [Shortcuts master list](https://kapeli.com/cheat_sheets/Visual_Studio_Code.docset/Contents/Resources/Documents/index)
- [Built-in Snippets](https://code.visualstudio.com/docs/editor/userdefinedsnippets)

My usual shortcuts: 

- `Alt+D` => Delete all right // delete line without removing line
- `CMD+E` => Extempore Eval
- `ALT+CMD+E` => Extempore Connect current Buffer
- `CMD+]` => Indent Line
- `CMD+[` => Outdent Line
- `CMD+rightArrow` => End of line
- `CMD+leftArrow` => Start of line
- ``CMD+L`` => Select Line
- `CMD+D` => Duplicate Line
- `ALT+D` => Delete all right // delete line without removing line
- `CMD+shift+D` => delete line
- `CMD+K 1-2-3-4` => Wrap selection With letbeat / onbeat / dotimes / println 
- `OPT+CMD+K` => Format selection
- `SHIFT+CMD+K` => Show snippets

Preferences > Open Keyword Shortcuts

![alt](../assets/images/2024-06-26-VsCode-Open-Keyboard-Shortcuts.png)



Example key mappings eg In `keybindings.json`

```json
    {
        "key": "cmd+e",
        "command": "extension.xtmeval",
        "when": "editorTextFocus"
    },
    {
        "key": "alt+cmd+e",
        "command": "extension.xtmconnect",
        "when": "editorTextFocus"
    },
    {
        "key": "cmd+k 1",
        "command": "editor.action.insertSnippet",
        "when": "editorTextFocus",
        "args": { "name": "wrap-letbeat" }
    },
    {
        "key": "cmd+k 2",
        "command": "editor.action.insertSnippet",
        "when": "editorTextFocus",
        "args": { "name": "wrap-onbeat" }
    },
    {
        "key": "cmd+k 3",
        "command": "editor.action.insertSnippet",
        "when": "editorTextFocus",
        "args": { "name": "wrap-dotimes" }
    },
    {
        "key": "cmd+k 4",
        "command": "editor.action.insertSnippet",
        "when": "editorTextFocus",
        "args": { "name": "wrap-println" }
    }
```
    


## VSCode settings 

- [Workspace settings](https://code.visualstudio.com/docs/getstarted/settings#_workspace-settings)
- [Customising Intellisense](https://code.visualstudio.com/docs/editor/intellisense#_customizing-intellisense)

2023-11-26: try removing auto snippets suggestions. Only worked by passing a `[extempore]` directive: 

```json
"[extempore]": {
    "editor.wordBasedSuggestions": false,
    "editor.quickSuggestions": {
        "other": false,
        "comments": false,
        "strings": false
        }
    },
```
=> See settings.json


VSCODE opts

```json
"extempore.sharedir": "/Applications/-Other-Apps/2-Music/_synthesys/extempore"
```






## VSCode Snippets 

Backup the built-in snippets 

```bash
[michele.pasin]@MiniBeast:~/.vscode/extensions/extemporelang.vscode-extempore-0.2.8/snippets>mv extempore.json extempore.json.bk
```