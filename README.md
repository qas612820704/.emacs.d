Installation
===
### 1. install el-get
Open emacs and pastle it into \*scatch\* ( C-x b RET \*scatch\* to call it)
```lisp
(url-retrieve  
"https://raw.github.com/dimitri/el-get/master/el-get-install.el"  
	(lambda (s)  
		(let (el-get-master-branch)  
			(goto-char (point-max))  
			(eval-print-last-sexp))))
```
then
```
M-x eval-current-buffer RET
```

### 2. clone my setting
```bash
$ cd $HOME/.emacs.d
(if init.el exist)
$ mv init.el init.el.orig 
(fi)
$ git clone git@github.com:qas612820704/myemacs.git
```

### 3. execute init.el
```bash
$ emacs -nw init.el
```
after using emacs to open your init.el

```
M-x eval-current-buffer RET ;; to get plug-in
```
waiting and enjoy!

### 4. setup python
```
M-x jedi:install-server RET
```
### 5. something else?
```$ emacs``` is too long so my ```.zshrc``` add this line:
```
alias e='env TERM=xterm-256color emacs -nw'
```
after setting, I use ```$ e``` to run emacs in terminal
