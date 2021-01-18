" original source - https://gist.githubusercontent.com/kbenzie/7f9e563d57093017267c/raw/264909e91f8a34cf3468abead5b89e2b92fe2e6c/fresh.vim
" fiddled with by PureArtistry

let g:airline#themes#mood#palette = {}

" NORMAL mode
let s:N1 = ['#005f00', '#afdf00', 15, 4, 'bold']
let s:N2 = ['#ffffff', '#444444', 15, 8, '']
let s:N3 = ['#ffffff', '#121212', 7, '', 'italic']
let s:W = ['#000000', '#8700df', 15, 1, '']
let s:E = ['#000000', '#990000', 15, 9, '']
let g:airline#themes#mood#palette.normal =
      \ airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#mood#palette.normal.airline_warning = s:W
let g:airline#themes#mood#palette.normal.airline_error = s:E
let g:airline#themes#mood#palette.normal_modified = {
      \ 'airline_c': ['#ff5f00', '#121212', 15, '', 'bold'], }

" INSERT mode
let s:I1 = ['#0000df', '#00dfff', 15, 2, '']
let s:I2 = s:N2
let s:I3 = s:N3
let g:airline#themes#mood#palette.insert =
      \ airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#mood#palette.insert.airline_warning = s:W
let g:airline#themes#mood#palette.insert.airline_error = s:E
let g:airline#themes#mood#palette.insert_modified =
      \ g:airline#themes#mood#palette.normal_modified
let g:airline#themes#mood#palette.insert_modified.airline_warning = s:W
let g:airline#themes#mood#palette.insert_modified.airline_error = s:E
let g:airline#themes#mood#palette.insert_paste = {
      \ 'airline_a': [s:I1[0], '#d78700', s:I1[2], 172, ''], }

" REPLACE mode
let g:airline#themes#mood#palette.replace =
      \ copy(g:airline#themes#mood#palette.insert)
let g:airline#themes#mood#palette.replace.airline_warning = s:W
let g:airline#themes#mood#palette.replace.airline_error = s:E
let g:airline#themes#mood#palette.replace.airline_a =
      \ [s:I2[0], '#af0000', s:I2[2], 124, '']
let g:airline#themes#mood#palette.replace_modified =
      \ g:airline#themes#mood#palette.normal_modified

" VISAUL mode
let s:V1 = ['#5f0000', '#ffaf00', 15, 5, '']
let s:V2 = s:N2
let s:V3 = s:N3
let g:airline#themes#mood#palette.visual =
      \ airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#mood#palette.visual.airline_warning = s:W
let g:airline#themes#mood#palette.visual.airline_error = s:E
let g:airline#themes#mood#palette.visual_modified =
      \ g:airline#themes#mood#palette.normal_modified

" INACTIVE mode
let s:IA1 = ['#4e4e4e', '#1c1c1c', 239, 234, '']
let s:IA2 = ['#4e4e4e', '#262626', 239, 235, '']
let s:IA3 = s:N3
let g:airline#themes#mood#palette.inactive =
      \ airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#mood#palette.inactive.airline_warning = s:IA2
let g:airline#themes#mood#palette.inactive.airline_error =  s:IA2
let g:airline#themes#mood#palette.inactive_modified = {
      \ 'airline_c': ['#875faf', '', 97, '', ''], }

" COMMAND mode
let s:airline_a_commandline = ['#0000ff', '#0cff00', 15 , 3, '']
let s:airline_b_commandline = s:N2
let s:airline_c_commandline = s:N3
let g:airline#themes#mood#palette.commandline = airline#themes#generate_color_map(s:airline_a_commandline, s:airline_b_commandline, s:airline_c_commandline)
let g:airline#themes#mood#palette.commandline.airline_warning = s:W
let g:airline#themes#mood#palette.commandline.airline_error = s:E
let g:airline#themes#mood#palette.commandline_modified =
      \ g:airline#themes#mood#palette.normal_modified

let g:airline#themes#mood#palette.accents = {
      \ 'red': [ '#ff0000' , '' , 160 , ''  ] }

if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#mood#palette.ctrlp =
      \ airline#extensions#ctrlp#generate_color_map(
      \   ['#d7d7ff', '#5f00af', 15, '', ''],
      \   ['#ffffff', '#875fd7', 15, 2, ''],
      \   ['#5f00af', '#ffffff', 15, 1, 'bold'] )
