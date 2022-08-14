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

;; self org config
(setq org-agenda-window-setup (quote current-window) )
(setq org-columns-default-format "%40ITEM(Task) %Effort(EE){:} %CLOCKSUM(Time Spent) %SCHEDULED(Scheduled) %DEADLINE(Deadline)")


;; Files
(setq org-directory "~/bxgithub/org")
(setq org-agenda-files (directory-files-recursively "~/bxgithub/org/" "\.org$") )
(setq org-persp-startup-with-agenda "a")
(setq org-agenda-start-on-weekday 1)
(setq org-agenda-skip-unavailable-files t)

;; TODO
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "HOLD(h)" "|" "DONE(d)")))
(add-hook 'org-after-todo-state-change-hook #'log-todo-next-creation-date)

(setq org-todo-keyword-faces '(("TODO" . org-warning)
                         ("NEXT" . "#E35DBF")
                         ("HOLD" . (:foreground "white" :background "#4d4d4d" :weight bold))
                         ("DONE" . "#008080")
                         )
      )


;; Capture
(setq org-capture-templates
      `(("i" "Inbox" entry  (file "~/bxgithub/org/inbox.org")
        ,(concat "* TODO %?\n"
                 "/Entered on/ %U"))
        ("m" "Meeting" entry  (file+headline "~/bxgithub/org/agenda.org" "Future")
        ,(concat "* %? :meeting:\n"
                 "<%<%Y-%m-%d %a %H:00>>"))
        ("n" "Note" entry  (file "~/bxgithub/org/notes.org")
        ,(concat "* Note (%a)\n"
                 "/Entered on/ %U\n" "\n" "%?"))
        )
      )

;; Use full window for org-capture
(add-hook 'org-capture-mode-hook 'delete-other-windows)

;; Refile
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-targets
      '(("projects.org" :regexp . "\\(?:\\(?:Note\\|Task\\)s\\)")))

;; Agenda
(setq org-agenda-custom-commands
      '(("g" "Get Things Done (GTD)"
         ((agenda ""
                  ((org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'deadline))
                   (org-deadline-warning-days 0)))
          (todo "NEXT"
                ((org-agenda-skip-function
                  '(org-agenda-skip-entry-if 'deadline))
                 (org-agenda-prefix-format "  %i %-12:c [%e] ")
                 (org-agenda-overriding-header "\nTasks\n")))
          (agenda nil
                  ((org-agenda-entry-types '(:deadline))
                   (org-agenda-format-date "")
                   (org-deadline-warning-days 7)
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'notregexp "\\* NEXT"))
                   (org-agenda-overriding-header "\nDeadlines")))
          (tags-todo "inbox"
                     ((org-agenda-prefix-format "  %?-12t% s")
                      (org-agenda-overriding-header "\nInbox\n")))
          (tags "CLOSED>=\"<today>\""
                ((org-agenda-overriding-header "\nCompleted today\n")))))))


(setq org-log-done 'time)

;; Add it after refile
(advice-add 'org-refile :after
	          (lambda (&rest _)
	            (gtd-save-org-buffers)))
