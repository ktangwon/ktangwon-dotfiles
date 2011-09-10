;; load reftex

(require 'reftex)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq bib-cite-use-reftex-view-crossref t)
(add-hook 'LaTeX-mode-hook (lambda () (bib-cite-minor-mode t)))