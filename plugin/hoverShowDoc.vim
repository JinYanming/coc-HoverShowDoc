func! AutoShowDocumentationInit()
  if !exists('g:autoshowdocumentationenable')
    let g:autoshowdocumentationenable = 0  " 默认打开自动显示函数说明
  end
  if g:AutoShowDocumentationToggle != ''
    " use <expr> to ensure showing the status when toggle
    execute 'inoremap <buffer> <silent> <expr> '.g:AutoShowDocumentationToggle.' AutoShowDocumentationToggle()'
    execute 'noremap <buffer> <silent> '.g:AutoShowDocumentationToggle.' :call AutoShowDocumentationToggle()<CR>'
end
endf


func! AutoShowDocumentationToggle()
  if g:autoshowdocumentationenable
    let g:autoshowdocumentationenable = 0
    echo 'AutoShowDocumentation Disabled.'
  else
    let g:autoshowdocumentationenable = 1
    echo 'AutoShowDocumentation Enabled.'
  end
  return ''
endf

if !exists('g:AutoShowDocumentationToggle')
  let g:AutoShowDocumentationToggle = '<M-s>'
end

function! AutoShowDocumentation()
  if g:autoshowdocumentationenable
    call CocActionAsync('doHover') 
  endif
endfunction

autocmd CursorHold * silent call AutoShowDocumentation()
au BufEnter * :call AutoShowDocumentationInit()

