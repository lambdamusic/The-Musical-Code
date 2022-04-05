

dir = "/Users/michele.pasin/Dropbox/code/python/mkdocs-test/livecoding.m.org/mkdocs/docs/blog/"

import os

def list_files(startpath):
    for root, dirs, files in os.walk(startpath):
        level = root.replace(startpath, '').count(os.sep)
        indent = ' ' * 4 * (level)
        print('{}{}/'.format(indent, os.path.basename(root)))
        subindent = ' ' * 4 * (level + 1)
        for f in files:
            print('{}{}'.format(subindent, f))
            if f.endswith('.md'):
                update_header(root, f)


def update_header(root, f):
    """Update the header section of the markdown file. 
    Specifically:
    * insert template: blog.html
    * Add author 
    * Add description TBC
    * Modify date, ensure it's NEVER in quotes

    Eg of wrong/incomplete data to be changed:

    ```
    ---
    template: blog.html
    title: "Livecoding composition: 'Piano Scales' (Extempore + Ableton Live)"
    author: <your name>
    description: "A new livecoding composition using Extempore and Ableton Live: 'Piano Scales'."
    date: "2020-11-02"
    categories: 
    - "computermusic"
    tags: 
    - "algorithmiccomposition"
    - "extempore"
    review: false
    ---
    ```


    """
    
    with open(root+"/"+f) as thefile:
        # file_str = thefile.read()
        file_str = thefile.readlines()
        new_file_str = []
        started, done = False, False
        for line in file_str:
            print(line)
            if line.strip() == "---":
                if not started:
                    started = True
                    new_file_str.append(line)
                    new_file_str = insert_beginning(new_file_str)
                else:
                    new_file_str.append(line)
            elif line.startswith("date: "):
                print("**date**", line)
                newline = fix_date(line)
                new_file_str.append(newline)
                print("**newdate**", newline)
            else:
                new_file_str.append(line)
        
    # do stuff with file_str

    # for item in new_file_str:
    #     print("line: ", item.replace("\n", ""))

    if True:
        with open(root+"/"+f, "w") as thefile:
            for item in new_file_str:
                thefile.write(item.replace("\n", "") + "\n") # remove preexisting newline, and add at the end


def fix_date(date_line):
    return date_line.replace("\"", "")

def insert_beginning(new_file_str_list):
    new_file_str_list.append("template: blog.html")
    new_file_str_list.append("author: Michele Pasin")
    return new_file_str_list


list_files(dir)