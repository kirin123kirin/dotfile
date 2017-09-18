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
            \    'html': {
            \        'command' : g:_cmd,
            \        'exec' : '%c %s',
            \        'outputter': 'null'
            \    },
            \    'blockdiag': {
            \        'runner': 'shell', 'command' : 'blockdiag.bat', 'exec' : '%C %S',
            \    },
            \    'seqdiag': {
            \        'runner': 'shell', 'command' : 'seqdiag.bat', 'exec' : '%C %S',
            \    },
            \    'actdiag': {
            \        'runner': 'shell', 'command' : 'actdiag.bat', 'exec' : '%C %S',
            \    },
            \    'nwdiag': {
            \        'runner': 'shell', 'command' : 'nwdiag.bat', 'exec' : '%C %S',
            \    },
            \    'rackdiag': {
            \        'runner': 'shell', 'command' : 'rackdiag.bat', 'exec' : '%C %S',
            \    },
            \    'packetdiag': {
            \        'runner': 'shell', 'command' : 'packetdiag.bat', 'exec' : '%C %S',
            \    },
            \}

let g:quickrun_config["xhtml"] = g:quickrun_config["html"]
let g:quickrun_config["diag"] = g:quickrun_config["blockdiag"]
