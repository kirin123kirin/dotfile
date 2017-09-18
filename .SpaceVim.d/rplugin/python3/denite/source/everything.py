# ============================================================================
# FILE: everything.py
# AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
# License: MIT license
# ============================================================================

from .base import Base
from denite.process import Process
from os import path, pardir
from os.path import relpath, isabs, isdir, join, normpath
from denite.util import parse_command, abspath

class Source(Base):

    def __init__(self, vim):
        super().__init__(vim)

        self.name = 'everything'
        self.kind = 'everything'
        self.vars = {
            'command': ['es', '/ad'],
            'min_cache_files': 1000,
        }
        self.__cache = {}

    def on_init(self, context):
        context['__proc'] = None
        directory = context['args'][0] if len(
            context['args']) > 0 else context['path']
        context['__directory'] = abspath(self.vim, directory)

    def on_close(self, context):
        if context['__proc']:
            context['__proc'].kill()
            context['__proc'] = None
        self.__cache.clear()

    def gather_candidates(self, context):
        if context['__proc']:
            return self.__async_gather_candidates(
                context, context['async_timeout'])

        context['__proc'] = Process(self.vars['command'], context, context['__directory'])
        context['__current_candidates'] = []
        return self.__async_gather_candidates(context, 0.5)

    def __async_gather_candidates(self, context, timeout):
        outs, errs = context['__proc'].communicate(timeout=timeout)
        if errs:
            self.error_message(errs)
            
        context['is_async'] = not context['__proc'].eof()
        
        if context['__proc'].eof():
            context['__proc'] = None
            
        if not outs:
            return []
        
        candidates = [{
                'word': x.replace('\\','/'),
                'action__path': x.replace('\\','/'),
                } for x in outs if x]
        
        context['__current_candidates'] += candidates
        if (len(context['__current_candidates']) >=
                self.vars['min_cache_files']):
            self.__cache[context['__directory']] = context[
                '__current_candidates']
                
        return candidates