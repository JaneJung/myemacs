; Change command key to meta key in mac 
(setq mac-command-modifier 'meta)

; Hide tool bar
(tool-bar-mode -1)

; Set "buffer list" in the current window
(add-to-list 'same-window-buffer-names  "*Buffer List*")

; Set "-jabber-roster-" in the current window
(add-to-list 'same-window-buffer-names "*-jabber-roster-*")

; auto-complete
(add-to-list 'load-path "/Users/jane/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/jane/.emacs.d//ac-dict")
(ac-config-default)

(add-to-list 'load-path "/Users/jane/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-jsc-light)

; google talk
(add-to-list 'load-path "/Users/jane/.emacs.d/emacs-jabber-0.8.0/")
(require 'jabber-autoloads)
(setq jabber-account-list
      '(("jsy4754@gmail.com"
	 (:network-server . "talk.google.com")
	 (:connection-type . ssl)
	 (:password . "sun478200"))
	("yellowjane7@gmail.com"
	 (:network-server . "talk.google.com")
	 (:connection-type . ssl)
	 (:password . "sun478200"))
	("jane@idincu.com"
	 (:network-server . "talk.google.com")
	 (:connection-type . ssl)
	 (:password . "tjsudrha@@"))))
(jabber-connect-all)
(jabber-display-roster)

; set C/C++ development environment
(setq-default c-basic-offset 4)
(add-hook 'c-mode-common-hook '(lambda ()
								 (local-set-key (kbd "RET") 'newline-and-indent)))

; compile
(add-to-list 'load-path "/Users/jane/.emacs.d/smart-compile.el")
(require 'smart-compile)
(defun my-compile ()
  (interactive)
  (smart-compile 4)
)
(global-set-key (kbd "<f7>") 'my-compile)

; run
(defun my-run ()
  (interactive)
  (shell-command (concat "./" (file-name-sans-extension (file-name-nondirectory buffer-file-name))))
  (switch-to-buffer-other-window "*Shell Command Output*")
)
(global-set-key (kbd "<f5>") 'my-run)
