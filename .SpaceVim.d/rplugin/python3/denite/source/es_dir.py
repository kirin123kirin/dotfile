# ============================================================================
# FILE: directory_rec.py
# AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
#         okamos <himinato.k at gmail.com>
# License: MIT license
# ============================================================================

from .file_rec import Source as Rec


class Source(Rec):

    def __init__(self, vim):
        super().__init__(vim)

        self.name = 'es_dir'
        self.kind = 'directory'

    def on_init(self, context):
        self.vars['command'] = ['es', '/ad']
        super().on_init(context)
