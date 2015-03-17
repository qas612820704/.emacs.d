(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s) (end-of-buffer) (eval-print-last-sexp))))

(setq  
 el-get-sources  
 '(el-get 
   (:name smex  
	  :after (progn ;; 這邊就是對套件進行載入後設定，以及撰寫 recipe  
		   (global-set-key (kbd "M-x") 'smex)  
		   (global-set-key (kbd "M-X") 'smex-major-mode-commands))
	  )  
   (:name magit  
          :after (global-set-key (kbd "C-x C-z") 'magit-status)
	  )
   (:name jedi
	  :after (progn
		   (add-hook 'python-mode-hook 'jedi:setup)
		   (setq jedi:complete-on-dot t)
		   )
	  )
   (:name neotree
	  :after (global-set-key [f8] 'neotree-toggle)
	  )
   (:name android-mode
	  :after (custom-set-variables
		  '(android-mode-sdk-dir
		    "/usr/local/src/android-sdk-linux")
		  )
	  )
   (:name evil
	  :type github
	  :pkgname "emacsmirror/evil"
	  )
   (:name emmet-mode
	  :after (progn
		   (add-hook 'web-mode-hook 'emmet-mode)
		   (add-hook 'php-mode-hook 'emmet-mode)
		   )
	  )
   (:name irony-mode
	  :after (progn
		   (add-hook 'c++-mode-hook 'irony-mode)
		   (add-hook 'c-mode-hook 'irony-mode)
		   (add-hook 'objc-mode-hook 'irony-mode)

		   ;; replace the `completion-at-point' and `complete-symbol' bindings in
		   ;; irony-mode's buffers by irony-mode's function
		   (defun my-irony-mode-hook ()
		     (define-key irony-mode-map [remap complete-symbol]
		       'irony-completion-at-point-async)
		     (define-key irony-mode-map [remap complete-symbol]
		       'irony-completion-at-point-async))
		   (add-hook 'irony-mode-hook 'my-irony-mode-hook)
		   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
		   )
	  )
   (:name ac-irony
	  :after (progn
		   (defun my-ac-irony-setup ()
		     ;; be cautious, if yas is not enabled before (auto-complete-mode 1), overlays
		     ;; *may* persist after an expansion.
		     ;; (yas-minor-mode 1)
		     (auto-complete-mode 1)
		     
		     (add-to-list 'ac-sources 'ac-source-irony)
		     (define-key irony-mode-map (kbd "M-RET") 'ac-complete-irony-async))
		   
		   (add-hook 'irony-mode-hook 'my-ac-irony-setup)
		   )
	  )
 ))  

;; 設定要安裝的包！這裡是重點，下面解釋：  
(setq packages  
      (append  
       '(el-get smex magit web-mode tomorrow-theme
		jedi android-mode neotree
		tabbar php-mode evil emmet-mode
		irony-mode ac-irony
		)  
       (mapcar 'el-get-source-name el-get-sources)))

;; 這裡是設定重點，包含異步/同步啟動機制  
(el-get 'sync packages)  

;; theme
(load-theme 'tomorrow-night t)
;; fonts
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono Book" ))
(set-face-attribute 'default t :font "DejaVu Sans Mono Book" )
;; disable menu tool scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(line-number-mode 1)
(speedbar 1)

;; evil-mode enable
(evil-mode 1)
