# source: https://ipython.readthedocs.io/en/stable/config/intro.html#example-configuration-file
# source: https://ipython.org/ipython-doc/3/config/intro.html
c = get_config()

c.TerminalIPythonApp.display_banner = True
c.InteractiveShellApp.log_level = 20
# c.InteractiveShellApp.extensions = [
#     'myextension'
# ]
c.InteractiveShellApp.exec_lines = ["import numpy as np", "import pandas as pd"]
# c.InteractiveShellApp.exec_files = [
#     'mycode.py',
#     'fancy.ipy'
# ]
c.InteractiveShell.autoindent = True
c.InteractiveShell.colors = "linux"
c.InteractiveShell.confirm_exit = False
c.InteractiveShell.editor = "nvim"
c.InteractiveShell.xmode = "Context"

c.PrefilterManager.multi_line_specials = True

c.AliasManager.user_aliases = [("la", "ls -al")]
