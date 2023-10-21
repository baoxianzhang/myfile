;;; packages.el --- baoxianzhang layer packages file for Spacemacs.
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
;; added to `baoxianzhang-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `baoxianzhang/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `baoxianzhang/pre-init-PACKAGE' and/or
;;   `baoxianzhang/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst baoxianzhang-packages
  '(hideif
    (cal-china-x :location (recipe
                           :fetcher melpa
                           :repo "xwl/cal-china-x"))
    (org-roam-bibtex)
    (flycheck-clang-tidy
      )
  )


  "The list of Lisp packages required by the baoxianzhang layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format"
  )





;; It contains this list of packages of the layer and the actual configuration for the packages included in the layer.

;; This file is loaded after layers.el.

;; It must define a variable called <layer>-packages, which should be a list of all the packages that this layer needs. Some valid package specifications are as follows:

;; (defconst mylayer-packages
;;   '(
;;     ;; Get the package from MELPA, ELPA, etc.
;;     some-package
;;     (some-package :location elpa)

;;     ;; A local package
;;     (some-package :location local)

;;     ;; A package recipe
;;     (some-package :location (recipe
;;                              :fetcher github
;;                              :repo "some/repo"))

;;     ;; An excluded package
;;     (some-package :excluded t)
;;     ))
;; The :location attribute specifies where the package may be found. Spacemacs currently supports packages on ELPA compliant repositories, local packages and MELPA recipes (through the Quelpa package). Local packages should reside at <layer>/local/<package>/. For information about recipes see the MELPA documentation.

;; Packages may be excluded by setting the :excluded property to true. This will prevent the package from being installed even if it is used by another layer.

;; For each included package, you may define one or more of the following functions, which are called in order by Spacemacs to initialize the package.

;; <layer>/pre-init-<package>
;; <layer>/init-<package>
;; <layer>/post-init-<package>
;; It is the responsibility of these functions to load and configure the package in question. Spacemacs will do nothing other than download the package and place it in the load path for you.

;; Note: A package will not be installed unless at least one layer defines an init function for it. That is to say, in a certain sense, the init function does mandatory setup while the pre-init and post-init functions do optional setup. This can be used for managing cross-layer dependencies, which we will discuss later.
;;; packages.el ends here

(defun baoxianzhang/init-hideif ()
  (use-package
    hideif
    :config (progn
              )
    )
  )

(defun baoxianzhang/init-cal-china-x ()
  (use-package
    cal-china-x
    :init (progn )
    :ensure t
    :defer t
    :config (progn
              (setq mark-holidays-in-calendar t)
              (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
              (setq cal-china-x-general-holidays '((holiday-lunar 1 15 "元宵节")))
              (setq calendar-holidays
                    (append cal-china-x-important-holidays
                     cal-china-x-general-holidays
                     ))

              )
    )
  )

(defun baoxianzhang/init-org-roam-bibtex ()
  (use-package
    org-roam-bibtex
    :after (org-roam)
    :defer t
    :config
    (require 'org-ref)
    (setq orb-note-actions-interface 'hydra)
    (setq orb-preformat-keywords
          '("citekey" "title" "url" "author-or-editor" "keywords" "file" "date")
          orb-process-file-keyword t
          orb-insert-interface 'helm-bibtex
          orb-file-field-extensions '("pdf")
          orb-insert-follow-link t
          )
    )
  )

(defun baoxianzhang/init-flycheck-clang-tidy()
  (use-package flycheck-clang-tidy
  :after flycheck
  :hook
  (flycheck-mode . flycheck-clang-tidy-setup)
  )
)
