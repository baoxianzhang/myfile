;;; packages.el --- baoxianzhang-org-page layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: leo <leo@leo>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `baoxianzhang-org-page-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `baoxianzhang-org-page/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `baoxianzhang-org-page/pre-init-PACKAGE' and/or
;;   `baoxianzhang-org-page/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

;; (defconst baoxianzhang-org-page-packages
;;   '(org-page
;;     blog-admin
;;     )

;;   "The list of Lisp packages required by the baoxianzhang-org-page layer.

;; Each entry is either:

;; 1. A symbol, which is interpreted as a package to be installed, or

;; 2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
;;     name of the package to be installed or loaded, and KEYS are
;;     any number of keyword-value-pairs.

;;     The following keys are accepted:

;;     - :excluded (t or nil): Prevent the package from being loaded
;;       if value is non-nil

;;     - :location: Specify a custom installation location.
;;       The following values are legal:

;;       - The symbol `elpa' (default) means PACKAGE will be
;;         installed using the Emacs package manager.

;;       - The symbol `local' directs Spacemacs to load the file at
;;         `./local/PACKAGE/PACKAGE.el'

;;       - A list beginning with the symbol `recipe' is a melpa
;;         recipe.  See: https://github.com/milkypostman/melpa#recipe-format"
;; )

;; (defun baoxianzhang-org-page/init-baoxianzhang-org-page ()
;;   (spacemacs/declare-prefix "ab" "blog")
;;   (use-package
;;     org-page
;;     :config (progn (setq op/repository-directory "~/bxgithub/baoxianzhang.github.io/"
;;                          op/site-domain "http://baoxianzhang.github.io"
;;                          op/personal-disqus-shortname "LEO"
;;                          op/site-main-title "baoxianzhang's blog"
;;                          op/site-sub-title "Way to geek"
;;                          op/site-domain "https://baoxianzhang.github.io"
;;                          ;; op/theme-root-directory "~/src/"
;;                          ;; op/theme 'org-page-theme-kactus
;;                          op/personal-github-link "http://github.com/baoxianzhang"
;;                          ;; op/personal-google-analytics-id "UA-xxxxxxxx-x"
;;                          )
;;                    (spacemacs/set-leader-keys
;;                      "abp" 'op/do-publication-and-preview-site
;;                      "abP" 'op/do-publication
;;                      "abn" 'op/new-post
;;                      "abr" 'op/new-repository))
;;     ;; for blog admin M-x blog-admin-start
;;     blog-admin
;;     :init   (progn (setq  log-admin-backend-type 'org-page
;;                        blog-admin-backend-path "~/bxgithub/baoxianzhang.github.io/blog"
;;                        blog-admin-backend-new-post-in-drafts t
;;                        blog-admin-backend-new-post-with-same-name-dir t
;;                        blog-admin-backend-org-page-drafts "_drafts" ;; directory to save draft
;;                        blog-admin-backend-org-page-config-file "~/bxgithub/baoxianzhang.github.io/config.el" ;; if nil init.el is used
;;                        )
;;                    (evilified-state-evilify-map blog-admin-mode-map
;;                      :mode blog-admin-mode)
;;                    (spacemacs/set-leader-keys
;;                      "abb" 'blog-admin-start)
;;                    (setq blog-admin-backend-org-page-template-org-post
;;                          "#+TITLE: %s
;; #+AUTHOR: Baoxian Zhang
;; #+EMAIL: baoxianzhit@gmail.com
;; #+LANGUAGE: zh-CN
;; #+OPTIONS: H:3 num:nil toc:nil \\n:nil ::t |:t ^:nil -:nil f:t *:t <:t
;; #+URI: /blog/%%y/%%m/%%d/
;; #+DATE: %s
;; #+TAGS:
;; #+DESCRIPTON:
;; "
;;                          ))
;;     )
;; )

(setq baoxianzhang-org-page-packages
      '(org-page
        blog-admin)
      )

(defun baoxianzhang-org-page/init-org-page ()
  (spacemacs/declare-prefix "ab" "blog")
  (use-package
    org-page
    :config (progn (setq op/repository-directory "~/bxgithub/baoxianzhang.github.io/"
                         op/site-domain "http://baoxianzhang.github.io"
                         op/personal-disqus-shortname "LEO"
                         op/site-main-title "baoxianzhang's blog"
                         op/site-sub-title "Way to geek"
                         op/site-domain "https://baoxianzhang.github.io"
                         ;; op/theme-root-directory "~/src/"
                         ;; op/theme 'org-page-theme-kactus
                         op/personal-github-link "http://github.com/baoxianzhang"
                         ;; op/personal-google-analytics-id "UA-xxxxxxxx-x"
                         )
                   (spacemacs/set-leader-keys
                     "abp" 'op/do-publication-and-preview-site
                     "abP" 'op/do-publication
                     "abn" 'op/new-post
                     "abr" 'op/new-repository))
    )
)


(defun baoxianzhang-org-page/init-blog-admin ()
  (spacemacs/declare-prefix "ab" "blog")
  (use-package
    ;; for blog admin M-x blog-admin-start
    blog-admin
    :init   (progn (setq  log-admin-backend-type 'org-page
                       blog-admin-backend-path "~/bxgithub/baoxianzhang.github.io/blog"
                       blog-admin-backend-new-post-in-drafts t
                       blog-admin-backend-new-post-with-same-name-dir t
                       blog-admin-backend-org-page-drafts "_drafts" ;; directory to save draft
                       blog-admin-backend-org-page-config-file "~/bxgithub/baoxianzhang.github.io/config.el" ;; if nil init.el is used
                       )
                   (evilified-state-evilify-map blog-admin-mode-map
                     :mode blog-admin-mode)
                   (spacemacs/set-leader-keys
                     "abb" 'blog-admin-start)
                   (setq blog-admin-backend-org-page-template-org-post
                         "#+TITLE: %s
#+AUTHOR: Baoxian Zhang
#+EMAIL: baoxianzhit@gmail.com
#+LANGUAGE: zh-CN
#+OPTIONS: H:3 num:nil toc:nil \\n:nil ::t |:t ^:nil -:nil f:t *:t <:t
#+URI: /blog/%%y/%%m/%%d/
#+DATE: %s
#+TAGS:
#+DESCRIPTON:
"
                         ))
    )
)



;;; packages.el ends here
