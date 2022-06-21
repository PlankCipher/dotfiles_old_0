;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       (company +childframe)
       vertico

       :ui
       doom
       doom-dashboard
       hl-todo
       modeline
       ophints
       (popup +defaults)
       vc-gutter
       vi-tilde-fringe

       :editor
       (evil +everywhere)
       fold
       (format +onsave)
       multiple-cursors
       snippets

       :emacs
       dired
       undo
       electric

       :term
       vterm

       :checkers
       (syntax +childframe)

       :tools
       lookup
       (lsp +peek)
       magit
       rgb
       ;;editorconfig

       :lang
       (cc +lsp)
       (javascript +lsp)
       (web +lsp)

       :config
       (default +bindings +smartparens))
