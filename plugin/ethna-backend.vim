" ethna-switch.vim:
" Load Once:
if &cp || exists("g:loaded_ethna_switch_backend")
    finish
endif
let g:loaded_ethna_switch_backend = 1
let s:keepcpo = &cpo
set cpo&vim
" ---------------------------------------------------------------------

function! s:FullPath()
    return expand('%:p')
endfunction

function! s:IsGenericDao()
    if (matchstr(s:FullPath(), '/GenericDao/\(.\{-\}/\)\{-\}.\{-\}\.php\?$') != '')
        return 1
    else
        return 0
    endif
endfunction

function! s:IsTdGateway()
    if (matchstr(s:FullPath(), '/TdGateway/\(.\{-\}/\)\{-\}.\{-\}\.php$') != '')
        return 1
    else
        return 0
    endif
endfunction

function! s:IsModule()
    if (matchstr(s:FullPath(), '/TdGateway/\(.\{-\}/\)\{-\}.\{-\}\.php$') != '')
        return 1
    else
        return 0
    endif
endfunction

function! s:GetGenericDaoPathFromTdGateway()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/TdGateway/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/TdGateway/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\2', '')
    let l:fname = substitute(s:FullPath(), '^\(.*\)/TdGateway/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\4', '')

    let a = l:root. '/GenericDao/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g'). substitute(l:fname, '\(\zs\)\(.*\)\(.php\)', '\u\1\2.php', '')
    return a
endfunction

function! s:GetModulePathFromTdGateway()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/TdGateway/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/TdGateway/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\2', '')
    let l:fname = substitute(s:FullPath(), '^\(.*\)/TdGateway/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\4', '')

    let a = l:root. '/Module/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g'). substitute(l:fname, '\(\zs\)\(.*\)\(.php\)', '\u\1\2.php', '')
    return a
endfunction


function! s:GetTdGatewayPathFromGenericDao()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\2', '')
    let l:fname = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\4', '')

    let a = l:root. '/TdGateway/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g'). substitute(l:fname, '\(\zs\)\(.*\)\(.php\)', '\u\1\2.php', '')
    return a
endfunction

function! s:GetModulePathFromGenericDao()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\2', '')
    let l:fname = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\4', '')

    let a = l:root. '/Module/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g'). substitute(l:fname, '\(\zs\)\(.*\)\(.php\)', '\u\1\2.php', '')
    return a
endfunction

function! s:GetTdGatewayPathFromGenericDao()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\2', '')
    let l:fname = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\4', '')

    let a = l:root. '/TdGateway/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g'). substitute(l:fname, '\(\zs\)\(.*\)\(.php\)', '\u\1\2.php', '')
    return a
endfunction

function! s:GetGenericDaoPathFromModule()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/Module/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/Module/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\2', '')
    let l:fname = substitute(s:FullPath(), '^\(.*\)/Module/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\4', '')

    let a = l:root. '/GenericDao/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g'). substitute(l:fname, '\(\zs\)\(.*\)\(.php\)', '\u\1\2.php', '')
    return a
endfunction

function! s:GetTdGatewayPathFromModule()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/Module/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/Module/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\2', '')
    let l:fname = substitute(s:FullPath(), '^\(.*\)/Module/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\4', '')

    let a = l:root. '/TdGateway/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g'). substitute(l:fname, '\(\zs\)\(.*\)\(.php\)', '\u\1\2.php', '')
    return a
endfunction

function! s:GetGenericDaoDirFromGenericDao()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\2', '')

    let a = l:root. '/GenericDao/'. l:dir
    return a
endfunction

function! s:GetGenericDaoDirFromTdGateway()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/TdGateway/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/TdGateway/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\2', '')

    let a = l:root. '/GenericDao/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g')
    return a
endfunction

function! s:GetGenericDaoDirFromModule()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/Module/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/Module/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\2', '')

    let a = l:root. '/GenericDao/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g')
    return a
endfunction

function! s:GetTdGatewayDirFromGenericDao()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\2', '')

    let a = l:root. '/TdGateway/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g')
    return a
    return a
endfunction

function! s:GetTdGatewayDirFromTdGateway()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/TdGateway/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/TdGateway/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\2', '')

    let a = l:root. '/TdGateway/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g')
    return a
endfunction

function! s:GetTdGatewayDirFromTdGateway()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/Module/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/Module/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\2', '')

    let a = l:root. '/TdGateway/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g')
    return a
endfunction

function! s:GetModuleDirFromGenericDao()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/GenericDao/\(\(.\{-\}/\)*\)\(.\{-\}\.php\?\)$', '\2', '')

    let a = l:root. '/Module/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g')
    return a
    return a
endfunction

function! s:GetModuleDirFromTdGateway()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/TdGateway/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/TdGateway/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\2', '')

    let a = l:root. '/Module/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g')
    return a
endfunction

function! s:GetModuleDirFromModule()
    let l:root  = substitute(s:FullPath(), '^\(.*\)/Module/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\1', '')
    let l:dir   = substitute(s:FullPath(), '^\(.*\)/Module/\(\(.\{-\}/\)*\)\(.\{-\}\.php\)$', '\2', '')

    let a = l:root. '/Module/'. substitute(substitute(l:dir, '.*', '\u\0', ''), '/\(.\)', '/\u\1', 'g')
    return a
endfunction



function! s:GetPHPFileName(path)
    if filereadable(a:path. '5')
        return a:path. '5'
    else
        return a:path
    endif
endfunction

function! s:IsDirectory(path)
    let l:path = substitute(a:path, '/$', '', '')
    if isdirectory(l:path)
        return 1
    else
        return 0
    endif
endfunction

function! s:GenericDao()
    if s:IsGenericDao()
        return
    elseif s:IsTdGateway()
        if s:IsDirectory(s:GetGenericDaoDirFromTdGateway())
            execute ':e '. s:GetPHPFileName(s:GetGenericDaoPathFromTdGateway())
        else
            echohl WarningMsg | echo 'directory '. s:GetGenericDaoDirFromTdGateway(). ' is not found.' | echohl None
        endif
    elseif s:IsModule()
        if s:IsDirectory(s:GetGenericDaoDirFromModule())
            execute ':e '. s:GetPHPFileName(s:GetGenericDaoPathFromModule())
        else
            echohl WarningMsg | echo 'directory '. s:GetGenericDaoDirFromModule(). ' is not found.' | echohl None
        endif
    else
        return
    endif
endfunction

function! s:TdGateway()
    if s:IsGenericDao()
        if s:IsDirectory(s:GetTdGatewayDirFromGenericDao())
            execute ':e '. s:GetTdGatewayPathFromGenericDao()
        else
            echohl WarningMsg | echo 'directory '. s:GetTdGatewayDirFromGenericDao(). ' is not found.' | echohl None
        endif
    elseif s:IsModule()
        if s:IsDirectory(s:GetTdGatewayDirFromModule())
            execute ':e '. s:GetPHPFileName(s:GetTdGatewayPathFromModule())
        else
            echohl WarningMsg | echo 'directory '. s:GetTdGatewayDirFromModule(). ' is not found.' | echohl None
        endif
    else
        return
    endif
endfunction

function! s:Module()
    if s:IsGenericDao()
        if s:IsDirectory(s:GetModuleDirFromGenericDao())
            execute ':e '. s:GetModulePathFromGenericDao()
        else
            echohl WarningMsg | echo 'directory '. s:GetModuleDirFromGenericDao(). ' is not found.' | echohl None
        endif
    elseif s:IsTdGateway()
        if s:IsDirectory(s:GetModuleDirFromTdGateway())
            execute ':e '. s:GetPHPFileName(s:GetModulePathFromTdGateway())
        else
            echohl WarningMsg | echo 'directory '. s:GetModuleDirFromTdGateway(). ' is not found.' | echohl None
        endif
    else
        return
    endif
endfunction

function! s:ReplacedCmd(path)
    let l:loc = strpart(getcmdline(), 0, getcmdpos() - 1)
    let l:roc = strpart(getcmdline(), getcmdpos() - 1)
    call setcmdpos(strlen(l:loc) + strlen(a:path) + 1)
    return l:loc. a:path. l:roc
endfunction

function! s:InsertGenericDaoDir()
    if s:IsGenericDao()
        return s:ReplacedCmd(s:GetGenericDaoDirFromGenericDao())
    elseif s:IsTdGateway()
        return s:ReplacedCmd(s:GetGenericDaoDirFromTdGateway())
    elseif s:IsModule()
        return s:ReplacedCmd(s:GetGenericDaoDirFromModule())
    else
        return getcmdline()
    endif
endfunction

function! s:InsertTdGatewayDir()
    if s:IsGenericDao()
        return s:ReplacedCmd(s:GetTdGatewayDirFromGenericDao())
    elseif s:IsTdGateway()
        return s:ReplacedCmd(s:GetTdGatewayDirFromTdGateway())
    elseif s:IsModule()
        return s:ReplacedCmd(s:GetTdGatewayDirFromModule())
    else
        return getcmdline()
    endif
endfunction

function! s:InsertModuleDir()
    if s:IsGenericDao()
        return s:ReplacedCmd(s:GetModuleDirFromGenericDao())
    elseif s:IsTdGateway()
        return s:ReplacedCmd(s:GetModuleDirFromTdGateway())
    elseif s:IsModule()
        return s:ReplacedCmd(s:GetModuleDirFromModule())
    else
        return getcmdline()
    endif
endfunction

command! -nargs=0 EBGenericDao call <SID>GenericDao()
command! -nargs=0 EBTdGateway  call <SID>TdGateway()
command! -nargs=0 EBModule     call <SID>Module()

" ---------------------------------------------------------------------
let &cpo= s:keepcpo
unlet s:keepcpo

