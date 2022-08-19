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

;; (define-key evil-normal-state-map (kbd "C-]")   'helm-gtags-find-tag)
;; (define-key evil-normal-state-map (kbd "C-t")   'evil-jump-backward)
;; Note the evil-jump-backward is binding the key "C-o"
(define-key evil-normal-state-map (kbd "C-]")   'xref-find-definitions)
(define-key evil-normal-state-map (kbd "C-t")   'xref-find-references)
(define-key global-map (kbd "C-c i") 'org-capture-inbox)

;; NOTE
;; good command evil-jump-backward, use default keybindings "C-o"


(spacemacs/set-leader-keys "o y" 'youdao-dictionary-search-at-point+)
(spacemacs/set-leader-keys "o d" 'find-by-pinyin-dired)
(spacemacs/set-leader-keys "o i" 'org-insert-src-block)
(spacemacs/set-leader-keys "o b" 'open-self-layers-file)


;; It contains general key bindings.

;; This is the last file loaded.

;; The word general here means independent of any package. Since the end user can exclude an arbitrary set of packages, you cannot be sure that, just because your layer includes a package, that package will necessarily be loaded. For this reason, code in these files must be generally safe, regardless of which packages are installed.

;; More on this in the next section.

