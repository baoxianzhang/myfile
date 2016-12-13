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












;; It contains all the defined functions used in the layer.

;; This file is loaded after packages.el and before config.el.

;; It is good practice to guard the definition of functions to make sure a package is actually used. For instance:

;; (when (configuration-layer/package-usedp 'my-package)
;;   (defun spacemacs/my-package-enable () ...)
;;   (defun spacemacs/my-package-disable () ...))
;; By guarding these functions we avoid to define them in case the package `my-package` is not used.
