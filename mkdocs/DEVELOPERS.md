
# Musical Code MKDOCS - Infos for Developers

This project contains the source files used to build the public Musical Code website.


## Workflow

The site is build using [mkdocs](https://www.mkdocs.org/). 

New content is added to the source folder `/mkdocs/src` and rendered as HTML in `/docs`

### Environment setup

For testing and building, you'll need several things installed:
```sh
python3 -m venv env
source env/bin/activate
# install mkdocs and the required themes/plugins:
pip3 install -r requirements.txt
```

### Development

Test it in local
* `./tools/run-server.sh`
* Access via browser at `http://127.0.0.1:8001`

Build the docs and push to github to see how it renders
* `./tools/run-build.sh`
* Push to GitHub & visit https://github.com/lambdamusic/The-Musical-Code


## USEFUL LINKS

* [mkdocs](https://www.mkdocs.org/) - main homepage
* [material theme](https://squidfunk.github.io/mkdocs-material/getting-started/) - pretty nice theme
* [awesome pages plugin](https://github.com/lukasgeiter/mkdocs-awesome-pages-plugin#combine-custom-navigation--file-structure) - automated navigation
* [admonition extension](https://python-markdown.github.io/extensions/admonition/) - you've been warned!
