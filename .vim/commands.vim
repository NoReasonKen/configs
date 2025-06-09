" Format xml
command! XmlFormat %!xml c14n
" Format 2 xml files in vim diff mode
command! XmlFormatDiff windo %!xml c14n

