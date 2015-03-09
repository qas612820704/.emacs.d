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
		   (global-set-key (kbd "M-X") 'smex-major-mode-commands)))  
   (:name magit  
          :after (global-set-key (kbd "C-x C-z") 'magit-status))
   (:name jedi
	  :after (progn
		   (add-hook 'python-mode-hook 'jedi:setup)
		   (setq jedi:complete-on-dot t)
		   ))
   (:name neotree
	  :after (global-set-key [f8] 'neotree-toggle))
   ))  

;; 設定要安裝的包！這裡是重點，下面解釋：  
(setq packages  
      (append  
       '(el-get smex magit web-mode tomorrow-theme
		jedi android-mode neotree)  
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
