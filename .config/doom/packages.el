;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! tree-sitter)
(package! tree-sitter-langs)
(package! livedown
  :recipe (:host github :repo "PlankCipher/emacs-livedown"
                 :files ("livedown.el")))

(package! evil-escape           :disable t)
(package! evil-snipe            :disable t)
(package! evil-textobj-anyblock :disable t)
(package! evil-quick-diff       :disable t)
(package! evil-lion             :disable t)
(package! evil-indent-plus      :disable t)
(package! evil-easymotion       :disable t)
(package! wgrep                 :disable t)
(package! auto-yasnippet        :disable t)
(package! code-review           :disable t)
(package! demangle-mode         :disable t)
(package! dired-git-info        :disable t)
(package! dired-rsync           :disable t)
(package! disaster              :disable t)
(package! npm-mode              :disable t)
(package! nodejs-repl           :disable t)
(package! magit-todos           :disable t)
(package! magit-gitflow         :disable t)
(package! highlight-numbers     :disable t)
(package! exato                 :disable t)
(package! saveplace             :disable t)
