;; this line automatically causes all files with the .gp extension to
;; be loaded into gnuplot mode
(setq auto-mode-alist (append '(("\\.gnuplot$" . gnuplot-mode)) auto-mode-alist))
