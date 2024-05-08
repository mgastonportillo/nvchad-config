; extends

; Extend support for vimscript injection in aliased autocmd
((identifier) @_vimcmd_id
    (arguments
      (table_constructor
        (field
          name: (identifier) @_field_id
          value: (string content: (string_content) @vim)
        )
      )
    )
  (#lua-match? @_vimcmd_id "autocmd")
  (#lua-match? @_field_id "command"))
