; extends

; Extend support for vimscript injection in aliased autocmd
(function_call
  name: (_) @_vimcmd_identifier
  arguments: (arguments
    .
    (_)
    .
    (table_constructor
      (field
        name: (identifier) @_command
        value: (string
          content: (_) @injection.content))) .)
  ; limit so only 2-argument functions get matched before pred handle
  (#eq? @_vimcmd_identifier "autocmd")
  (#eq? @_command "command")
  (#set! injection.language "vim"))
