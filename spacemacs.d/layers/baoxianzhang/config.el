;;; config.el --- baoxianzhang Layer packages File for Spacemacs
;;
;; Copyright (c) 2016 baoxianzhang
;;
;; Author: baoxianzhang <baoxianzhit@gmail.com>
;; URL: https://github.com/baoxianzhang/myfile/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; This file configure the layer like declaring layer variables default values and setup some other variables related to the layer.

;; This file is loaded after funcs.el.

;; (global-hungry-delete-mode t)
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))
;;; In order to get namespace indentation correct, .h files must be opened in C++ mode
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))
;;; roslaunch highlighting
(add-to-list 'auto-mode-alist '("\\.launch$" . xml-mode))
;;; Auto LF in org-mode
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;; Auto indent 2 in shell-mode
(setq sh-basic-offset 2)
(setq sh-indentation 2)

;; Disable the syntax-checking in lsp
;; Ref: https://github.com/syl20bnr/spacemacs/issues/13414
(when (configuration-layer/layer-used-p 'lsp)
  (add-hook 'c++-mode-hook 'custom/disable-lsp-diagnostics))

(with-eval-after-load 'org-agenda
  (require 'org-projectile)
  (mapcar '(lambda (file)
             (when (file-exists-p file)
               (push file org-agenda-files)))
          (org-projectile-todo-files)))



;; https://emacs.stackexchange.com/questions/58489/how-do-i-debug-package-cl-is-deprecated

(setq byte-compile-warnings '(not cl-functions))
