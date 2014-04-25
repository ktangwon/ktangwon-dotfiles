;;; LaTeX

;; Try the MacTeX distribution:
;;   http://www.tug.org/mactex/

;; (require 'tex-site)


(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; (setq TeX-view-program-list '(("Okular" "okular --unique %u") ("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %q")))


(eval-after-load "tex"
  '(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex %(mode)%' %t" TeX-run-TeX nil
     (latex-mode doctex-mode))))

(setq TeX-view-program-list '(("Preview" "open %o")))
(setq TeX-view-program-selection '((output-pdf "Preview")))


;;(setq TeX-command-list '(("XeLaTeX_SyncteX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run XeLaTeX")))

(setq TeX-PDF-mode t)


;;(add-hook 'LaTeX-mode-hook (setq TeX-PDF-mode t)) ;turn on pdf-mode.  AUCTeX
                                                   ;will call pdflatex to
                                                   ;compile instead of latex.
