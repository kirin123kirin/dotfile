let g:_spacevim_mappings = {'+': ["call feedkeys(\":bnext\r\", \"m\")", '次のウィンドウ'],
      \ '-': ["call feedkeys(\":bprevious\r\", \"m\")", '前のウィンドウ'],
      \ '1': ["call feedkeys(\":call SpaceVim#layers#core#tabline#jump(1)\r\", \"m\")", 'タブ番号 1'],
      \ '2': ["call feedkeys(\":call SpaceVim#layers#core#tabline#jump(2)\r\", \"m\")", 'タブ番号 2'],
      \ '3': ["call feedkeys(\":call SpaceVim#layers#core#tabline#jump(3)\r\", \"m\")", 'タブ番号 3'],
      \ '4': ["call feedkeys(\":call SpaceVim#layers#core#tabline#jump(4)\r\", \"m\")", 'タブ番号 4'],
      \ '5': ["call feedkeys(\":call SpaceVim#layers#core#tabline#jump(5)\r\", \"m\")", 'タブ番号 5'],
      \ '6': ["call feedkeys(\":call SpaceVim#layers#core#tabline#jump(6)\r\", \"m\")", 'タブ番号 6'],
      \ '7': ["call feedkeys(\":call SpaceVim#layers#core#tabline#jump(7)\r\", \"m\")", 'タブ番号 7'],
      \ '8': ["call feedkeys(\":call SpaceVim#layers#core#tabline#jump(8)\r\", \"m\")", 'タブ番号 8'],
      \ '9': ["call feedkeys(\":call SpaceVim#layers#core#tabline#jump(9)\r\", \"m\")", 'タブ番号 9'],
      \ 'g':
      \ {'A': ['Gina add .', 'git add 全ファイル'],
      \  'a': ['Gina add %', 'git add 現在のバッファ'],
      \  'b': ['Gina blame', 'git blame'],
      \  'c': ['Gina commit', 'git commit'],
      \  'd': ['Gina diff', 'git diff'],
      \  'name': '+git function',
      \  'p': ['Gina push', 'git push'],
      \  's': ['Gina status', 'git status']},
      \ 'l':
      \ {'j': ["call feedkeys(\":lnext\r\", \"n\")", '次のロケーションリスト'],
      \  'k': ["call feedkeys(\":lprev\r\", \"n\")", '前のロケーションリスト'],
      \  'name': 'ロケーションリスト操作',
      \  'q': ["call feedkeys(\":lclose\r\", \"n\")", 'ロケーションリストを閉じる']},
      \ 'q':
      \ {'j': ["call feedkeys(\":cnext\r\", \"n\")", '次のQuickfixリスト'],
      \  'k': ["call feedkeys(\":cprev\r\", \"n\")", '前のQuickfixリスト'],
      \  'name': 'Quickfixリスト操作',
      \  'q': ["call feedkeys(\":cclose\r\", \"n\")", 'Quickfixリストを閉じる'],
      \  'r': ['call feedkeys("q", "n")', '記録モード']},
      \ 's':
      \ {'name': '新しいグループ',
      \  'v': ["call feedkeys(\":call SpaceVim#mapping#split_previous_buffer()\r\", \"n\")", '前のバッファを分割']},
      \ 't': {'name': 'Visualエディタ切替'},
      \ 'w': ["call feedkeys(\"\e:w\r\", \"n\")", '現在のファイルを保存']}

let g:_spacevim_mappings_space = {'!': ['Unite output/shellcmd -no-start-insert', 'コマンド実行'],
      \  "'": ['Deol', 'シェル'],
      \  '1': ['call SpaceVim#layers#core#statusline#jump(1)', '画面 1'],
      \  '2': ['call SpaceVim#layers#core#statusline#jump(2)', '画面 2'],
      \  '3': ['call SpaceVim#layers#core#statusline#jump(3)', '画面 3'],
      \  '4': ['call SpaceVim#layers#core#statusline#jump(4)', '画面 4'],
      \  '5': ['call SpaceVim#layers#core#statusline#jump(5)', '画面 5'],
      \  '6': ['call SpaceVim#layers#core#statusline#jump(6)', '画面 6'],
      \  '7': ['call SpaceVim#layers#core#statusline#jump(7)', '画面 7'],
      \  '8': ['call SpaceVim#layers#core#statusline#jump(8)', '画面 8'],
      \  '9': ['call SpaceVim#layers#core#statusline#jump(9)', '画面 9'],
      \  ';': ['call feedkeys("\<Plug>(caw:hatpos:toggle)")', 'コメントインアウト切替'],
      \  '<Tab>': ['try | b# | catch | endtry', '直前のバッファ'],
      \  '?': ['Denite menu:CustomKeyMaps -input=[SPC]', 'マッピング'],
      \  'B': {'name': '+Globalバッファ'},
      \  'T':
      \  {'F': ['call feedkeys("<F11>", "n")', 'フルスクリーン'],
      \   'f': ["call call(function('<SNR>54_toggle_win_fringe'), [])", 'ウィンドウ枠切替'],
      \   'm': ["call call(function('<SNR>54_toggle_menu_bar'), [])", 'メニューバー切替'],
      \   'n': ["call call(function('<SNR>93_cycle_spacevim_theme'), [])", 'テーマ切替ローテーション'],
      \   'name': '+ユーザインタフェースとテーマ',
      \   's': ['Unite -auto-preview colorscheme', 'カラースキーマ'],
      \   't': ["call call(function('<SNR>54_toggle_tool_bar'), [])", 'ツールバー切替'],
      \   '~': ["call call(function('<SNR>54_toggle_end_of_buffer'), [])", '何もないところは ~ と表示する']},
      \  'a':
      \  {'c': ['Calendar', 'カレンダー'],
      \   'name': '+アプリ',
      \   's': ['Startify | doautocmd WinEnter', 'ファンシーなスタート画面']},
      \  'b':
      \  {'.': ["call call(function('<SNR>67_buffer_transient_state'), [])", 'バッファ編集状況'],
      \   '<C-d>': ['call SpaceVim#mapping#clearBuffers()', '他のバッファ強制終了'],
      \   'D': ['call SpaceVim#mapping#kill_visible_buffer_choosewin()', 'このバッファ強制終了'],
      \   'N':
      \   {'h': ['topleft vertical new', '左側'],
      \    'j': ['rightbelow new', '下方向'],
      \    'k': ['new', '上方向'],
      \    'l': ['rightbelow vertical new', '右側'],
      \    'n': ['enew', 'デフォルト'],
      \    'name': '+新しいバッファを開く'},
      \   'P': ['normal! ggdG"+P', '全体に貼りつけ'],
      \   'R': ["call call(function('<SNR>67_safe_revert_buffer'), [])", 'バッファを元に戻す'],
      \   'Y': ['normal! ggVG"+y``', '全体をコピー'],
      \   'b': ['Denite buffer', 'バッファ一覧'],
      \   'd': ['call SpaceVim#mapping#close_current_buffer()', 'このバッファを閉じる'],
      \   'e': ["call call(function('<SNR>67_safe_erase_buffer'), [])", 'バッファの消去'],
      \   'f': ['Neoformat', 'オートフォーマット'],
      \   'h': ['Startify', 'ホーム画面'],
      \   'm': ["call call(function('<SNR>67_open_message_buffer'), [])", 'メッセージを開く'],
      \   'n':
      \   ['bnext',
      \    'next buffer',
      \    ['SPC b n is running :bnext, jump to next buffer',
      \     'which is a vim build in command',
      \     'It is bound to SPC b n, ] b,']],
      \   'name': '+バッファ操作',
      \   'p': ['bp', '前のバッファ'],
      \   'w': ['setl readonly!', '読み取り専用']},
      \  'c':
      \  {'L': ['call feedkeys("\<Plug>NERDCommenterInvert", "m")', '行に対して切替'],
      \   'P': ['call feedkeys("vip<Plug>NERDCommenterInvert", "m")', '段落に対して切替'],
      \   'T': ['call feedkeys("\<Plug>CommentToLineInvert", "m")', 'toggle comment until the line'],
      \   'l': ['call feedkeys("\<Plug>NERDCommenterComment", "m")', '行をコメントアウト'],
      \   'name': '+コメントインアウト操作',
      \   'p': ['call feedkeys("vip<Plug>NERDCommenterComment", "m")', '段落をコメントアウト'],
      \   't': ['call feedkeys("\<Plug>CommentToLine", "m")', '次の有効行までコメントイン']},
      \  'e':
      \  {'.': ["call call(function('<SNR>57_error_transient_state'), [])", 'エラー発生状況'],
      \   'N': ['lNext', '次のエラー'],
      \   'a': ['FencAutoDetect', '自動エンコード'],
      \   'c': ['sign unplace *', 'エラーを消去'],
      \   'h': ['', 'シンタックスチェッカー'],
      \   'l': ['lopen', 'エラーを表示'],
      \   'n': ['lnext', '次のエラー'],
      \   'name': '+エラー／エンコーディング',
      \   'p': ['lprevious', '前のエラー'],
      \   'v': ['', 'シンタックスチェッカーの設定']},
      \  'f':
      \  {'C':
      \   {'d': ['update | e ++ff=dos | w', 'CRLF'],
      \    'name': '+ファイルと形式変換',
      \    'u': ['update | e ++ff=dos | setlocal ff=unix | w', 'LF']},
      \   'D': ["call call(function('<SNR>67_delete_current_buffer_file'), [])", '現在のファイルを削除する'],
      \   'F': ['normal! gf', 'カーソル上のファイルパスを開く'],
      \   'S': ['wall', '全バッファの保存'],
      \   'T': ['VimFiler -no-toggle', 'エクスプローラを新しく開く'],
      \   'W': ['write !sudo tee % >/dev/null', 'rootで強制的に保存'],
      \   'b': ['Denite unite:bookmark -buffer-name=bookmark', 'ブックマークを開く'],
      \   'f': ["exe 'CtrlP ' . fnamemodify(bufname('%'), ':h')", 'CtrlP'],
      \   'name': '+ファイルの操作',
      \   'r': ['Denite file_mru', '最近開いたファイル一覧'],
      \   's': ['write', 'save buffer'],
      \   't': ['VimFiler', 'エクスプローラの表示/非表示切替'],
      \   'v':
      \   {'d': ['SPConfig', 'init.vimを開く'],
      \    'name': '+Vim(SpaceVim)',
      \    'v': ['let @+=g:spacevim_version | echo g:spacevim_version', 'バージョン表示']},
      \   'y': ['call zvim#util#CopyToClipboard()', '現在のファイル名をコピー']},
      \  'h':
      \  {'I': ['call SpaceVim#issue#report()', 'SpaceVimバグを報告'],
      \   '[SPC]': ['Denite help -input=SpaceVim', 'SpaceVimヘルプ'],
      \   'd':
      \   {'b': ['call SpaceVim#plugins#help#describe_bindings()', '説明からキーバインドを探す'],
      \    'k': ['call SpaceVim#plugins#help#describe_key()', 'キーバインドから意味を探す'],
      \    'name': '+ヘルプ説明'},
      \   'i': ['DeniteCursorWord help', 'カーソル上の単語でヘルプを探す'],
      \   'k': ['LeaderGuide "[KEYs]"', 'Leaderキーのヘルプ'],
      \   'l': ['SPLayer -l', 'SpaceVimで設定されているキーバインド'],
      \   'm': ['Unite manpage', 'マニュアルから探す'],
      \   'name': '+ヘルプ'},
      \  'i':
      \  {'U': {'U': ["call call(function('<SNR>49_uuidgen_U'), [])", 'uuidgen-4'], 'name': '+UUID'},
      \   'l':
      \   {'l': ["call call(function('<SNR>49_insert_lorem_ipsum_list'), [])", 'ダミーテキスト挿入'],
      \    'name': '+ダミーデータ生成',
      \    'p': ["call call(function('<SNR>49_insert_lorem_ipsum_paragraph'), [])", 'ダミー文章挿入'],
      \    's': ["call call(function('<SNR>49_insert_lorem_ipsum_sentence'), [])", 'ダミーセンテンス挿入']},
      \   'name': '+自動生成データ挿入',
      \   'p':
      \   {'1': ["call call(function('<SNR>49_insert_simple_password'), [])", 'シンプルパスワード挿入'],
      \    '2': ["call call(function('<SNR>49_insert_stronger_password'), [])", '複雑なパスワード挿入'],
      \    '3': ["call call(function('<SNR>49_insert_paranoid_password'), [])", '超複雑なパスワード挿入'],
      \    'n': ["call call(function('<SNR>49_insert_numerical_password'), [])", '数値だけパスワード挿入'],
      \    'name': '+パスワード',
      \    'p':
      \    ["call call(function('<SNR>49_insert_phonetically_password'), [])", '読み易い簡単なパスワード挿入']},
      \   's': ['Unite neosnippet', 'スニペット(neosnippet)を探して挿入'],
      \   'u': ['Unite unicode', 'ユニコードで探して挿入']},
      \  'j':
      \  {'$': ['call feedkeys("m`g_", "n")', 'マーク追加して行先頭にジャンプ'],
      \   '0': ['call feedkeys("m`^", "n")', 'マークを追加して行頭にジャンプ'],
      \   'D': ['VimFilerBufferDir -no-split', '現在バッファの場所をVimfilerで開く(全画面)'],
      \   'J': ['call feedkeys("\<Plug>(easymotion-s2)", "m")', 'EASYMOTION 2文字'],
      \   'S': ["call call(function('<SNR>67_split_string'), [1])", '分割して新しい行を挿入'],
      \   'b': ['call feedkeys("<C-o>", "n")', 'jump backward'],
      \   'd': ['VimFilerBufferDir', '現在バッファの場所をVimfilerで開く'],
      \   'f': ['call feedkeys("<C-i>", "n")', 'jump forward'],
      \   'i': ['Denite outline', 'アウトラインを検索してジャンプ'],
      \   'j': ['call feedkeys("\<Plug>(easymotion-prefix)s", "m")', 'EASYMOTION 1文字'],
      \   'k': ['call feedkeys("j==", "n")', '次行に移動してインデント'],
      \   'l': ['call feedkeys("\<Plug>(easymotion-bd-jk)", "m")', 'EASYMOTION 行指定'],
      \   'n': ["call feedkeys(\"i\r\e\", \"n\")", '行分割'],
      \   'name': '+ジャンプ/Join/Split',
      \   'o': ["call feedkeys(\"i\r\ek$\", \"n\")", '行結合'],
      \   'q': ['call feedkeys("\<Plug>(easymotion-bd-jk)", "m")', 'EASYMOTION 行指定'],
      \   's': ["call call(function('<SNR>67_split_string'), [0])", 'split sexp'],
      \   'u': ["call call(function('<SNR>67_jump_to_url'), [])", 'URLにジャンプ'],
      \   'v': ['call feedkeys("\<Plug>(easymotion-bd-jk)", "m")', 'EASYMOTION 行指定'],
      \   'w': ['call feedkeys("\<Plug>(easymotion-bd-w)", "m")', 'EASYMOTION 単語指定']},
      \  'l': {'name': '+言語特化'},
      \  'm': {'name': '+メジャーモード'},
      \  'p':
      \  {'/': ['Grepper', 'プロジェクト内であいまい検索'],
      \   'f': ['CtrlP', 'プロジェクト内のファイル名を検索'],
      \   'name': '+プロジェクト特化',
      \   't': ['Rooter', 'プロジェクトルートから検索']},
      \  'r': {'l': ['Unite resume', 'Unite再開'], 'name': '+レジスタ系'},
      \  's':
      \  {'B':
      \   ["execute 'Unite grep:$buffers::' . expand(\"<cword>\") . '  -start-insert'",
      \    'grep カーソル上単語 in 開いてるバッファ内'],
      \   'F': ["execute 'Unite grep:::' . expand(\"<cword>\") . '  -start-insert'", 'grep in 任意のディレクトリ'],
      \   'J':
      \   ['call SpaceVim#plugins#searcher#find(expand("<cword>"),SpaceVim#mapping#search#default_tool())',
      \    'バックグラウンド実行/検索 カーソル上単語 in プロジェクト内'],
      \   'P': ["execute 'Unite grep:.::' . expand(\"<cword>\") . '  -start-insert'", 'grep in プロジェクト内'],
      \   'S':
      \   ["execute 'Unite grep:%::' . expand(\"<cword>\") . '  -start-insert'", 'grep カーソル上単語 in 現在のバッファ'],
      \   'a':
      \   {'B': ['call SpaceVim#mapping#search#grep("a", "B")', 'カーソル単語でag検索 in 開いている全バッファ'],
      \    'F': ['call SpaceVim#mapping#search#grep("a", "F")', 'カーソル単語でag検索 in 任意のディレクトリ'],
      \    'J':
      \    ['call SpaceVim#plugins#searcher#find(expand("<cword>"), "ag")',
      \     'バックグラウンド実行/ag検索 カーソル上単語 in プロジェクト'],
      \    'P': ['call SpaceVim#mapping#search#grep("a", "P")', 'カーソル単語でag検索 in プロジェクト内'],
      \    'b': ['call SpaceVim#mapping#search#grep("a", "b")', 'ag検索 in 開いている全バッファ'],
      \    'f': ['call SpaceVim#mapping#search#grep("a", "f")', 'ag検索 in 任意のディレクトリ'],
      \    'j': ['call SpaceVim#plugins#searcher#find("", "ag")', 'バックグラウンド実行/カーソル単語でag検索 in プロジェクト内'],
      \    'name': '+ag',
      \    'p': ['call SpaceVim#mapping#search#grep("a", "p")', 'ag検索 in プロジェクト内']},
      \   'b': ['Unite grep:$buffers', 'grep in 開いている全バッファ'],
      \   'c': ['noh', '検索結果ハイライトをクリア'],
      \   'f': ['Unite grep', 'grep in 任意のディレクトリ'],
      \   'g':
      \   {'B': ['call SpaceVim#mapping#search#grep("g", "B")', 'grep カーソル単語で検索 in 開いている全バッファ'],
      \    'F': ['call SpaceVim#mapping#search#grep("g", "F")', 'grep カーソル単語で検索 in 任意のディレクトリ'],
      \    'G': ['call SpaceVim#plugins#flygrep#open()', 'grep on the fly'],
      \    'J':
      \    ['call SpaceVim#plugins#searcher#find(expand("<cword>"), "grep")',
      \     'バックグラウンド実行/grep カーソル上単語 in プロジェクト'],
      \    'P': ['call SpaceVim#mapping#search#grep("g", "P")', 'grep カーソル単語 in プロジェクト'],
      \    'b': ['call SpaceVim#mapping#search#grep("g", "b")', 'grep in 開いている全バッファ'],
      \    'f': ['call SpaceVim#mapping#search#grep("g", "f")', 'grep in 任意のディレクトリ'],
      \    'j':
      \    ['call SpaceVim#plugins#searcher#find("", "grep")', 'バックグラウンド実行/grep カーソル上単語 in プロジェクト'],
      \    'name': '+grep',
      \    'p': ['call SpaceVim#mapping#search#grep("g", "p")', 'grep in プロジェクト']},
      \   'j':
      \   ['call SpaceVim#plugins#searcher#find("", SpaceVim#mapping#search#default_tool())',
      \    'バックグラウンド実行/キーワード検索 in プロジェクト内'],
      \   'k':
      \   {'B': ['call SpaceVim#mapping#search#grep("k", "B")', 'カーソル単語でack検索 in 開いている全バッファ'],
      \    'F': ['call SpaceVim#mapping#search#grep("k", "F")', 'カーソル単語でack検索 in 任意のディレクトリ'],
      \    'J':
      \    ['call SpaceVim#plugins#searcher#find(expand("<cword>"), "ack")',
      \     'バックグラウンド実行/ack検索 カーソル上単語 in プロジェクト'],
      \    'P': ['call SpaceVim#mapping#search#grep("k", "P")', 'カーソル単語でack検索 in プロジェクト'],
      \    'b': ['call SpaceVim#mapping#search#grep("k", "b")', 'ack検索 in 開いている全バッファ'],
      \    'f': ['call SpaceVim#mapping#search#grep("k", "f")', 'ack検索 in 任意のディレクトリ'],
      \    'j':
      \    ['call SpaceVim#plugins#searcher#find("", "ack")', 'バックグラウンド実行/ack検索 カーソル上単語 in プロジェクト'],
      \    'name': '+ack',
      \    'p': ['call SpaceVim#mapping#search#grep("k", "p")', 'ack検索 in プロジェクト']},
      \   'l': ['call SpaceVim#plugins#searcher#list()', '全ての検索結果'],
      \   'name': '+検索',
      \   'p': ['Denite grep:.', 'grep in プロジェクト内'],
      \   'r':
      \   {'B': ['call SpaceVim#mapping#search#grep("r", "B")', 'カーソル単語でrt検索 in 開いている全バッファ'],
      \    'F': ['call SpaceVim#mapping#search#grep("r", "F")', 'カーソル単語でrt検索 in 任意のディレクトリ'],
      \    'J':
      \    ['call SpaceVim#plugins#searcher#find(expand("<cword>"), "rg")',
      \     'バックグラウンド実行/rg検索 カーソル上単語 in プロジェクト'],
      \    'P': ['call SpaceVim#mapping#search#grep("r", "P")', 'カーソル単語でrt検索 in プロジェクト'],
      \    'b': ['call SpaceVim#mapping#search#grep("r", "b")', 'rt検索 in 開いている全バッファ'],
      \    'f': ['call SpaceVim#mapping#search#grep("r", "f")', 'rt検索 in 任意のディレクトリ'],
      \    'j': ['call SpaceVim#plugins#searcher#find("", "rg")', 'バックグラウンド実行/rg検索 カーソル上単語 in プロジェクト'],
      \    'name': '+rg',
      \    'p': ['call SpaceVim#mapping#search#grep("r", "p")', 'rt検索 in プロジェクト']},
      \   's': ['Denite line', 'grep in 現在のバッファ'],
      \   't':
      \   {'B': ['call SpaceVim#mapping#search#grep("t", "B")', 'カーソル単語でpt検索 in 開いている全バッファ'],
      \    'F': ['call SpaceVim#mapping#search#grep("t", "F")', 'カーソル単語でpt検索 in 任意のディレクトリ'],
      \    'J':
      \    ['call SpaceVim#plugins#searcher#find(expand("<cword>"), "pt")',
      \     'バックグラウンド実行/pt検索 カーソル上単語 in プロジェクト'],
      \    'P': ['call SpaceVim#mapping#search#grep("t", "P")', 'カーソル単語でpt検索 in プロジェクト内'],
      \    'b': ['call SpaceVim#mapping#search#grep("t", "b")', 'pt検索 in 開いている全バッファ'],
      \    'f': ['call SpaceVim#mapping#search#grep("t", "f")', 'pt検索 in 任意のディレクトリ'],
      \    'j': ['call SpaceVim#plugins#searcher#find("", "pt")', 'バックグラウンド実行/pt検索 カーソル上単語 in プロジェクト内'],
      \    'name': '+pt',
      \    'p': ['call SpaceVim#mapping#search#grep("t", "p")', 'pt検索 in プロジェクト内']}},
      \  't':
      \  {'8': ["call call(function('<SNR>54_toggle_fill_column'), [])", 'カラムカラー切替'],
      \   'S': ["call call(function('<SNR>54_toggle_spell_check'), [])", '文法チェック切替'],
      \   'b': ['call ToggleBG()', 'バックグラウンド切替'],
      \   'f': ["call call(function('<SNR>54_toggle_colorcolumn'), [])", 'カラムカラー表示/非表示切替'],
      \   'h':
      \   {'c': ['set cursorcolumn!', 'カーソル列ハイライト表示/非表示切替'],
      \    'h': ['set cursorline!', 'カーソル行ハイライト表示/非表示切替'],
      \    'i': ["call call(function('<SNR>54_toggle_indentline'), [])", 'インデントハイライト表示/非表示切替'],
      \    'name': '+ハイライト表示/非表示切替',
      \    's': ["call call(function('<SNR>54_toggle_syntax_hi'), [])", 'シンタックスハイライト表示/非表示切替']},
      \   'm':
      \   {'M': ['call SpaceVim#layers#core#statusline#toggle_section("major mode")', 'メジャーモード切替'],
      \    'T':
      \    ['if &laststatus == 2 | let &laststatus = 0 | else | let &laststatus = 2 | endif',
      \     'ステータスライン表示/非表示切替'],
      \    'b': ['call SpaceVim#layers#core#statusline#toggle_section("battery status")', 'バッテリー状態表示/非表示切替'],
      \    'm':
      \    ['call SpaceVim#layers#core#statusline#toggle_section("minor mode lighters")',
      \     'マイナーモード切替'],
      \    'name': '+モードライン',
      \    'p': ['call SpaceVim#layers#core#statusline#toggle_section("cursorpos")', 'カーソル位置表示/非表示切替'],
      \    't': ['call SpaceVim#layers#core#statusline#toggle_section("time")', '時刻表示/非表示切替'],
      \    'v':
      \    ['call SpaceVim#layers#core#statusline#toggle_section("version control info")', 'バージョンコントロール']},
      \   'n': ['setlocal nonumber! norelativenumber!', '行番号表示/非表示切替'],
      \   'name': '+設定切替',
      \   's': ["call call(function('<SNR>54_toggle_syntax_checker'), [])", 'シンタックスチェッカー切替'],
      \   't': ['call SpaceVim#plugins#tabmanager#open()', 'タブマネージャーを開く'],
      \   'w': ["call call(function('<SNR>54_toggle_whitespace'), [])", '空白表示/非表示切替']},
      \  'w':
      \  {'+': ["call call(function('<SNR>28_windows_layout_toggle'), [])", '画面レイアウト切替'],
      \   '-': ['bel split | wincmd w', '下画面で分割'],
      \   '/': ['bel vs | wincmd w', '右画面で分割'],
      \   '2': ['silent only | vs | wincmd w', '横2画面に分割'],
      \   '3': ['silent only | vs | vs | wincmd H', '3画面に分割'],
      \   '<Tab>': ['wincmd w', '代替え画面'],
      \   '=': ['wincmd =', '画面サイズ自動調整'],
      \   'C': ['ChooseWin | Goyo', '画面中央表示モード'],
      \   'D': ['ChooseWin | close | wincmd w', '現在の画面を閉じる'],
      \   'F': ['tabnew', '新しいタブを作成'],
      \   'H': ['wincmd H', '画面を左に移動'],
      \   'J': ['wincmd J', '画面を下に移動'],
      \   'K': ['wincmd K', '画面を上に移動'],
      \   'L': ['wincmd L', '画面を右に移動'],
      \   'M': ['ChooseWinSwap', '画面を入れ替える'],
      \   'R': ["call call(function('<SNR>67_previous_window'), [])", '画面位置逆ローテーション'],
      \   'U': ['call SpaceVim#plugins#windowsmanager#RedoQuitWin()', '画面操作をやり直す'],
      \   'V': ['bel vs', '右画面で分割しフォーカスも移動'],
      \   'W': ['ChooseWin', '画面を選択'],
      \   'c': ['Goyo', '画面中央表示モード'],
      \   'd': ['close', '画面を閉じる'],
      \   'h': ['wincmd h', '左画面分割'],
      \   'j': ['wincmd j', '下画面分割'],
      \   'k': ['wincmd k', '上画面分割'],
      \   'l': ['wincmd l', '右画面分割'],
      \   'm': ['only', '画面最大化(他のバッファはすべて閉じる）'],
      \   'name': '+画面操作',
      \   'o': ['tabnext', '他のタブ'],
      \   'r': ["call call(function('<SNR>67_next_window'), [])", '画面位置ローテーション'],
      \   'u': ['call SpaceVim#plugins#windowsmanager#UndoQuitWin()', '画面操作を元に戻す'],
      \   'v': ['bel vs | wincmd w', '右画面で分割'],
      \   'w': ['wincmd w', '画面フォーカスの移動']},
      \  'x':
      \  {'J':
      \   ["call call(function('<SNR>49_move_text_down_transient_state'), [])", 'テキストを下に移動'],
      \   'K':
      \   ["call call(function('<SNR>49_move_text_up_transient_state'), [])", 'テキストを上に移動'],
      \   'a':
      \   {'&': ['Tabularize /&', '& で選択範囲を整列'],
      \    '(': ['Tabularize /(', '( で選択範囲を整列'],
      \    ')': ['Tabularize /)', ') で選択範囲を整列'],
      \    ',': ['Tabularize /,', ', で選択範囲を整列'],
      \    '.': ['Tabularize /.', '. で選択範囲を整列'],
      \    ':': ['Tabularize /:', ': で選択範囲を整列'],
      \    ';': ['Tabularize /;', '; で選択範囲を整列'],
      \    '=': ['Tabularize /=', '= で選択範囲を整列'],
      \    '[': ['Tabularize /[', '[ で選択範囲を整列'],
      \    ']': ['Tabularize /]', '] で選択範囲を整列'],
      \    'name': '+align',
      \    '{': ['Tabularize /{', '{ で選択範囲を整列'],
      \    '}': ['Tabularize /}', '} で選択範囲を整列'],
      \    '|': ['Tabularize /|', '| で選択範囲を整列']},
      \   'c': ['call feedkeys("\<Plug>CountSelectionRegion", "m")', '選択範囲文字数カウント'],
      \   'd':
      \   {'[SPC]':
      \    ["silent call call(function('<SNR>49_delete_extra_space'), [])", 'カーソル付近の余分なスペースを削除'],
      \    'name': '+削除',
      \    'w': ['StripWhitespace', '余分な空白等を削除']},
      \   'g': {'name': '+翻訳', 't': ['Ydc', '現在の単語を翻訳']},
      \   'i':
      \   {'-': ["silent call call(function('<SNR>49_kebab_case'), [])", 'ケバブケースにする'],
      \    'C': ["silent call call(function('<SNR>49_UpperCamelCase'), [])", 'キャメルケースにする'],
      \    'U': ["silent call call(function('<SNR>49_up_case'), [])", 'アップケースにする'],
      \    '_': ["silent call call(function('<SNR>49_under_score'), [])", 'アンダスコアケースにする'],
      \    'c': ["silent call call(function('<SNR>49_lowerCamelCase'), [])", 'Lowerキャメルケースにする'],
      \    'k': ["silent call call(function('<SNR>49_kebab_case'), [])", 'ケバブケースにする'],
      \    'name': '+シンボルスタイル変更',
      \    'u': ["silent call call(function('<SNR>49_under_score'), [])", 'アンダスコアケースにする']},
      \   'name': '+文字コード等',
      \   't':
      \   {'c':
      \    ["call call(function('<SNR>49_transpose_with_previous'), [\"character\"])",
      \     'ひとつ前の文字と入れ替える'],
      \    'l':
      \    ["call call(function('<SNR>49_transpose_with_previous'), [\"line\"])", 'ひとつ前の行と入れ替える'],
      \    'name': '+転置',
      \    'w':
      \    ["call call(function('<SNR>49_transpose_with_previous'), [\"word\"])", 'ひとつ前の単語と入れ替える']}}}


let g:_spacevim_mappings_denite = {'<C-h>': ['DeniteCursorWord help', 'ヘルプ(カーソル上単語)'],
      \ '<space>': ['Denite menu:CustomKeyMaps', 'カスタムキー'],
      \ 'e': ['Denite register', 'レジスタ検索'],
      \ 'F': ['Denite file_rec', 'ファイル名検索'],
      \ 'g': ['Denite grep', 'grep検索'],
      \ 'j': ['Denite jump', 'denite jump'],
      \ 'o': ['Denite outline', 'アウトライン'],
      \ 'r': ['Denite -resume', 'denite再開']}



let g:_spacevim_mappings_unite = {'/': ['Denite grep -auto-preview', 'grep プレビュー付'],
      \ '<C-h>': ['DeniteCursorWord help', 'カーソル上単語でヘルプを検索'],
      \ 'T': ['Unite tag/include', 'タグ/include検索'],
      \ '[SPC]': ['Unite -silent -ignorecase -winheight=17 -start-insert menu:CustomKeyMaps', 'カスタムキーマップ'],
      \ 'b': ['UniteWithBufferDir -buffer-name=files buffer bookmark file', 'バッファディレクトリのファイル一覧'],
      \ 'c': ['UniteWithCurrentDir -buffer-name=files buffer bookmark file', 'カレントディレクトリのファイル一覧'],
      \ 'C': ['Denite colorscheme', 'カラースキーマ一覧'],
      \ 'd': ['Denite directory_mru', '最近開いたディレクトリ一覧'],
      \ 'e': ['Denite register', 'レジスタ一覧'],
      \ 'F': ['Denite file_rec', 'ファイル探索'],
      \ 'f': ['Denite file_mru', '最近開いたファイル一覧'],
      \ 'G': ['Denite grep', 'grep -r'],
      \ 'g': ['Denite line', 'grep .'],
      \ 'h': ['Denite command_history neoyank', '履歴/yank検索'],
      \ 'H': ['Denite change', 'ファイル編集履歴'],
      \ 'i': ['Unite git', 'gitファイル検索'],
      \ 'j': ['Denite jump', 'ジャンプ履歴検索'],
      \ 'l': ['Unite locationlist', 'ロケーションリスト検索'],
      \ 'm':
      \ {'a': ['Unite mapping', 'Uniteキーマッピング'],
      \  'e': ['Unite output:message', 'メッセージ出力を検索'],
      \  'name': 'Uniteメニュー'},
      \ 'n': ['Unite session/new', 'セッションを検索'],
      \ 'o': ['Denite outline', 'アウトラインを検索'],
      \ 'q': ['Unite quickfix', 'QuickFixを検索'],
      \ 'r': ['Unite -buffer-name=resume resume', 'Uniteの再開'],
      \ 'R': ['Denite -resume', 'Deniteの再開'],
      \ 's': ['Unite session', 'セッションを検索'],
      \ 't': ['Denite tag', 'タグを検索'],
      \ 'u': ['Unite source', 'sourceを検索'],
      \ 'w':
      \ ['Unite -buffer-name=files -no-split jump_point file_point buffer_tab file_rec:! file file/new',
      \  '探せるファイルをファイル名でとにかく検索']}

let g:_spacevim_mappings_g = {'#': ['call feedkeys("\<Plug>(incsearch-nohl-g#)")', '現在カーソル単語を上方向検索'],
      \ '$': ['call feedkeys("g$", "n")', '行末に移動'],
      \ '&': ['call feedkeys("g&", "n")', '前回の ":s"を全行に繰り返す'],
      \ "'": ["call feedkeys(\"g'\", \"n\")", 'マーク行にジャンプ'],
      \ '*': ['call feedkeys("\<Plug>(incsearch-nohl-g*)")', '現在カーソル単語を下方向検索'],
      \ '+': ['call feedkeys("g+", "n")', '編集やり直し'],
      \ ',': ['call feedkeys("g,", "n")', '最後の編集場所に移動'],
      \ '-': ['call feedkeys("g-", "n")', '編集取り消し'],
      \ '/': ['call feedkeys("\<Plug>(incsearch-stay)")', '表示中画面内でインクリ検索'],
      \ '0': ['call feedkeys("g0", "n")', '行頭に移動'],
      \ ';': ['call feedkeys("g;", "n")', '最初の編集場所に移動'],
      \ '<': ['call feedkeys("g<", "n")', '前回のコマンドアウトプットを再表示'],
      \ '<C-G>': ['call feedkeys("g\<c-g>", "n")', 'カーソル位置情報'],
      \ '<End>': ['call feedkeys("g$", "n")', '行末に移動'],
      \ '<Home>': ['call feedkeys("g0", "n")', '行頭に移動'],
      \ '@': ['call feedkeys("g@", "n")', 'call operatorfunc'],
      \ 'E': ['call feedkeys("gE", "n")', '単語末尾に移動'],
      \ 'F': ['call feedkeys("gF", "n")', '現在カーソル上のファイルの該当行を開く'],
      \ 'H': ['call feedkeys("gH", "n")', '行選択モード'],
      \ 'I': ['call feedkeys("gI", "n")', '行頭に入力する'],
      \ 'J': ['call feedkeys("gJ", "n")', '改行をとって次の行と結合する'],
      \ 'N': ['call feedkeys("gN", "n")', '選択範囲で前の一致'],
      \ 'Q': ['call feedkeys("gQ", "n")', '拡張モード'],
      \ 'R': ['call feedkeys("gR", "n")', 'リプレイスモード'],
      \ 'T': ['call feedkeys("gT", "n")', '前のタグページ'],
      \ 'U': ['call feedkeys("gU", "n")', '大文字に変換する'],
      \ ']': ['call feedkeys("g]", "n")', 'カーソル上のワードからタグ選択'],
      \ '^': ['call feedkeys("g^", "n")', '行最初の単語先頭に移動'],
      \ '_': ['call feedkeys("g_", "n")', '行最後の単語末尾に移動'],
      \ '`': ['call feedkeys("g`", "n")', 'マーク行にジャンプ'],
      \ 'a': ['call feedkeys("ga", "n")', 'カーソル上文字のアスキーコードを表示する'],
      \ 'd': ['call SpaceVim#mapping#gd()', '定義に移動'],
      \ 'e': ['call feedkeys("ge", "n")', '単語末尾へ移動'],
      \ 'f': ['call feedkeys("gf", "n")', '現在カーソル上のファイルを開く'],
      \ 'g': ['call feedkeys("gg", "n")', 'N行目に移動(省略時は先頭行に移動)'],
      \ 'h': ['call feedkeys("gh", "n")', '選択モード'],
      \ 'i': ['call feedkeys("gi", "n")', "マークの後に入力する"],
      \ 'j': ['call feedkeys("gj", "n")', '下にカーソル移動'],
      \ 'k': ['call feedkeys("gk", "n")', '上にカーソル移動'],
      \ 'm': ['call feedkeys("gm", "n")', '行中央にカーソル移動'],
      \ 'n': ['call feedkeys("gn", "n")', '選択範囲で次の一致'],
      \ 'o': ['call feedkeys("go", "n")', 'N バイト目に移動'],
      \ 's': ['call feedkeys("gs", "n")', 'スリープ N 秒'],
      \ 't': ['call feedkeys("gt", "n")', '次のタグページ'],
      \ 'u': ['call feedkeys("gu", "n")', '小文字に変換する'],
      \ 'v': ['call feedkeys("gv", "n")', '直前のビジュアルモード選択'],
      \ '~': ['call feedkeys("g~", "n")', 'swap case for Nmove text']}

let g:_spacevim_mappings_z = {'+': ['call feedkeys("z+", "n")', 'カーソル位置を画面トップへ'],
      \  '-': ['call feedkeys("z-", "n")', 'カーソル位置を画面下へ'],
      \  '.': ['call feedkeys("z.", "n")', 'カーソル位置を画面中央に'],
      \  '<CR>': ['call feedkeys("z\<CR>", "n")', 'カーソル行を画面トップへ'],
      \  '<Left>': ['call feedkeys("zh", "n")', 'N文字分画面右スクロール'],
      \  '<Right>': ['call feedkeys("zl", "n")', 'N文字分画面左スクロール'],
      \  '=': ['call feedkeys("z=", "n")', 'スペル候補'],
      \  'A': ['call feedkeys("zA", "n")', '配下の折りたたみ展開/非展開を切替'],
      \  'C': ['call feedkeys("zC", "n")', '配下の折りたたみを閉じる'],
      \  'D': ['call feedkeys("zD", "n")', '配下の折りたたみを無くす'],
      \  'E': ['call feedkeys("zE", "n")', '全ての折りたたみを無くす'],
      \  'F': ['call feedkeys("zF", "n")', '折りたたみを作成'],
      \  'G': ['call feedkeys("zG", "n")', '良いスペルとしてマーキング(スペル辞書も更新)'],
      \  'H': ['call feedkeys("zH", "n")', '右スクロール 半画面'],
      \  'L': ['call feedkeys("zL", "n")', '左スクロール 半画面'],
      \  'M': ['call feedkeys("zM", "n")', '折りたたみレベル0に設定'],
      \  'N': ['call feedkeys("zN", "n")', '折りたたみを有効化'],
      \  'O': ['call feedkeys("zO", "n")', '再帰的に展開'],
      \  'R': ['call feedkeys("zR", "n")', '折りたたみレベルを最も深いレベルに設定'],
      \  'W': ['call feedkeys("zW", "n")', '悪いスペルとしてマーキング'],
      \  'X': ['call feedkeys("zX", "n")', '折りたたみレベル再適用'],
      \  '^': ['call feedkeys("z^", "n")', '画面下にカーソル移動'],
      \  'a': ['call feedkeys("za", "n")', '折りたたみ機能切替'],
      \  'b': ['call feedkeys("zb", "n")', '再読み込みし、カーソル行を画面下部へ'],
      \  'c': ['call feedkeys("zc", "n")', '折りたたむ'],
      \  'd': ['call feedkeys("zd", "n")', '折りたたみを削除'],
      \  'e': ['call feedkeys("ze", "n")', 'カーソル位置に右スクロール'],
      \  'f': ['call feedkeys("zf", "n")', '折りたたみモーションを作成'],
      \  'g': ['call feedkeys("zg", "n")', '良いスペルとしてマーキング'],
      \  'h': ['call feedkeys("zh", "n")', 'N文字分画面右スクロール'],
      \  'i': ['call feedkeys("zi", "n")', '折りたたみ設定有効/無効の切替'],
      \  'j': ['call feedkeys("zj", "n")', '次の折りたたみ部へ'],
      \  'k': ['call feedkeys("zk", "n")', '前の折りたたみ部へ'],
      \  'l': ['call feedkeys("zl", "n")', 'N文字分画面左スクロール'],
      \  'm': ['call feedkeys("zm", "n")', '折りたたみレベル-1'],
      \  'n': ['call feedkeys("zn", "n")', '折りたたみ設定リセット'],
      \  'o': ['call feedkeys("zo", "n")', '折りたたみを開く'],
      \  'r': ['call feedkeys("zr", "n")', '折りたたみレベル+1'],
      \  's': ['call feedkeys("zs", "n")', 'カーソル位置に左スクロール'],
      \  't': ['call feedkeys("zt", "n")', '画面上部にカーソルを置く'],
      \  'v': ['call feedkeys("zv", "n")', 'カーソルラインを表示するのに十分な折りたたみを開く'],
      \  'x': ['call feedkeys("zx", "n")', '折りたたみレベルを再適用し、再展開'],
      \  'z': ['call feedkeys("zz", "n")', 'スマートスクロール']}

call SpaceVim#mapping#leader#defindKEYs()

function! s:flatten(dict)
  let tardict = {}
  for [key, value] in items(a:dict)
    if type(value) == type([])
      let tardict[key] = value
    elseif type(value) == type({})
      for [k, v] in items(s:flatten(value))
        let tardict[key.k] = v
      endfor
    endif
  endfor
  return tardict
endfunction


for [key, value] in items(s:flatten(g:_spacevim_mappings_denite))
  call zvim#util#defineMap('nnoremap <silent>', '[denite]'. key ,
        \    ':<C-u>' . value[0] . '<CR>' , value[1])
endfor

for [key, value] in items(s:flatten(g:_spacevim_mappings_unite))
  call zvim#util#defineMap('nnoremap <silent>', '[unite]'. key ,
        \    ':<C-u>' . value[0] . '<CR>' , value[1])
endfor

for [key, value] in items(s:flatten(g:_spacevim_mappings_space))
  if stridx(value[0], "call call") == 0
    call zvim#util#defineMap('nnoremap <silent>', '[SPC]'. key ,
          \    ':' . value[0] . '<CR>' , value[1])
  endif
endfor

" for [key, value] in items(s:flatten(g:_spacevim_mappings))
"     call zvim#util#defineMap('nnoremap <silent>', '<Leader>'. key ,
"     \    ':' . value[0] . '<CR>' , value[1])
" endfor
" for [key, value] in items(s:flatten(g:_spacevim_mappings_g))
"     call zvim#util#defineMap('nnoremap <silent>', 'g'. key ,
"     \    ':' . value[0] . '<CR>' , value[1])
" endfor
" for [key, value] in items(s:flatten(g:_spacevim_mappings_z))
"     call zvim#util#defineMap('nnoremap <silent>', 'z'. key ,
"     \    ':' . value[0] . '<CR>' , value[1])
" endfor


" vim:set et sw=2 cc=80:

