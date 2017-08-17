;;; funcs.el --- baoxianzhang Layer packages File for Spacemacs
;;
;; Copyright (c) 2016 baoxianzhang
;;
;; Author: baoxianzhang <baoxianzhit@gmail.com>
;; URL: https://github.com/baoxianzhang/myfile/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

;; https://emacs-china.org/t/ranger-golden-ratio/964/2
(defun my-ranger ()
  (interactive)
  (if golden-ratio-mode
      (progn
        (golden-ratio-mode -1)
        (ranger)
        (setq golden-ratio-previous-enable t))
    (progn
      (ranger)
      (setq golden-ratio-previous-enable nil))))

(defun my-quit-ranger ()
  (interactive)
  (if golden-ratio-previous-enable
      (progn
        (ranger-close)
        (golden-ratio-mode 1))
    (ranger-close)))

(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))


(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun run-ros-clang-format ()
  "Runs clang-format on cpp, h files in Projects/ and reverts buffers"
  (interactive)
  (and
   (string-match "/Projects/.*\\.\\(h\\|cpp\\)$" buffer-file-name)
   (save-some-buffers 'no-confirm)
   (shell-command (concat "clang-format-3.8 -style=file -i " buffer-file-name))
   (message (concat "Saved and ran clang-format on " buffer-file-name))
   (revert-buffer t t t)
   )
  )

(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))











;; It contains all the defined functions used in the layer.

;; This file is loaded after packages.el and before config.el.

;; It is good practice to guard the definition of functions to make sure a package is actually used. For instance:

;; (when (configuration-layer/package-usedp 'my-package)
;;   (defun spacemacs/my-package-enable () ...)
;;   (defun spacemacs/my-package-disable () ...))
;; By guarding these functions we avoid to define them in case the package `my-package` is not used.
