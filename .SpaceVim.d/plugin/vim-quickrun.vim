
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 50,
\       "outputter/buffer/split" : ":botright",
\       "outputter/buffer/close_on_empty" : 1
\   },
\   'markdown': {
\       'runner': 'shell',
\       'outputter': 'null',
\       'command': ':PrevimOpen',
\       'exec': '%c',
\    },
\	'html': {
\		'command' : g:default_browser,
\		'exec' : '%c %s',
\		'outputter': 'browser'
\	}
\}

