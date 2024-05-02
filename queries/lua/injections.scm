; extends

; Extend support for vimscript injection in aliased autocmd
((identifier) @_vimcmd_id
    (arguments
      (table_constructor
        (field
          (identifier) @_field_id
          (string) @vim
        )
      )
    )

  (#lua-match? @_vimcmd_id "autocmd")
  (#lua-match? @_field_id "command")
  (#lua-match? @vim "^%[%[")
  (#offset! @vim 0 2 0 -2))

((identifier) @_vimcmd_id
    (arguments
      (table_constructor
        (field
          (identifier) @_field_id
          (string) @vim
        )
      )
    )

  (#lua-match? @_vimcmd_id "autocmd")
  (#lua-match? @_field_id "command")
  (#lua-match? @vim "^%\"")
  (#offset! @vim 0 1 0 -1))
