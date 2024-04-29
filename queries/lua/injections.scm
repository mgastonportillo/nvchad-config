; extends

<<<<<<< HEAD
=======
; Extend support for vimscript injection in
; variables for autocmds and usercmds
>>>>>>> 024e952 (Add queries for vimscript injections within usercmds and autocmds)
(
  (function_call
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
  (#offset! @vim 0 2 0 -2)
)
