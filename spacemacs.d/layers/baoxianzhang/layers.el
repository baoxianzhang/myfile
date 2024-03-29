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

        ;; TODO add absolute path
        org-projectile-file "TODOs.org"

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
                   spell-checking-enable-by-default t
                   )
   (syntax-checking :variables
                    syntax-checking-enable-by-default t
                    )
   (c-c++ :variables
          c-c++-backend 'lsp-ccls
          c-c++-adopt-subprojects t
          c-c++-lsp-enable-semantic-highlight 'rainbow
          ;; c-c++-lsp-enable-semantic-highlight nil
          c-c++-dap-adapters '(dap-lldb dap-cpptools)
          c-c++-default-mode-for-headers 'c++-mode
          c-c++-enable-clang-support t
          c-c++-enable-google-style t
          c-c++-enable-google-newline t
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
   (python :variables
           python-lsp-backend 'lsp
           python-lsp-server 'pyright
           python-fill-column 99
           python-formatter 'black
           python-format-on-save t
           python-test-runner 'pytest
           python-sort-imports-on-save t
           python-pipenv-activate t)

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
   epub
   bibtex
   (octave :variables
           octave-comment-char ?%)
   (translate :variables
              gts-translate-list '(("en" "zh") ("en" "fr"))
              )

   )
 )


;; This file is the first file to be loaded and this is the place where addtional layers can be declared.

;; For instance is layer A depends on some functionality of layer B then in the file layers.el of layer A we can add:

;; (configuration-layer/declare-layer 'B)
;; The effect is that B is considered a used layer and will be loaded as if it was added to dotspacemacs-configuration-layers variables.
