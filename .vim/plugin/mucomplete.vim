" Tab complete dont accept until told to
set completeopt+=menuone
set completeopt+=noselect
let g:mucomplete#enable_auto_at_startup = 1


"----------- completion chains
set complete-=i
set complete-=t
" remove beeps during completion
set belloff=all

let g:mucomplete#chains = {}
let g:mucomplete#chains['default']   =  {
      \              'default': ['list',  'omni',  'path',  'c-n',   'uspl'],
      \              '.*string.*': ['uspl'],
      \              '.*comment.*': ['uspl']
      \            }
let g:mucomplete#chains['html']      =  ['omni',  'path',  'c-n',   'uspl']
let g:mucomplete#chains['vim']       =  ['list',  'cmd',   'path',  'keyp']
let g:mucomplete#chains['tex']       =  ['path',  'omni',  'uspl',  'dict',  'c-n']
let g:mucomplete#chains['sh']        =  ['file',  'dict',  'keyp']
let g:mucomplete#chains['zsh']       =  ['file',  'dict',  'keyp']
let g:mucomplete#chains['java']      =  ['keyn',  'c-n',   'omni']
let g:mucomplete#chains['javascript']=  ['tags',  'omni',  'c-n']
let g:mucomplete#chains['c']         =  ['list',  'omni',  'omni', 'c-n']
let g:mucomplete#chains['go']        =  ['list',  'omni',  'c-n']
let g:mucomplete#chains['troff']     =  ['omni',  'keyn',   'uspl',  'dict']
let g:mucomplete#chains['nroff']     =  g:mucomplete#chains['troff']
let g:mucomplete#chains['markdown']  =  ['path',  'c-n',   'uspl',  'dict']
let g:mucomplete#chains['dotoo']     =  g:mucomplete#chains['markdown']
let g:mucomplete#chains['mail']      =  g:mucomplete#chains['markdown']
let g:mucomplete#chains['gitcommit'] =  g:mucomplete#chains['markdown']

if !exists('g:mucomplete#can_complete')
  let s:c_cond = { t -> t =~# '\%(->\|\.\)$' }
  let s:latex_cond= { t -> t =~# '\%(\\\)$' }
  let g:mucomplete#can_complete = {}
  let g:mucomplete#can_complete['c']         =  {  'omni':  s:c_cond              }
  let g:mucomplete#can_complete['go']        =  {  'omni':  s:c_cond              }
  let g:mucomplete#can_complete['python']    =  {  'omni':  s:c_cond              }
  let g:mucomplete#can_complete['java']      =  {  'omni':  s:c_cond              }
  " let g:mucomplete#can_complete['javascript']=  {  'omni': {t->t=~#'\%(->\|\.\|(\))$' }}
  let g:mucomplete#can_complete['javascript']=  {  'omni':  s:c_cond }
  let g:mucomplete#can_complete['markdown']  =  {  'dict':  s:latex_cond          }
  let g:mucomplete#can_complete['org']       =  {  'dict':  s:latex_cond,
        \ 'tag': {t->t=~#'\%(:\)$' }}
  let g:mucomplete#can_complete['tex']       =  {  'omni':  s:latex_cond          }
  let g:mucomplete#can_complete['troff']     =  {  'omni': { t -> t =~# '\%(\\\[\)$' }}
  let g:mucomplete#can_complete['troff']     =  {  'omni': { t -> t =~# '^.' }}
  let g:mucomplete#can_complete['html']      =  {  'omni':  {t->t=~#'\%(<\/\)$'}  }
  let g:mucomplete#can_complete['vim']       =  {  'cmd':   {t->t=~#'\S$'}        }
endif
let g:mucomplete#no_popup_mappings = 1
"spelling
let g:mucomplete#spel#good_words = 1
