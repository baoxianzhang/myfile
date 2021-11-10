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
   markdown
   multiple-cursors
   (chinese :variables
            chinese-enable-youdao-dict t
            chinese-enable-avy-pinyin t
            )
   (org :variable
        org-todo-dependencies-strategy 'naive-auto
        org-enable-notifications t
        org-start-notification-daemon-on-startup t
        org-enable-github-support t ;; for github flavored markdown
        org-enable-bootstrap-support t
        org-enable-reveal-js-support t
        org-enable-org-contacts-support t
        org-contacts-files '("~/bxgithub/org/contacts.org")
        org-capture-templates '(("c" "Contacts" entry (file "~/bxgithub/org/contacts.org")
                                 "* %(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:END:"))
        org-enable-org-journal-support t
        org-journal-dir "~/bxgithub/org/journal/"
        org-journal-file-format "%Y-%m-%d"
        org-journal-date-prefix "#+TITLE: "
        org-journal-date-format "%A, %B %d %Y"
        org-journal-time-prefix "* "
        org-journal-time-format ""

        org-enable-hugo-support t
        org-enable-trello-support t
        org-projectile-file "TODOs.org"

        org-enable-org-brain-support t
        org-enable-roam-support t
        org-enable-roam-server t
        org-enable-roam-protocal t
        spaceline-org-clock-p t
        org-enable-sticky-header t
        org-enable-valign t
        org-enable-appear-support t
        org-enable-verb-support t
        org-enable-asciidoc-support t

        ;; org-persp-startup-with-agenda "a"
        ;; org-agenda-files (list "~/bxgithub/org/work.org"
        ;;                        "~/bxgithub/org/life.org"
        ;;                        )
        org-agenda-files '("~/bxgithub/org")
        org-agenda-start-on-weekday 0
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
   shell
   ;; (shell :variables
   ;;  shell-default-shell 'vterm
   ;;  )
   github
   python
   version-control
   yaml
   csv
   ;; latex
   cmake

   ;; baoxianzhang-better-defaults
   ;; baoxianzhang-misc
   ;; baoxianzhang-org
   ;; baoxianzhang-programming
   ;; baoxianzhang-ui
   ))


;; This file is the first file to be loaded and this is the place where addtional layers can be declared.

;; For instance is layer A depends on some functionality of layer B then in the file layers.el of layer A we can add:

;; (configuration-layer/declare-layer 'B)
;; The effect is that B is considered a used layer and will be loaded as if it was added to dotspacemacs-configuration-layers variables.
