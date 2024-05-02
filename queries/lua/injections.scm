; extends

; Extend support for vimscript injection for autocmds and usercmds variables
((function_call
    (identifier) @_vimcmd_identifier
    (arguments
      (table_constructor
        (field
          (string) @vim
        )
      )
    )
  )

  (#any-of? @_vimcmd_identifier "autocmd" "usercmd")
  (#lua-match? @vim "^%[%[")
  (#offset! @vim 0 2 0 -2))
