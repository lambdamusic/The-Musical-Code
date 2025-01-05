---
author: Michele Pasin
title: "Markdown"
---

# Markdown Tips 


!!! warning
    Section needs revision

## VSCode Shortcuts

[VSCode](../extempore/vscode.md) is pretty handy for editing Markdown. Here are some tips:

- Press `⌃Space` (Trigger Suggest) while editing to see a list of suggested Markdown snippets
- Use `⇧⌘O` to quickly jump to a header in the current file.
- Use `⌘T` to search through headers across all Markdown files in the current workspace
- Path suggestions are automatically shown when you type / or can be manually invoked by using `⌃Space`.
- You can Drag and drop a file from VS Code's Explorer or from your operating system into a Markdown editor. Start by dragging a file from VS Code's Explorer over your Markdown code and then hold down Shift to start dropping it into the file. 
- Previews: To switch between views, press `⇧⌘V` in the editor. You can view the preview side-by-side (`⌘K V`) too

### See also 

* Official [vscode help](https://code.visualstudio.com/docs/languages/markdown)


## MKDocs material

[Material for mkdocs](https://squidfunk.github.io/mkdocs-material/) is a framework for rendering markdown based documentation. 

This website uses it for turning a collection of markdown notes into an HTML website. 

### Admonitions 

See the [Material admonitions](https://squidfunk.github.io/mkdocs-material/reference/admonitions/) documentation. E.g.: 

```markdown
!!! note "Phasellus posuere in sem ut cursus"

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.
```

```
??? note

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.
```

Supported types

```plaintext
abstract
info
tip
success
question
warning
failure
danger
bug
example
quote
```