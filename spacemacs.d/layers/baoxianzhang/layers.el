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

(configuration-layer/declare-layers '(
                                      (auto-completion :variables
                                                       auto-completion-return-key-behavior 'complete
                                                       auto-completion-tab-key-behavior 'cycle
                                                       auto-completion-complete-with-key-sequence nil
                                                       auto-completion-complete-with-key-sequence-delay 0.1
                                                       auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/"
                                                       auto-completion-enable-snippets-in-popup t
                                                       auto-completion-enable-help-tooltip t
                                                       auto-completion-enable-sort-by-usage t
                                                       )
                                      better-defaults
                                      emacs-lisp
                                      git
                                      markdown
                                      python
                                      shell-scripts
                                      (org :variables
                                           org-enable-github-support t)
                                      (shell :variables
                                             shell-default-height 30
                                             shell-default-position 'bottom)
                                      ;; spell-checking
                                      ;; syntax-checking
                                      version-control
                                      (chinese :variables
                                               ;; chinese-default-input-method 'chinese-pyim
                                               ;; chinese-enable-fcitx t
                                               chinese-enable-youdao-dict t)
                                      (c-c++ :variables
                                             c-c++-default-mode-for-headers 'c++-mode
                                             ;; :mode "\\.ino\\'" )
                                             )
                                      (colors :variables
                                              colors-enable-nyan-cat-progress-bar t)
                                      ;; games
                                      ranger
                                      pdf-tools
                                      (dash :variables helm-dash-docset-newpath "~/bxgithub/myconfigresources/zeal/docsets"
                                            ;; )
                                            helm-dash-browser-func 'eww)
                                      (gtags :variables gtags-enable-by-default t)
                                      ;; gtags
                                      ;; cscope
                                      ;; semantic
                                      yaml
                                      (rust :variables rust-format-on-save t)
                                      ;; (latex :variables
                                      ;;       latex-build-command "LaTeX"
                                      ;;       latex-enable-auto-fill t
                                      ;;       latex-enable-folding t)
                                      imenu-list
                                      csv


                                      baoxianzhang-org-page
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
