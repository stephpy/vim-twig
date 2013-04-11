" @inspired from http://knplabs.fr/blog/boost-your-productivity-with-sf2-and-vim
" first set path
set path+=**

" jump to a twig view in symfony
function! s:TwigJumpToView()
    mark C
    normal! ]M
    let end = line(".")
    normal! [m
    try
        call search('\v[^.:]+\.html\.twig', '', end)
        normal! gf
    catch
        normal! g`C
        echohl WarningMsg | echomsg "Template file not found" | echohl None
    endtry
endfunction
com! TwigJumpToView call s:TwigJumpToView()

" create a mapping only in a Controller file
autocmd BufEnter *.html.twig nmap <buffer><leader>v :TwigJumpToView<CR>
