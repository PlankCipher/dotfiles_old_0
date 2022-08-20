;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

; font and theme
(setq doom-font (font-spec :family "Hack Nerd Font Mono" :size 19 :weight 'semi-light)
      doom-theme 'doom-gruvbox)

; dashboard
(setq fancy-splash-image "~/.config/doom/gnu.png"
      +doom-dashboard-functions '(doom-dashboard-widget-banner)
      +doom-dashboard-banner-padding '(0 . 0))

; blinking cursor
(blink-cursor-mode +1)
(setq blink-cursor-blinks 3)

; box cursors all over the place
(setq evil-emacs-state-cursor    'box
      evil-insert-state-cursor   'box
      evil-motion-state-cursor   'box
      evil-normal-state-cursor   'box
      evil-operator-state-cursor 'box
      evil-replace-state-cursor  'box
      evil-visual-state-cursor   'box)

; transparent background
(set-frame-parameter (selected-frame) 'alpha 80)
(add-to-list 'default-frame-alist '(alpha . 80))

; show spaces and tabs (anywhere but magit & dired buffers)
(global-whitespace-mode +1)
(setq whitespace-style '(face tabs tab-mark spaces space-mark trailing)
      whitespace-display-mappings '((space-mark   ?\     [?·])
                                    (tab-mark     ?\t    [?» ?\t]))
      whitespace-global-modes '(not magit-mode dired-mode))
(custom-set-faces! '(whitespace-tab :background))

; remove background from markdown code blocks
(custom-set-faces! '(markdown-code-face :background))

; select only text (not to the end of the window)
(custom-set-faces! '(region :inverse-video t :extend nil))

; don't truncate lines (in other words, wrap them around)
(setq-default truncate-lines nil
              truncate-partial-width-windows nil)

; misc
(setq undo-no-redo t
      confirm-kill-emacs nil
      display-line-numbers-type 'relative
      org-directory "~/org/"
      compilation-auto-jump-to-first-error t
      scroll-conservatively 0
      save-place-file "/dev/null")
(add-hook '+doom-dashboard-mode-hook (lambda () (kill-buffer "*scratch*")))

; make git status in fringe stand out more
(setq-default left-fringe-width 13
              right-fringe-width 13)
(custom-set-faces!
  '(git-gutter-fr:added    :background "#9c9e20")
  '(git-gutter-fr:deleted  :background "#d53e2c")
  '(git-gutter-fr:modified :background "#78a369"))
(setq git-gutter:update-interval 0.3)

; defaults for almost all popups
(set-popup-rules!
  '(("^ ?\\*"
     :side bottom :height 0.5 :ttl t :quit 'current :select t :modeline t)))

; don't hide stuff in dired
(add-hook 'dired-omit-mode-hook (lambda () (setq dired-omit-mode nil)))
(setq dired-kill-when-opening-new-dired-buffer t)

; make evil k and j move in terms of visual lines
(map! :nvr "k" #'evil-previous-visual-line)
(map! :nvr "j" #'evil-next-visual-line)

; make evil n and N center search results
(map! :nvr "n" (lambda () (interactive) (evil-ex-search-next)     (evil-scroll-line-to-center nil)))
(map! :nvr "N" (lambda () (interactive) (evil-ex-search-previous) (evil-scroll-line-to-center nil)))

; drag stuff up and down
(map! :nvr "M-k" #'drag-stuff-up)
(map! :nvr "M-j" #'drag-stuff-down)

; magit
(setq magit-section-initial-visibility-alist '((magit-log-section . show))
      magit-delete-by-moving-to-trash nil
      magit-section-visibility-indicator nil)

; better company
(setq company-selection-wrap-around t
      company-box-doc-delay 0
      company-idle-delay 0
      company-selection-default nil
      company-frontends '(company-tng-frontend company-box-frontend)
      company-tooltip-idle-delay 0)
(add-hook 'lsp-completion-mode-hook (lambda () (setq company-abort-on-unique-match t)))

; remove backgrounds from flycheck faces
(custom-set-faces!
  '(flycheck-error   :background)
  '(flycheck-info    :background)
  '(flycheck-warning :background))

; lsp
;; the freedom to choose a single choice
(setq lsp-auto-execute-action nil)

;; open and close documentation of symbol at point
(map! :n "K"     (lambda () (interactive) (lsp-ui-doc-show) (lsp-ui-doc-focus-frame)))
(map! :n "C-S-k" (lambda () (interactive) (lsp-ui-doc-unfocus-frame) (lsp-ui-doc-hide)))

;; c/c++
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

;; javascript/typescript
(setq lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/dev/stderr")
      lsp-javascript-preferences-quote-style "single"
      lsp-typescript-preferences-quote-style "single"
      lsp-typescript-check-npm-is-installed nil
      lsp-typescript-npm "/usr/bin/yarn"
      lsp-clients-typescript-npm-location "/usr/bin/yarn"
      lsp-eslint-package-manager "yarn")

;; css
(setq lsp-css-lint-duplicate-properties "warning"
      lsp-css-lint-zero-units           "warning")

;; lsp-ui
(use-package lsp-ui
  :config
  (setq lsp-ui-sideline-delay 0
        lsp-ui-sideline-wait-for-all-symbols nil
        lsp-ui-peek-always-show t
        lsp-ui-doc-max-height 15
        lsp-ui-doc-delay 0
        lsp-ui-imenu-auto-refresh-delay 0))

; would this make anything faster?
(setq eldoc-idle-delay 0
      flycheck-display-errors-delay 0
      flycheck-idle-change-delay 0
      idle-update-delay 0
      lsp-idle-delay 0
      register-preview-delay 0
      tooltip-delay 0)

; modeline
(after! doom-modeline
  ;; spacers
  (doom-modeline-def-segment spc (doom-modeline-spc))
  (push '(spc . doom-modeline-segment--spc) doom-modeline-fn-alist)
  (doom-modeline-def-segment wspc (doom-modeline-wspc))
  (push '(wspc . doom-modeline-segment--wspc) doom-modeline-fn-alist)

  ;; layout
  (doom-modeline-def-modeline 'main
    '(bar spc modals wspc buffer-info wspc buffer-position wspc selection-info lsp misc-info checker wspc matches)
    '(debug grip follow vcs wspc buffer-encoding wspc major-mode process spc))

  ;; segments
  (doom-modeline-def-segment modals
    (let* ((evil (doom-modeline--evil))
           (ow (doom-modeline--overwrite))
           (god (doom-modeline--god))
           (ryo (doom-modeline--ryo))
           (xf (doom-modeline--xah-fly-keys))
           (boon (doom-modeline--boon))
           (vsep (doom-modeline-vspc))
           (meow (doom-modeline--meow)))
      (concat (and evil (concat evil (and (or ow god ryo xf boon meow))))
              (and ow (concat ow (and (or god ryo xf boon meow))))
              (and god (concat god (and (or ryo xf boon meow))))
              (and ryo (concat ryo (and (or xf boon meow))))
              (and xf (concat xf (and (or boon meow))))
              (and boon (concat boon (and meow)))
              meow)))

  (defun doom-modeline--buffer-state-icon ()
    (when doom-modeline-buffer-state-icon
      (when-let ((icon (doom-modeline-update-buffer-file-state-icon)))
        (concat
         (if (doom-modeline--active)
             icon
           (doom-modeline-propertize-icon icon 'mode-line-inactive))
         (and (not (equal doom-modeline--buffer-file-state-icon "")) (doom-modeline-vspc))))))

  (doom-modeline-def-segment buffer-info
    (concat
     (doom-modeline--buffer-mode-icon)
     (doom-modeline--buffer-state-icon)
     (doom-modeline--buffer-name)))

  (doom-modeline-def-segment buffer-position
    (let* ((active (doom-modeline--active))
           (lc '(line-number-mode
                 (column-number-mode
                  (doom-modeline-column-zero-based "%l:%c" "%l:%C")
                  "%l")
                 (column-number-mode (doom-modeline-column-zero-based ":%c" ":%C"))))
           (face (if active 'mode-line 'mode-line-inactive))
           (mouse-face 'mode-line-highlight)
           (local-map mode-line-column-line-number-mode-map))
      (concat
       ;; Line and column
       (propertize (format-mode-line lc)
                   'face face
                   'help-echo "Buffer position\n\
mouse-1: Display Line and Column Mode Menu"
                   'mouse-face mouse-face
                   'local-map local-map)

       ;; Position
       (cond ((and active
                   (bound-and-true-p nyan-mode)
                   (not doom-modeline--limited-width-p)
                   (>= (window-width) nyan-minimum-window-width))
              (concat
               (doom-modeline-wspc)
               (propertize (nyan-create) 'mouse-face mouse-face)))
             ((and active
                   (bound-and-true-p poke-line-mode)
                   (not doom-modeline--limited-width-p)
                   (>= (window-width) poke-line-minimum-window-width))
              (concat
               (doom-modeline-wspc)
               (propertize (poke-line-create) 'mouse-face mouse-face)))
             ((and active
                   (bound-and-true-p mlscroll-mode)
                   (not doom-modeline--limited-width-p)
                   (>= (window-width) mlscroll-minimum-current-width))
              (concat
               (doom-modeline-wspc)
               (let ((mlscroll-right-align nil))
                 (format-mode-line (mlscroll-mode-line)))))
             ((and active
                   (bound-and-true-p sml-modeline-mode)
                   (not doom-modeline--limited-width-p)
                   (>= (window-width) sml-modeline-len))
              (concat
               (doom-modeline-wspc)
               (propertize (sml-modeline-create) 'mouse-face mouse-face)))
             (t ""))

       ;; Percent position
       (when doom-modeline-percent-position
         (concat
          (doom-modeline-spc)
          (propertize (format-mode-line '("" doom-modeline-percent-position "%%"))
                      'face face
                      'help-echo "Buffer percentage\n\
mouse-1: Display Line and Column Mode Menu"
                      'mouse-face mouse-face
                      'local-map local-map)))
       )))

  (doom-modeline-def-segment selection-info
    (when (and (or mark-active (and (bound-and-true-p evil-local-mode)
                                    (eq evil-state 'visual)))
               (doom-modeline--active))
      (cl-destructuring-bind (beg . end)
          (if (and (bound-and-true-p evil-local-mode) (eq evil-state 'visual))
              (cons evil-visual-beginning evil-visual-end)
            (cons (region-beginning) (region-end)))
        (propertize
         (let ((lines (count-lines beg (min end (point-max)))))
           (concat (cond ((or (bound-and-true-p rectangle-mark-mode)
                              (and (bound-and-true-p evil-visual-selection)
                                   (eq 'block evil-visual-selection)))
                          (let ((cols (abs (- (doom-modeline-column end)
                                              (doom-modeline-column beg)))))
                            (format "%dx%dB" lines cols)))
                         ((and (bound-and-true-p evil-visual-selection)
                               (eq evil-visual-selection 'line))
                          (format "%dL" lines))
                         ((> lines 1)
                          (format "%dC %dL" (- end beg) lines))
                         (t
                          (format "%dC" (- end beg))))
                   (when doom-modeline-enable-word-count
                     (format " %dW" (count-words beg end)))
                   (doom-modeline-wspc)))
         'face 'doom-modeline-highlight))))

  (doom-modeline-def-segment lsp
    (when (and doom-modeline-lsp
               (not doom-modeline--limited-width-p))
      (let ((active (doom-modeline--active))
            (icon (cond ((bound-and-true-p lsp-mode)
                         doom-modeline--lsp)
                        ((bound-and-true-p eglot--managed-mode)
                         doom-modeline--eglot)
                        ((bound-and-true-p citre-mode)
                         doom-modeline--tags))))
        (when icon
          (concat
           (if active
               icon
             (doom-modeline-propertize-icon icon 'mode-line-inactive))
           (doom-modeline-vspc))
          ))))

  (doom-modeline-def-segment misc-info
    (when (and (doom-modeline--active)
               (not doom-modeline--limited-width-p))
      '("" mode-line-misc-info)))

  (doom-modeline-def-segment checker
    (let ((active (doom-modeline--active))
          (seg (cond ((and (bound-and-true-p flymake-mode)
                           (bound-and-true-p flymake--state)) ; only support 26+
                      `(,doom-modeline--flymake-icon . ,doom-modeline--flymake-text))
                     ((bound-and-true-p flycheck-mode)
                      `(,doom-modeline--flycheck-icon . ,doom-modeline--flycheck-text)))))
      (let ((icon (car seg))
            (text (cdr seg)))
        (concat
         (when icon
           (concat
            (if active
                icon
              (doom-modeline-propertize-icon icon 'mode-line-inactive))
            ))
         (when text
           (concat
            (doom-modeline-vspc)
            (if active
                text
              (propertize text 'face 'mode-line-inactive))))
         ))))

  (doom-modeline-def-segment matches
    (let ((meta (concat (doom-modeline--macro-recording)
                        (doom-modeline--anzu)
                        (doom-modeline--phi-search)
                        (doom-modeline--evil-substitute)
                        (doom-modeline--iedit)
                        (doom-modeline--symbol-overlay)
                        (doom-modeline--multiple-cursors))))
      (and (not (equal meta "")) meta)))

  (doom-modeline-def-segment debug
    (when (and (doom-modeline--active)
               (not doom-modeline--limited-width-p))
      (let* ((dap doom-modeline--debug-dap)
             (edebug (doom-modeline--debug-edebug))
             (on-error (doom-modeline--debug-on-error))
             (on-quit (doom-modeline--debug-on-quit))
             (vsep (doom-modeline-vspc)))
        (concat (and dap (concat dap (and (or edebug on-error on-quit) vsep)))
                (and edebug (concat edebug (and (or on-error on-quit) vsep)))
                (and on-error (concat on-error (and on-quit vsep)))
                on-quit))))

  (doom-modeline-def-segment grip
    (when (bound-and-true-p grip-mode)
      (concat
       (doom-modeline-wspc)
       (let ((face (if (doom-modeline--active)
                       (if grip--process
                           (pcase (process-status grip--process)
                             ('run 'doom-modeline-buffer-path)
                             ('exit 'doom-modeline-warning)
                             (_ 'doom-modeline-urgent))
                         'doom-modeline-urgent)
                     'mode-line-inactive)))
         (propertize (doom-modeline-icon 'material "pageview" "🗐" "@"
                                         :face (if doom-modeline-icon
                                                   `(:inherit ,face :weight normal)
                                                 face)
                                         :height 1.2 :v-adjust -0.2)
                     'help-echo (format "Preview on %s
mouse-1: Preview in browser
mouse-2: Stop preview
mouse-3: Restart preview"
                                        (grip--preview-url))
                     'mouse-face 'mode-line-highlight
                     'local-map (let ((map (make-sparse-keymap)))
                                  (define-key map [mode-line mouse-1]
                                    #'grip-browse-preview)
                                  (define-key map [mode-line mouse-2]
                                    #'grip-stop-preview)
                                  (define-key map [mode-line mouse-3]
                                    #'grip-restart-preview)
                                  map)))
       )))

  (doom-modeline-def-segment follow
    (when (bound-and-true-p follow-mode)
      (let* ((windows (follow-all-followers))
             (nwindows (length windows))
             (nfollowing (- (length (memq (selected-window) windows))
                            1)))
        (concat
         (doom-modeline-wspc)
         (propertize (format "Follow %d/%d" (- nwindows nfollowing) nwindows)
                     'face 'doom-modeline-buffer-minor-mode)))))

  (doom-modeline-def-segment vcs
    (let ((active (doom-modeline--active)))
      (when-let ((icon doom-modeline--vcs-icon)
                 (text doom-modeline--vcs-text))
        (concat
         (doom-modeline-wspc)
         (propertize
          (if active
              icon
            (doom-modeline-propertize-icon icon 'mode-line-inactive))
          'mouse-face 'mode-line-highlight
          'help-echo (get-text-property 1 'help-echo vc-mode)
          'local-map (get-text-property 1 'local-map vc-mode))
         (doom-modeline-spc)
         (if active
             text
           (propertize text 'face 'mode-line-inactive)))))
    )

  (doom-modeline-def-segment buffer-encoding
    (when doom-modeline-buffer-encoding
      (let ((face (if (doom-modeline--active) 'mode-line 'mode-line-inactive))
            (mouse-face 'mode-line-highlight))
        (concat
         ;; eol type
         (let ((eol (coding-system-eol-type buffer-file-coding-system)))
           (when (or (eq doom-modeline-buffer-encoding t)
                     (and (eq doom-modeline-buffer-encoding 'nondefault)
                          (not (equal eol doom-modeline-default-eol-type))))
             (propertize
              (pcase eol
                (0 "LF ")
                (1 "CRLF ")
                (2 "CR ")
                (_ ""))
              'face face
              'mouse-face mouse-face
              'help-echo (format "End-of-line style: %s\nmouse-1: Cycle"
                                 (pcase eol
                                   (0 "Unix-style LF")
                                   (1 "DOS-style CRLF")
                                   (2 "Mac-style CR")
                                   (_ "Undecided")))
              'local-map (let ((map (make-sparse-keymap)))
                           (define-key map [mode-line mouse-1] 'mode-line-change-eol)
                           map))))

         ;; coding system
         (let* ((sys (coding-system-plist buffer-file-coding-system))
                (cat (plist-get sys :category))
                (sym (if (memq cat
                               '(coding-category-undecided coding-category-utf-8))
                         'utf-8
                       (plist-get sys :name))))
           (when (or (eq doom-modeline-buffer-encoding t)
                     (and (eq doom-modeline-buffer-encoding 'nondefault)
                          (not (eq cat 'coding-category-undecided))
                          (not (eq sym doom-modeline-default-coding-system))))
             (propertize
              (upcase (symbol-name sym))
              'face face
              'mouse-face mouse-face
              'help-echo 'mode-line-mule-info-help-echo
              'local-map mode-line-coding-system-map)))
         ))))

  (doom-modeline-def-segment major-mode
    (propertize
     (concat
      (propertize (format-mode-line
                   (or (and (boundp 'delighted-modes)
                            (cadr (assq major-mode delighted-modes)))
                       mode-name))
                  'help-echo "Major mode\n\
  mouse-1: Display major mode menu\n\
  mouse-2: Show help for major mode\n\
  mouse-3: Toggle minor modes"
                  'mouse-face 'mode-line-highlight
                  'local-map mode-line-major-mode-keymap)
      (when (and doom-modeline-env-version doom-modeline-env--version)
        (format " %s" doom-modeline-env--version))
      (and (boundp 'text-scale-mode-amount)
           (/= text-scale-mode-amount 0)
           (format
            (if (> text-scale-mode-amount 0)
                " (%+d)"
              " (%-d)")
            text-scale-mode-amount)))
     'face (if (doom-modeline--active)
               'doom-modeline-buffer-major-mode
             'mode-line-inactive)))

  (doom-modeline-def-segment process
    (if (doom-modeline--active)
        mode-line-process
      (propertize (format-mode-line mode-line-process)
                  'face 'mode-line-inactive)))
  )

;; a better order to match the modeline layout
(setq lsp-modeline-code-actions-segments '(icon count))
(add-to-list 'global-mode-string '(t (:eval (lsp-modeline--diagnostics-update-modeline))) 'append)
(add-to-list 'global-mode-string '(t (:eval lsp-modeline--code-actions-string)) 'append)

;; hide the bar by blending it with the modeline
(setq doom-modeline-bar-width 1)
(custom-set-faces!
  '(doom-modeline-bar          :background "#37302f")
  '(doom-modeline-bar-inactive :background "#282828"))

;; remove the leading and trailing spaces to not
;; mess up the spacing of the segments
(setq evil-emacs-state-tag        "<E>"
      evil-insert-state-tag       "<I>"
      evil-motion-state-tag       "<M>"
      evil-normal-state-tag       "<N>"
      evil-operator-state-tag     "<O>"
      evil-replace-state-tag      "<R>"
      evil-visual-char-tag        "<V>"
      evil-visual-block-tag       "<Vb>"
      evil-visual-line-tag        "<Vl>"
      evil-visual-screen-line-tag "<Vs>"
      doom-modeline-modal-icon    nil)

;; misc
(setq doom-modeline-buffer-encoding t
      doom-modeline-checker-simple-format nil
      doom-modeline-irc nil
      all-the-icons-scale-factor 1)

; indentation (2 spaces)
(setq-default indent-tabs-mode        nil
              tab-width               2
              evil-shift-width        2
              c-basic-offset          2
              js-indent-level         2
              js2-basic-offset        2
              js3-indent-level        2
              typescript-indent-level 2
              sh-basic-offset         2
              css-indent-offset       2
              standard-indent         2)

; some hooks call `npm-mode` function which causes an error
; because the `npm-mode` package is disabled
(defun npm-mode nil)

; tree-sitter
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

; prettierd instead of prettier
(after! format-all
  (define-format-all-formatter prettierd
    (:executable "prettierd")
    (:install "yarn global add @fsouza/prettierd")
    (:modes
     (angular-html-mode "angular")
     ((js-mode js2-mode js3-mode)
      (if (and (boundp 'flow-minor-mode)
               (not (null (symbol-value 'flow-minor-mode))))
          "flow"
        "babel"))
     ((js2-jsx-mode jsx-mode rjsx-mode react-mode) "babel")
     ((typescript-mode typescript-tsx-mode) "typescript")
     (json-mode "json")
     (vue-mode "vue")
     (css-mode "css")
     (scss-mode "scss")
     (less-css-mode "less")
     (graphql-mode "graphql")
     ((gfm-mode markdown-mode) "markdown")
     (php-mode "php")
     (solidity-mode "solidity-parse")
     (web-mode
      (let ((ct (symbol-value 'web-mode-content-type))
            (en (symbol-value 'web-mode-engine)))
        (cond ((equal ct "css") "css")
              ((or (equal ct "javascript") (equal ct "jsx"))
               (if (format-all--buffer-extension-p "ts" "tsx")
                   "typescript"
                 "babel"))
              ((equal ct "json") "json")
              ((equal ct "html")
               (cond ((equal en "angular") "angular")
                     ((equal en "vue") "vue")
                     (t nil)))
              (t nil))))
     (yaml-mode "yaml"))
    (:format (format-all--buffer-easy executable (or (buffer-file-name) (buffer-name))))))

; live markdown preview (with livedown)
(defun plankcipher/toggle-livedown ()
  (interactive)
  (if (process-status "emacs-livedown")
      (progn
        (livedown-kill)
        (if (not (process-status "emacs-livedown"))
            (message "stopped livedown")))
    (progn
      (livedown-preview)
      (if (process-status "emacs-livedown")
          (message "started livedown")))
    )
  )

(map! :leader :n "m" #'plankcipher/toggle-livedown)
