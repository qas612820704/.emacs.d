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
# if you already have your own emacs setting
# please backup
$ cd $HOME
$ mv .emacs.d/ .emacs_orig.d/

$ git clone git@github.com:qas612820704/.emacs.d.git
```


### 3. open emacs
```bash
$ emacs -nw
```
waiting and enjoy!

### 4. setup python complete
I use jedi to complete

It need python package `virtualenv`

if you use debian like me, execute
```bash
$ sudo aptitude install python-pip
$ sudo pip install virtualenv
```
get into emacs and run
```lisp
M-x jedi:install-server RET
```
### 5. setup irony-mode
[irony-mode](https://github.com/Sarcasm/irony-mode) is auto complete 
for c/cpp

to see more information in the hyper link, I just say it simplely,

install dependency
```bash
$ sudo aptitude install cmake 
```
emacs run
```lisp
M-x irony-mode RET
M-x irony-install-server RET
```
Usage : (M-RET) to call the complete


### 6. something else?
`$ emacs` is too long so my `.zshrc` add this line:
```bash
alias e='env TERM=xterm-256color emacs -nw'
```
after setting, I use ```$ e``` to run emacs in terminal
