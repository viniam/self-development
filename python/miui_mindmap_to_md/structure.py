import re
import tempfile
import shutil

FILENAME = "structure3"

# Read the contents of the HTML file
with open(f"{FILENAME}.html", "r", encoding='utf-8') as f:
    html = f.read()

# Find all divs with contenteditable="false"
pattern = r'<div[^>]+?contenteditable="false"[^>]*?>.*?<\/div>'
divs = re.findall(pattern, html, re.DOTALL)

# Remove unnecessary whitespace and contenteditable attribute from the divs
for i in range(len(divs)):
    div = re.sub(r'\s+contenteditable="false"', '', divs[i])
    div = re.sub(r'\n\s*', ' ', div)
    divs[i] = div

# Create a dictionary to store the graph
graph = {}


def add_node(node_id, parent_id, text):
    # Create a function to add nodes to the graph
    if node_id not in graph:
        graph[node_id] = {'text': text, 'children': []}
    if parent_id is not None:
        if parent_id not in graph:
            graph[parent_id] = {'text': '', 'children': []}
        graph[parent_id]['children'].append(node_id)


def dfs(node_id, depth=0, is_root=False):
    # Depth-first search to traverse the tree and create bullet points
    node = graph[node_id]
    text = node['text']
    with open(temp_file, "a", encoding='utf-8') as f:
        if is_root:
            if node_id == graph['root']['children'][0]:
                f.write(f"# {text}\n\n")
            if node_id in graph['root']['children'][1:]:
                f.write(f"\n# {text}\n\n")
        elif text != '':
            indent = "  " * (depth - 2)
            f.write(f"{indent}- {text}\n")
    for child_id in node['children']:
        dfs(child_id, depth + 1, is_root=(node_id == 'root'))


# Create a temporary file to write to
temp_file = tempfile.NamedTemporaryFile(mode='w', delete=False).name

# Add nodes to the graph
for div in divs:
    node_id = re.search(r'id="(.*?)"', div)[1]
    parent_id = re.search(r'data-parent="(.*?)"', div)
    parent_id = parent_id[1] if parent_id else None
    text = re.sub(r'<[^>]*>', '', div)
    text = text.strip()
    add_node(node_id, parent_id, text)

# Traverse the graph with DFS and output the bullet points to the temporary file
dfs('root')

# [print(key, ':', value) for key, value in graph.items()]

# Replace the original file with the temporary file
shutil.move(temp_file, f"{FILENAME}.md")
