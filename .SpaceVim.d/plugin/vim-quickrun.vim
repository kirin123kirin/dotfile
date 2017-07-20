
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 50,
\       "outputter/buffer/split" : ":botright",
\       "outputter/buffer/close_on_empty" : 1
\   },
\	'html': {
\		'command' : g:default_browser,
\		'exec' : '%c %s',
\		'outputter': 'browser'
\	}
\}

