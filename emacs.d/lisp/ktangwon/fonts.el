;;; Fonts

;; From: http://community.schemewiki.org/cgi-bin/scheme.cgi?Emacs
;;(and window-system
;;     (create-fontset-from-fontset-spec
;;      (concat
;;       "-apple-monaco-medium-r-normal--18-*-*-*-*-*-fontset-monaco,"
;;      "ascii:-apple-monaco-medium-r-normal--18-100-*-*-m-100-mac-roman"))
;;     )
;;
(and window-system
	(set-default-font "Apple Monaco-18")
;;	(set-default-font "Apple Menlo-18")
	)

;; To change a font size globally:
;; (set-face-attribute 'default nil :height 360)
;; (set-face-attribute 'default nil :height 240)
;; (set-face-attribute 'default nil :height 160)
;; (set-face-attribute 'default nil :height 120)

;; To change the font size interactively per buffer:
;; Up:    C-x C-+, C-x C-=
;; Down:  C-x C--
;; Reset: C-x C-0
