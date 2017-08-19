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

;; (setq configuration-layer--elpa-archives
;;      '(("melpa-cn" . "https://elpa.zilongshanren.com/melpa/")
;;        ("org-cn"   . "https://elpa.zilongshanren.com/org/")
;;        ("gnu-cn"   . "https://elpa.zilongshanren.com/gnu/")))
;; https://github.com/syl20bnr/spacemacs/issues/2705



;; This file configure the layer like declaring layer variables default values and setup some other variables related to the layer.

;; This file is loaded after funcs.el.

;; (global-hungry-delete-mode t)
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(setq hide-ifdef-initially t)
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq hide-ifdef-shadow t)
            (setq hide-ifdef-mode t)
            (hide-ifdefs)
            ))

(with-eval-after-load 'ranger
  (progn
    (define-key ranger-normal-mode-map (kbd "q") 'my-quit-ranger)))

(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))

(setq helm-dash-browser-func 'eww)

(add-hook 'c++-mode-hook (lambda ()
                           (electric-indent-local-mode -1)))


;; (defconst my-cc-style
;;   '("gnu"
;;     (c-offsets-alist . ((innamespace . [0])))))

;; (c-add-style "my-cc-style" my-cc-style)

(setq org-agenda-files (list "~/bxgithub/myfile/spacemacs.d/org/gtd.org"
                             "~/bxgithub/myfile/spacemacs.d/org/work.org"
                             ))
;; org-mode 自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines t)))


 ;; C and C++ style
(setq c-default-style "linux"
      c-basic-offset 4)
;; (setq c-default-style '("linux") )
;; (setq c-basic-offset 4)
;; (setq tab-width 4)

  ;; (setq org-capture-templates
  ;;       '(("t" "Todo" entry (file+headline "~/bxgithub/myfile/spacemacs.d/org/gtd.org" "工作安排")
  ;;          "* TODO [#B] %?\n  %i\n"
  ;;          :empty-lines 1)
  ;;         ))



  ;; (require 'org-octopress)
  ;; (setq org-octopress-directory-top       "~/bxgithub/myHexoBlog/source")
  ;; (setq org-octopress-directory-posts     "~/bxgithub/myHexoBlog/source/_posts")
  ;; (setq org-octopress-directory-org-top   "~/bxgithub/myHexoBlog/source")
  ;; (setq org-octopress-directory-org-posts "~/bxgithub/myHexoBlog/source/blog")
  ;; (setq org-octopress-setup-file          "~/bxgithub/myHexoBlog/setupfile.org")



  ;; ;; for ditaa
  ;; (setq org-ditaa-jar-path "~/bxgithub/myfile/spacemacs.d/ditaa.jar")

  ;; (org-babel-do-load-languages
  ;;  'org-babel-load-languages
  ;;  '(;; other Babel languages
  ;;    (ditaa . t)
  ;;    ;; (plantuml . t)
  ;;    ;; (dot . t)
  ;;    (sh . t)
  ;;    (python . t)
  ;;    ;; (R . t)
  ;;    ;; (plantuml . t)
  ;;    ;; (dot . t)
  ;;    (C . t)
  ;;    (org . t)
  ;;    (latex . t)
  ;;    ))

  ;; (add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)
(defun ROS-c-mode-hook()
  (setq c-basic-offset 2)
  (setq indent-tabs-mode nil)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'innamespace 0)
  (c-set-offset 'case-label '+)
  (c-set-offset 'statement-case-open 0))
(add-hook 'c-mode-common-hook 'ROS-c-mode-hook)

;;; In order to get namespace indentation correct, .h files must be opened in C++ mode
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
;;; roslaunch highlighting
(add-to-list 'auto-mode-alist '("\\.launch$" . xml-mode))
;;; Auto LF in org-mode
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;; Auto indent 2 in shell-mode
;; (add-hook 'shell-mode-hook (lambda () (setq sh-basic-offset 2)))
;; (add-hook 'shell-mode-hook (lambda () (setq sh-indentation 2)))
;; '(sh-basic-offset 2)
;; '(sh-indentation 2)
;; '(smie-indent-basic 2)
(setq sh-basic-offset 2)
(setq sh-indentation 2)





