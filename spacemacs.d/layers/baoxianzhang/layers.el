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
   org
   ;; (lsp :variables
   ;; lsp-lens-enable t)
   (c-c++ :variables
          c-c++-backend 'lsp-ccls
          c-c++-adopt-subprojects t
          c-c++-lsp-enable-semantic-highlight 'rainbow
          c-c++-dap-adapters '(dap-lldb dap-cpptools)
          c-c++-default-mode-for-headers 'c++-mode
          c-c++-enable-organize-includes-on-save t
          c-c++-enable-clang-format-on-save t
          c-c++-enable-auto-newline t
          c-c++-default-mode-for-headers 'c++-mode
          c-c++-enable-organize-includes-on-save t
          c-c++-enable-clang-format-on-save t
          ccls-initialization-options `(:compilationDatabaseDirectory "build")
          projectile-require-project-root t
          )
   spell-checking
   syntax-checking
   version-control
   games
   treemacs
   (shell
    :variables
    shell-default-shell 'vterm
    )

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
