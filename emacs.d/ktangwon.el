(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/vendor/auctex")

(setq custom-file "~/.emacs.d/ktangwon/custom.el")
(load custom-file 'noerror)

(load "ktangwon/env")
(load "ktangwon/global")
(load "ktangwon/defuns")
(load "auctex.el" nil t t)
(load "ktangwon/auctex")
(load "ktangwon/bindings")
(load "ktangwon/tabs")
(load "ktangwon/disabled")
(load "ktangwon/fonts")
(load "ktangwon/utf-8")
(load "ktangwon/scratch")
(load "ktangwon/grep")
(load "ktangwon/diff")
(load "ktangwon/ido")
(load "ktangwon/dired")
(load "ktangwon/recentf")
(load "ktangwon/rectangle")
(load "ktangwon/org")
(load "ktangwon/zoom")
(load "ktangwon/flymake")
(load "ktangwon/javascript")
(load "ktangwon/ri-emacs")
(load "ktangwon/mac")
(load "ktangwon/server-mode")
(load "ktangwon/shell-mode")
(load "ktangwon/private" 'noerror)

;; (load "ktangwon/hl-line")
;; (load "ktangwon/iswitchb")

(vendor 'color-theme)
(vendor 'ruby-mode)
(vendor 'rinari)
(vendor 'textmate)
(vendor 'maxframe)
(vendor 'filladapt)
(vendor 'coffee-mode)
(vendor 'haml-mode)
(vendor 'sass-mode)
(vendor 'htmlize)
(vendor 'full-ack      'ack 'ack-same 'ack-find-same-file 'ack-find-file 'ack-interactive)
(vendor 'cdargs        'cv 'cdargs)
(vendor 'magit         'magit-status)
(vendor 'psvn          'svn-status)
(vendor 'js2-mode      'js2-mode)
(vendor 'markdown-mode 'markdown-mode)
(vendor 'textile-mode  'textile-mode)
(vendor 'csv-mode      'csv-mode)
(vendor 'yaml-mode     'yaml-mode)
(vendor 'inf-ruby      'inf-ruby)
(vendor 'rcodetools    'xmp)
(vendor 'yasnippet)
(vendor 'jekyll)
(vendor 'lua-mode      'lua-mode)
(vendor 'feature-mode)
(vendor 'mode-line-bell)
(vendor 'revbufs       'revbufs)
;; (vendor 'auctex        'tex-site)
;; (vendor 'ruby-electric 'ruby-electric-mode)

