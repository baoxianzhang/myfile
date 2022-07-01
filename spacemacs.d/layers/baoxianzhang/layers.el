;;; layers.el --- Spacemacs Layer layers File
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(configuration-layer/declare-layers
 '(
   ;; ----------------------------------------------------------------
   ;; Example of useful layers you may want to use right away.
   ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
   ;; `M-m f e R' (Emacs style) to install them.
   ;; ----------------------------------------------------------------
   auto-completion
   better-defaults
   emacs-lisp
   git
   helm
   (markdown :variables
             markdown-live-preview-engine 'vmd ;; sudo npm install -g vmd
             )
   eww
   multiple-cursors
   (chinese :variables
            chinese-enable-youdao-dict t
            chinese-enable-avy-pinyin t
            )
   (org :variables
        org-todo-dependencies-strategy 'naive-auto
        org-enable-notifications t
        org-start-notification-daemon-on-startup t
        org-enable-github-support t ;; for github flavored markdown
        org-enable-bootstrap-support t
        org-enable-reveal-js-support t
        org-enable-hugo-support t
        org-enable-trello-support t
        spaceline-org-clock-p t
        org-enable-sticky-header t
        org-enable-valign t
        org-enable-appear-support t
        org-enable-transclusion-support t
        org-enable-verb-support t
        org-enable-asciidoc-support t

        ;; contacts
        org-enable-org-contacts-support t
        org-contacts-files '("~/bxgithub/org/contacts.org")

        ;; journal
        org-enable-org-journal-support t
        org-journal-dir "~/bxgithub/org/journal/"
        org-journal-file-format "%Y-%m-%d"
        org-journal-date-prefix "#+TITLE: "
        org-journal-date-format "%A, %B %d %Y"
        org-journal-time-prefix "* "
        org-journal-time-format ""
        org-journal-enable-agenda-integration t

        ;; TODO add absolute path
        org-projectile-file "TODOs.org"

        org-enable-org-brain-support t
        org-brain-path "~/bxgithub/org/org_brain/"
        org-enable-roam-support t
        org-enable-roam-server t
        org-enable-roam-protocal t
        org-roam-directory "~/bxgithub/org/org_roam/"
        org-fc-directories '("~/bxgithub/org/org_roam/")
        org-ref-default-bibliography '("~/bxgithub/org/org_roam/papers/references.bib")
        org-ref-pdf-directory "~/bxgithub/org/org_roam/papers/pdfs/"

        org-agenda-window-setup (quote current-window)
        ;; To add all org files in a repository to the agenda
        org-agenda-files (directory-files-recursively "~/bxgithub/org/" "\.org$")
        org-persp-startup-with-agenda "a"

        ;; Start agenda on current day instead of Monday
        org-agenda-start-on-weekday nil
        org-todo-keywords
        '((sequence "IDEA(i)" "TODO(t)" "PROGRESS(p)" "REVIEW(r)" "|" "DONE(d)" )
          )
        org-todo-keyword-faces '(("TODO" . org-warning)
                                 ("PROGRESS" . "#E35DBF")
                                 ("CANCELED" . (:foreground "white" :background "#4d4d4d" :weight bold))
                                 ("REVIEW" . "pink")
                                 ("DONE" . "#008080")
                                 )

        ;; Skip finished items
        ;; (setq org-agenda-skip-deadline-if-done t)
        ;; (setq org-agenda-skip-scheduled-if-done t)
        ;; (setq org-agenda-skip-timestamp-if-done t)

        ;; Skip deleted files
        org-agenda-skip-unavailable-files t

        ;; Org-Capture templates
        org-capture-templates
        (quote (
                ("n" "Notes" entry
                 (file+function "~/bxgithub/org/note.org" org-reverse-datetree-goto-date-in-file)
                 "* %^{Description} %^g
  Added: %t
  %?

 ")

                ("t" "Task" entry
                 (file+function "~/bxgithub/org/task.org" org-reverse-datetree-goto-date-in-file)
                 "* TODO %^{Description} %^gkanban:
  Added: %t
  SCHEDULED: %^{Date}T
  %?

 ")

                ("m" "Meeting" entry
                 (file+headline "~/bxgithub/org/meeting.org" "Meetings/People-related")
                 "** MEETING %^{Description} %^g
  SCHEDULED: %^{Date}T
  %?

")

                ("l" "Log Time" entry
                 (file+function "~/bxgithub/org/log.org" org-reverse-datetree-goto-date-in-file)
                 "** %U - %^{Activity}  %^g"
                 :immediate-finish t)
                ))

        ;; Makes some things look nicer
        org-startup-indented t
        org-pretty-entities t
        ;; show actually italicized text instead of /italicized text/
        org-hide-emphasis-markers t
        org-agenda-block-separator ""
        org-fontify-whole-heading-line t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t

        org-plantuml-jar-path "~/bxgithub/plantuml.jar"
        )

   (deft :variable
     deft-zetteldeft t
     )


   javascript
   html
   ;; (lsp :variables
   ;; lsp-lens-enable t)
   (spell-checking :variable
                   spell-checking-enable-by-default nil
                   )
   (syntax-checking :variables
                    syntax-checking-enable-by-default nil
                    )
   (c-c++ :variables
          c-c++-backend 'lsp-ccls
          c-c++-adopt-subprojects t
          c-c++-lsp-enable-semantic-highlight 'rainbow
          ;; c-c++-lsp-enable-semantic-highlight nil
          c-c++-dap-adapters '(dap-lldb dap-cpptools)
          c-c++-default-mode-for-headers 'c++-mode
          c-c++-enable-clang-format-on-save t
          c-c++-enable-auto-newline t
          c-c++-default-mode-for-headers 'c++-mode
          c-c++-enable-organize-includes-on-save nil
          ccls-initialization-options `(:compilationDatabaseDirectory "build")
          projectile-require-project-root t
          lsp-lens-enable nil
          )
   version-control
   games
   treemacs
   (shell :variables
    ;; shell-default-shell 'ansi-term
    shell-default-term-shell "/bin/zsh"
    ;; shell-enable-smart-eshell t
    )
   python
   version-control
   yaml
   csv
   latex
   cmake
   pdf
   ;; xkcd
   ;; (plantuml :variables
   ;;           plantuml-jar-path "~/bxgithub/plantuml.jar"
   ;;           )

   )
 )


;; This file is the first file to be loaded and this is the place where addtional layers can be declared.

;; For instance is layer A depends on some functionality of layer B then in the file layers.el of layer A we can add:

;; (configuration-layer/declare-layer 'B)
;; The effect is that B is considered a used layer and will be loaded as if it was added to dotspacemacs-configuration-layers variables.
