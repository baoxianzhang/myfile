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

(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite" "yaml" "xml")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(defun custom/disable-lsp-diagnostics ()
  (setq-local lsp-diagnostic-package :none)
  (setq-local lsp-ui-doc-enable nil))

;; It contains all the defined functions used in the layer.

;; This file is loaded after packages.el and before config.el.

;; It is good practice to guard the definition of functions to make sure a package is actually used. For instance:

;; (when (configuration-layer/package-usedp 'my-package)
;;   (defun spacemacs/my-package-enable () ...)
;;   (defun spacemacs/my-package-disable () ...))
;; By guarding these functions we avoid to define them in case the package `my-package` is not used.

(defun delete-carrage-returns ()
  (interactive)
  (save-excursion
    (goto-char 0)
    (while (search-forward"\
" nil :noerror)
      (replace-match""))))


(defun org-capture-inbox ()
  (interactive)
  (call-interactively 'org-store-link)
  (org-capture nil "i"))

(defun org-capture-mail ()
  (interactive)
  (call-interactively 'org-store-link)
  (org-capture nil "@"))

(defun log-todo-next-creation-date (&rest ignore)
  "Log NEXT creation time in the property drawer under the key 'ACTIVATED'"
  (when (and (string= (org-get-todo-state) "NEXT")
             (not (org-entry-get nil "ACTIVATED")))
    (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d]"))))


;; Save the corresponding buffers
(defun gtd-save-org-buffers ()
  "Save `org-agenda-files' buffers without user confirmation.
See also `org-save-all-org-buffers'"
  (interactive)
  (message "Saving org-agenda-files buffers...")
  (save-some-buffers t (lambda ()
			                   (when (member (buffer-file-name) org-agenda-files)
			                     t)))
  (message "Saving org-agenda-files buffers... done"))


;; Save the corresponding buffers
(defun open-self-layers-file()
  "Open the layers.el file"
  (interactive)
  (message "open self layer file ...")
  (find-file "~/bxgithub/myfile/spacemacs.d/layers/baoxianzhang/layers.el")
  (message "Done"))

;; diary for chinese birthday
;; https://emacs-china.org/t/topic/2119/14
;; %%(diary-chinese-anniversary 7 29 1988) LEO is %d years old
;; (defun my-diary-chinese-anniversary (lunar-month lunar-day &optional year mark)
;;   (let* ((ddate (diary-make-date lunar-month lunar-day year))
;;          (dd (calendar-extract-day ddate))
;;          (mm (calendar-extract-month ddate))
;;          (yy (calendar-extract-year ddate))
;;          (a-date (calendar-absolute-from-gregorian date))
;;          (c-date (calendar-chinese-from-absolute a-date))
;;          (mm2 (nth 2 c-date))
;;          (dd2 (nth 3 c-date))
;;          (y (calendar-extract-year date))
;;          (diff (if year (- y year) 100)))
;;     (and (> diff 0) (= mm mm2) (= dd dd2)
;;          (cons mark (format entry diff (diary-ordinal-suffix diff))))))
