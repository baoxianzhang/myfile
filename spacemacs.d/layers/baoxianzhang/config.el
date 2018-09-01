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
(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))
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

(add-hook 'doc-view-mode-hook 'auto-revert-mode)

;; (setq ycmd-server-command (list "python" (file-truename "~/code/ycmd/ycmd")))
;; (add-hook 'c++-mode-hook 'ycmd-mode)

;; (defun my-flymd-browser-function (url)
;;   (let ((browse-url-browser-function 'browse-url-firefox))
;;     (browse-url url)))
;; (setq flymd-browser-open-function 'my-flymd-browser-function)


;; (add-to-list 'auto-mode-alist '("\\.prototxt$" . protobuf-mode))

(with-eval-after-load 'anaconda-mode
  (remove-hook 'anaconda-mode-response-read-fail-hook
               'anaconda-mode-show-unreadable-response))

;; gtags

;; Please note `file-truename' must be used!
;; (setenv "GTAGSLIBPATH" (concat "ros"
;;                                ":"
;;                                "eigen"
;;                                ":"
;;                                "pcl"
;;                                ":"
;;                                "opencv"
;;                                ;; (file-truename "~/proj2")
;;                                ;; ":"
;;                                ;; (file-truename "~/proj1")
;;                                ))
;; (setenv "MAKEOBJDIRPREFIX" (file-truename "~/code/gtags_obj/"))
;; (setq company-backends '((company-dabbrev-code company-gtags)))



(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)
;; Bind clang-format-buffer to tab on the c++-mode only:
;; (add-hook 'c++-mode-hook 'clang-format-bindings)
;; (defun clang-format-bindings ()
;;   (define-key c++-mode-map [tab] 'clang-format-buffer))

;; Bind clang-format-region to C-M-tab in all modes:
;; (spacemacs/set-leader-keys "cr" 'clang-format-region)
;; Bind clang-format-buffer to tab on the c++-mode only:

;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-checker 'c/c++-clang)
;;                            (setq flycheck-gcc-language-standard "c++11")
;;                            (setq flycheck-clang-language-standard "c++11")
;;                            ;; (setq flycheck-gcc-includes "")
;;                            ;; (setq flycheck-clang-includes "")
;;                            (setq flycheck-clang-includes "")

;;                            (add-to-list 'company-c-headers-path-system "/usr/include/c++/5/" )))

;; http://www.flycheck.org/en/27/_downloads/flycheck.html
(add-hook 'c++-mode-hook (lambda ()
                           (setq flycheck-checker 'c/c++-gcc)
                           ;; (setq flycheck-checker 'c/c++-clang)
                           (setq flycheck-gcc-language-standard "c++11")
                           ))

;; https://github.com/swarm-robotics/fordyca/blob/f8a26813f4e05a4ed96a1f174c1a59bf8ab785da/.dir-locals.el
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-gcc-include-path
                           (list (expand-file-name "~/Projects/catkin_ws/devel/include") ;; this for the ~ dir
                           "/usr/local/include/pcl-1.8/"
                           "/usr/include/eigen3"
                           "/opt/ros/kinetic/include"
                           "./include"
                           "../include"
                           "./"
                           (concat
                            (projectile-project-root)
                            "include")
                           )
                           )))

;; (add-hook 'c++-mode-hook (lambda ()
;;                            (setq flycheck-gcc-include-path
;;                                  (mapcar (lambda (p) (expand-file-name p (projectile-project-root)) you-include-file)
;; (add-to-list 'company-backends 'company-c-headers)

;; https://emacs.stackexchange.com/questions/13065/automatically-add-project-directory-to-flycheck-clang-gcc-include-path
;; (defun setup-flycheck-gcc-project-path ()
;;   (let ((root (ignore-errors (projectile-project-root))))
;;     (when root
;;       (add-to-list
;;        (make-variable-buffer-local 'flycheck-gcc-include-path)
;;        root)))
;; 
;; (add-hook 'c++-mode-hook 'setup-flycheck-gcc-project-path)

;; https://github.com/flycheck/flycheck/issues/659
;; (add-hook 'c++-mode-hook (lambda () (set flycheck-gcc-include-path (mapcar (lambda (p) (expand-file-name p (projectile-project-root)) my-relative-include-paths)
;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-include-path (mapcar (lambda (p) (expand-file-name p (projectile-project-root)) "./include" ))) ))

;; ycmd
;; (require 'ycmd)
;; (add-hook 'c++-mode-hook 'ycmd-mode)
;;
;; (require 'company-ycmd)
;; (company-ycmd-setup)

;; (setq ycmd-server-command (list "python" "-u" (file-truename "~/code/ycmd/ycmd/")))
;; (setq ycmd-global-config '("~/bxgithub/myfile/ycm_extra_conf.py"))
;; (setq ycmd-extra-conf-whitelist '("~/code/*"))
;; (setq ycmd-force-semantic-completion t)


;; (add-hook 'c-mode-hook 'ycmd-mode)
;; (add-hook 'c++-mode-hook 'ycmd-mode)
;; (add-hook 'python-mode-hook 'ycmd-mode)
