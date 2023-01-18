# source: https://ipython.readthedocs.io/en/stable/config/intro.html#example-configuration-file
c.TerminalIPythonApp.display_banner = True
c.InteractiveShellApp.log_level = 20
# c.InteractiveShellApp.extensions = [
#     'myextension'
# ]
c.InteractiveShellApp.exec_lines = [
    'import numpy as np', 
    'import pandas as pd' 
]
c.InteractiveShell.colors = 'LightBG'
c.InteractiveShell.xmode = 'Context'
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.editor = 'nvim'

c.PrefilterManager.multi_line_specials = True

c.AliasManager.user_aliases = [
 ('ll', 'ls -al')
]
