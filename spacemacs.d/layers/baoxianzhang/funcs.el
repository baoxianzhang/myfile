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
;; https://emacs-china.org/t/topic/2119/22?page=2
;; https://emacs-china.org/t/topic/2119/14
;; %%(diary-chinese-anniversary 7 29 1988) LEO is %d years old
;; need cal-china, otherwise occur bad sexp problem
;; below my-diary-chinese-anniversary1 and 2 is not work, show bad sexp problem
(defun my-diary-chinese-anniversary (lunar-month lunar-day &optional year mark)
  (let* ((ddate (diary-make-date lunar-month lunar-day year))
         (dd (calendar-extract-day ddate))
         (mm (calendar-extract-month ddate))
         (yy (calendar-extract-year ddate))
         (a-date (calendar-absolute-from-gregorian date))
         (c-date (calendar-chinese-from-absolute a-date))
         (mm2 (nth 2 c-date))
         (dd2 (nth 3 c-date))
         (y (calendar-extract-year date))
         (diff (if year (- y year) 100)))
    (and (> diff 0) (= mm mm2) (= dd dd2)
         (cons mark (format entry diff (diary-ordinal-suffix diff))))))

;; ;; diary for chinese birthday
;; (defun my-diary-chinese-anniversary1 (lunar-month lunar-day &optional year mark)
;;   (if year
;;       (let* ((d-date (diary-make-date lunar-month lunar-day year))
;;              (a-date (calendar-absolute-from-gregorian d-date))
;;              (c-date (calendar-chinese-from-absolute a-date))
;;              (date a-date)
;;              (cycle (car c-date))
;;              (yy (cadr c-date))
;;              (y (+ (* 100 cycle) yy)))
;;         (diary-chinese-anniversary lunar-month lunar-day y mark))
;;     (diary-chinese-anniversary lunar-month lunar-day year mark)))


;; ;; diary for chinese birthday
;; ;; 我这里calendar-date-style默认是’iso，会出现 Bad sexp at line 2错误，在let里将calendar-date-style改成american后正常。
;; (defun my-diary-chinese-anniversary2 (lunar-month lunar-day &optional year mark)
;;   (if year
;;       (let* ((calendar-date-style 'american)
;;              (d-date (diary-make-date lunar-month lunar-day year))
;;              (a-date (calendar-absolute-from-gregorian d-date))
;;              (c-date (calendar-chinese-from-absolute a-date))
;;              (date a-date)
;;              (cycle (car c-date))
;;              (yy (cadr c-date))
;;              (y (+ (* 100 cycle) yy)))
;;         (diary-chinese-anniversary lunar-month lunar-day y mark))
;;     (diary-chinese-anniversary lunar-month lunar-day year mark)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use valgrind in the emacs shell
(defun valgrind()
  (interactive)
  (compilation-minor-mode)
  (define-key compilation-minor-mode-map (kbd "") 'comint-send-input)
  (define-key compilation-minor-mode-map (kbd "S-") 'comint-goto-error)
  (add-hook 'shell-mode-hook 'valgrind)
)



;;;;;;;;;;;;;;;;;;;org-roam ;;;;;;;;;;;;;;;;;;;;;;;
(defun org-capture-slipbox ()
  (interactive)
  (org-roam-capture nil "s"))

;; add with-eval-after-load https://github.com/jethrokuan/org-roam-guide/issues/2#issuecomment-1240626498
(with-eval-after-load 'org-roam
  (cl-defmethod org-roam-node-type ((node org-roam-node))
    "Return the TYPE of NODE."
    (condition-case nil
        (file-name-nondirectory
         (directory-file-name
          (file-name-directory
           (file-relative-name (org-roam-node-file node) org-roam-directory))))
      (error "")))
  )
(defun org-roam-node-from-cite (keys-entries)
  (interactive (list (citar-select-ref :multiple nil :rebuild-cache t)))
  (let ((title (citar--format-entry-no-widths (cdr keys-entries)
                                              "${author editor} :: ${title}")))
    (org-roam-capture-templates
                       '(("r" "reference" plain "%?" :if-new
                          (file+head "reference/${citekey}.org"
                                     ":PROPERTIES:
:ROAM_REFS: [cite:@${citekey}]
:END:
,#+title: ${title}\n")
                          :immediate-finish t
                          :unnarrowed t))
                       :info (list :citekey (car keys-entries))
                       :node (org-roam-node-create :title title)
                       :props '(:finalize find-file))))

(defun tag-new-node-as-draft ()
  (org-roam-tag-add '("draft")))

