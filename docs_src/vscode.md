# Markdown tips

- Press ⌃Space (Trigger Suggest) while editing to see a list of suggested Markdown snippets
- Use ⇧⌘O to quickly jump to a header in the current file.
- Use ⌘T to search through headers across all Markdown files in the current workspace
- Path suggestions are automatically shown when you type / or can be manually invoked by using ⌃Space.
- You can Drag and drop a file from VS Code's Explorer or from your operating system into a Markdown editor. Start by dragging a file from VS Code's Explorer over your Markdown code and then hold down Shift to start dropping it into the file. 
- Previews: To switch between views, press ⇧⌘V in the editor. You can view the preview side-by-side (⌘K V) too

From [vscode help](https://code.visualstudio.com/docs/languages/markdown)



# VSCode cheats for livecoding

- [Shortcuts master list](https://kapeli.com/cheat_sheets/Visual_Studio_Code.docset/Contents/Resources/Documents/index)
- [Built-in Snippets](https://code.visualstudio.com/docs/editor/userdefinedsnippets)

My shortcuts: 

- Alt+D => Delete all right // delete line without removing line
- CMD+E => Extempore Eval
- ALT+CMD+E => Extempore Connect current Buffer
- CMD+] => Indent Line
- CMD+[ => Outdent Line
- CMD+rightArrow => End of line
- CMD+leftArrow => Start of line
- CMD+L => Select Line
- CMD+D => Duplicate Line
- ALT+D => Delete all right // delete line without removing line
- Ctrl+D => Delete Line
- CMD+K 1-2-3-4 => Wrap selection With letbeat / onbeat / dotimes / println 
- SHIFT+CMD+K => Show snippets

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
    


# VSCode settings 

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






# VSCode Snippets 
---------------------------------
Backup the built-in snippets 

```bash
[michele.pasin]@MiniBeast:~/.vscode/extensions/extemporelang.vscode-extempore-0.2.8/snippets>mv extempore.json extempore.json.bk
```

