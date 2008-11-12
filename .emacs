; directory to put various el files into
(add-to-list 'load-path "~/.emacs.d/includes")
(add-to-list 'load-path "~/.emacs.d/ruby-mode")

; color themes
  (require 'color-theme)
   (color-theme-dark-laptop)
;   (color-theme-initialize)
   ;(color-theme-xemacs)
   ;(color-theme-robin-hood)
   ;(color-theme-gnome2)
   ;(color-theme-lawrence)
   ;(color-theme-subtle-hacker)
   ;(color-theme-high-contrast)
   ;(color-theme-sitaram-nt)
   ;(color-theme-calm-forest)

;disable backup
(setq backup-inhibited t)

; Ruby plugin
; Taken from the comment section in inf-ruby.el
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . html-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

; stylesheets
(autoload 'css-mode "css-mode")
(setq auto-mode-alist (cons '("\\.css\\'" . css-mode) auto-mode-alist))

; Ruby electric
(add-hook 'ruby-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (imenu-add-to-menubar "IMENU")
            (require 'ruby-electric)
            (ruby-electric-mode t)
            ))

; Install mode-compile to give friendlier compiling support!
(autoload 'mode-compile "mode-compile"
   "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
 "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

; Inferior Ruby Mode
    (autoload 'run-ruby "inf-ruby"
      "Run an inferior Ruby process")
    (autoload 'inf-ruby-keys "inf-ruby"
      "Set local key defs for inf-ruby in ruby-mode")
    (add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
    ))



;; Rails minor plugin
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(add-to-list 'load-path
             "~/.emacs.d/emacs-rails")

(require 'cedet)

;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following
(semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; Enable this if you develop in semantic, or develop grammars
;; (semantic-load-enable-semantic-debugging-helpers)

(require 'ecb-autoloads)

(autoload 'ruby-mode "ruby-mode" "Ruby editing mode." t)
(setq auto-mode-alist  (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.rhtml$" . html-mode) auto-mode-alist))

(modify-coding-system-alist 'file "\\.rb$" 'utf-8)
(modify-coding-system-alist 'file "\\.rhtml$" 'utf-8)

(require 'snippet)
(require 'rails)

(defun try-complete-abbrev (old)
   (if (expand-abbrev) t nil))

(setq hippie-expand-try-functions-list
      '(try-complete-abbrev
    try-complete-file-name
    try-expand-dabbrev))

(add-hook 'ruby-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (imenu-add-to-menubar "IMENU")
            (require 'ruby-electric)
            (ruby-electric-mode t)
            ))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.32")
 '(rails-ws:default-server-type "webrick"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

; svn plugin
(require 'psvn)


; PHP
(autoload 'php-mode "php-mode" "Mode for editing PHP source files")
(add-to-list 'auto-mode-alist '("\\.\\(inc\\|php[s34]?\\)" . php-mode))

; Python
(autoload 'python-mode "python-mode" "Mode for editing Python source files")
(add-to-list 'auto-mode-alist '("\\.py" . python-mode))

; music player
(autoload 'mpg123 "mpg123" "A Front-end to mpg123" t)

; wget addon
(autoload 'wget "wget" "wget interface for Emacs." t)    
(autoload 'wget-web-page "wget" "download web page." t)  

; irc
(autoload 'riece "riece" "Start Riece" t)

; Full screen
;TODO- fix this so that we can detect the screen and move it to the second screen.
; Refer to bin/swap_monitor.sh
;
;(defun toggle-fullscreen ()
;  (interactive)
;  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
;  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
;)
;(toggle-fullscreen)
