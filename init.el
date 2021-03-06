(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(require 'evil)
(evil-mode 1)

(load-theme 'dracula t)

(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)

;; Comment/uncomment the following block to enable/disable cquery
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;
;; (require 'cquery)
;; (setq cquery-executable "~/dev-tools/cquery/build/cquery")
;; ;; Log file
;; (setq cquery-extra-args '("--log-file=/tmp/cq.log"))
;; ;; Cache directory, both relative and absolute paths are supported
;; (setq cquery-cache-dir ".cquery_cached_index")
;; ;; Initialization options
;; (setq cquery-extra-init-params '(:cacheFormat "msgpack"))
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;

(require 'company-lsp)
(push 'company-lsp company-backends)

(require 'lsp-mode)
(require 'lsp-python)
(add-hook 'python-mode-hook #'lsp-python-enable)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (lsp-ui company-lsp python-mode lsp-python helm-ag helm cquery lsp-mode dracula-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
