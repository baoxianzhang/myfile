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

(add-to-list 'auto-mode-alist '("/BUILD\\(\\..*\\)?\\'" . bazel-mode))
(add-to-list 'auto-mode-alist '("/WORKSPACE\\'" . bazel-mode))
(add-to-list 'auto-mode-alist '("\\.\\(BUILD\\|WORKSPACE\\|bzl\\)\\'" . bazel-mode))
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
(make-directory "~/bxgithub/gtd" t)
(setq org-directory "~/bxgithub/gtd")
(setq org-agenda-files (directory-files-recursively "~/bxgithub/gtd/" "\.org$") )
(setq org-persp-startup-with-agenda "a")
(setq org-agenda-start-on-weekday 1)
(setq org-agenda-skip-unavailable-files t)

;; TODO
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")))

(setq org-todo-keyword-faces '(("TODO" . org-warning)
                         ("NEXT" . "#E35DBF")
                         ("DONE" . "#008080")
                         ))

;; Capture
(setq org-capture-templates
      `(("i" "Inbox" entry  (file "~/bxgithub/gtd/inbox.org")
        ,(concat "* TODO %?\n"
                 "Entered on %U"))
        ("m" "Meeting" entry  (file+headline "~/bxgithub/gtd/agenda.org" "Future")
        ,(concat "* %? :meeting:\n"
                 "<%<%Y-%m-%d %a %H:00>>"))
        ("n" "Note" entry  (file "~/bxgithub/gtd/notes.org")
        ,(concat "* Note (%a)\n"
                 "Entered on %U\n" "\n" "%?"))
        )
      )


;; Use full window for org-capture
;; (add-hook 'org-capture-mode-hook 'delete-other-windows)
(add-hook 'org-after-todo-state-change-hook #'log-todo-next-creation-date)

;; Refile
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-targets
      '(("project.org" :regexp . "\\(?:\\(?:Note\\|Task\\)\\)")))

;; Agenda
(setq org-agenda-custom-commands
      '(("g" "Get Things Done (GTD)"
         ((agenda ""
                  ;; (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline))
                  ((org-deadline-warning-days 7)
                   ))
          (todo "NEXT"
                (
                 ;; (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline))
                 (org-agenda-prefix-format "  %i %-12:c [%e] ")
                 (org-agenda-overriding-header "Tasks")))
          (tags-todo "inbox"
                     ((org-agenda-prefix-format "  %?-12t% s")
                      (org-agenda-overriding-header "Inbox")))
          (tags "CLOSED>=\"<today>\""
                ((org-agenda-overriding-header "Completed today")))))))

`

(setq org-log-done 'time)

;; Add it after refile
(advice-add 'org-refile :after
	          (lambda (&rest _)
	            (gtd-save-org-buffers)))

(setq bibtex-completion-bibliography '("~/bxgithub/roam/org/biblio.bib")
      bibtex-completion-library-path "~/bxgithub/roam/org/pdf/"
      bibtex-completion-notes-path "~/bxgithub/roam/org/pdf/notes.org")
(setq org-ref-open-pdf-function
      (lambda (fpath)
        (start-process "zathura" "*helm-bibtex-zathura*" "/usr/bin/zathura" fpath)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;org-roam;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-enable-org-brain-support t)
;; (setq org-brain-path "~/bxgithub/org/org_brain/")
(setq org-enable-roam-support t)
(setq org-enable-roam-server t)
(setq org-enable-roam-ui t)
(setq org-enable-roam-protocol t)
(make-directory "~/bxgithub/roam/" t)
(setq org-roam-directory "~/bxgithub/roam/org")
(setq org-fc-directories '("~/bxgithub/roam/") )
(setq org-ref-default-bibliography '("~/bxgithub/roam/org/biblio.bib") )
(setq org-ref-pdf-directory "~/bxgithub/roam/org/pdf/" )
(setq org-roam-directory (file-truename "~/bxgithub/roam/org/")
      ;; org-roam-database-connector 'sqlite-builtin
      ;; org-roam-db-gc-threshold most-positive-fixnum
      ;; org-id-link-to-org-use-id t
      )

(setq org-roam-capture-templates
      '(("m" "main" plain
         "%?"
         :if-new (file+head "main/${slug}.org"
                            "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("r" "reference" plain "%?"
         :if-new
         (file+head "reference/${slug}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("a" "article" plain "%?"
         :if-new
         (file+head "articles/${slug}.org" "#+title: ${title}\n#+filetags: :article:\n")
         :immediate-finish t
         :unnarrowed t)
        ("s" "slipbox" plain " %?\n"
         :if-new
         (file "inbox.org")
         :immediate-finish t
         :unnarrowed t)
        )
      )






(setq org-roam-node-display-template
        (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))

(add-hook 'org-roam-capture-new-node-hook #'tag-new-node-as-draft)


;;;;;;;;;;;;;;;;;;;;;;;;;Chinese calendar celestial stem;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq chinese-calendar-celestial-stem
      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"]
      chinese-calendar-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])


;;;;;;;; coding-systems ;;;;;;;;;;;;;;;;;;;;;
;; https://stackoverflow.com/questions/14031724/how-to-make-emacs-accept-utf-8-uppercase-encoding
(define-coding-system-alias 'UTF-8 'utf-8)
;; (set-language-environment "UTF-8")
;; (set-default-coding-systems 'utf-8-with-signature)
;; (set-default-coding-systems 'utf-8)

;; (set-keyboard-coding-system 'utf-8-unix)

;; do this especially on Windows, else python output problem
;; (set-terminal-coding-system 'utf-8-unix)


(setq-default google-translate-default-target-language "zh-CN")



