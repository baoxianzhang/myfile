;;; keybindings.el --- baoxianzhang Layer packages File for Spacemacs
;;
;; Copyright (c) 2016 baoxianzhang
;;
;; Author: baoxianzhang <baoxianzhit@gmail.com>
;; URL: https://github.com/baoxianzhang/myfile/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(define-key evil-normal-state-map (kbd "C-]")   'helm-gtags-find-tag)
(define-key evil-normal-state-map (kbd "C-t")   'evil-jump-backward)

(spacemacs/set-leader-keys "o y" 'youdao-dictionary-search-at-point+)
(spacemacs/set-leader-keys "o d" 'find-by-pinyin-dired)
(spacemacs/set-leader-keys "o i" 'org-insert-src-block)

(spacemacs/set-leader-keys "ar" 'my-ranger)
;; (setq smerge-command-prefix "\C-cv")
(spacemacs/set-leader-keys "o f" 'run-ros-clang-format)

;; (spacemacs/set-leader-keys "j =" 'clang-format-buffer)

(spacemacs/set-leader-keys "c f" 'clang-format-buffer)











;; It contains general key bindings.

;; This is the last file loaded.

;; The word general here means independent of any package. Since the end user can exclude an arbitrary set of packages, you cannot be sure that, just because your layer includes a package, that package will necessarily be loaded. For this reason, code in these files must be generally safe, regardless of which packages are installed.

;; More on this in the next section.

