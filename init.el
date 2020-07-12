;; ***** パッケージ *****

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)

(package-initialize)

;; ***** 共通設定 *****

; カラー設定
(load-theme 'spolsky t)

;; フォント設定
(setq face-font-rescale-alist '(("Hiragino.*" . 1.2)))

;; デフォルトエンコーディングをUTF-8 に
(prefer-coding-system 'utf-8)

;; ウインドウ最大で開く
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; CUAモード(C-RET) 有効
(cua-mode t) 
(setq cua-enable-cua-keys nil) 
     
;; 自動保存されるバックアップファイルの置き場所を ~/.emacs.d/backup に変更する
(setq backup-directory-alist 
  (cons (cons ".*" (expand-file-name "~/.emacs.d/backup")) 
        backup-directory-alist)) 
(setq auto-save-file-name-transforms 
      `((".*", (expand-file-name "~/.emacs.d/backup/") t))) 
 
;; ツールバー非表示
(tool-bar-mode -1)
 
;; 時刻をモードラインに表示
(display-time-mode t)
 
;; 行番号をモードラインに表示
(column-number-mode t)
 
;; 左端に行数を表示させる
(global-linum-mode t) 
 
;; 対応する括弧をハイライト
(show-paren-mode t)
 
;; 起動時の Emacsロゴなどのメッセージを出さない
(setq inhibit-startup-message t) 

;; *scratch* バッファの初期メッセージを消す
(setq initial-scratch-message "")

;;ビープ音を消す
(setq ring-bell-function 'ignore)

;; タブの無効化
(setq-default indent-tabs-mode nil)
;;(setq-default tab-width 4 indent-tabs-mode nil)

;; クリップボードにコピー
(setq x-select-enable-clipboard t)

;; コメントアウトの設定
(setq comment-style 'multi-line)

;; ウィンドウの切替
(global-set-key (kbd "C-x <left>")  'windmove-left)
(global-set-key (kbd "C-x <right>")  'windmove-right)

;; バックスペースの設定
(global-set-key "\C-h" 'delete-backward-char)

;; ***** シンボリック対策 *****

;; シンボリックリンクの読み込みを許可
(setq vc-follow-symlinks t)
;; シンボリックリンク先のVCS内で更新が入った場合にバッファを自動更新
(setq auto-revert-check-vc-info t)

;; ***** Verilog *****

(autoload 'verilog-mode "verilog-mode" "Verilog mode" t)
(setq verilog-indent-level             2
      verilog-indent-level-module      2
      verilog-indent-level-declaration 2
      verilog-indent-level-behavioral  2
      verilog-indent-level-declaration 2
      verilog-auto-newline             nil
      verilog-auto-indent-on-newline   nil
      verilog-tab-always-indent        nil
      verilog-auto-endcomments         nil
      verilog-auto-lineup              nil
      verilog-linter                   "iverilog"
      )
(setq auto-mode-alist
      (append
       '(("\\.v$" . verilog-mode))
       '(("\\.sv$" . verilog-mode))
       auto-mode-alist))

;; ***** company *****
(require 'company)

(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)

;; color settings
(set-face-attribute 'company-tooltip nil
		    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common nil
		    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common-selection nil
		    :foreground "white" :background "steelblue")
(set-face-attribute 'company-tooltip-selection nil
		    :foreground "black" :background "steelblue")
(set-face-attribute 'company-preview-common nil
		    :background nil :foreground "lightgrey" :underline t)
(set-face-attribute 'company-scrollbar-fg nil
		    :background "orange")
(set-face-attribute 'company-scrollbar-bg nil
		    :background "gray40")

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; ***** gtag *****

(require 'helm-gtags)

;; customize
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(package-selected-packages
   (quote
    (tabbar sublime-themes jedi material-theme helm-gtags company better-defaults))))
;; key bindings
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ***** jedi *****

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; ***** neotree *****

;;(require 'all-the-icons)
(require 'neotree)
;; 隠しファイルをデフォルトで表示
(setq neo-show-hidden-files t)
;; cotrol + o でneotreeを起動
(global-set-key "\C-o" 'neotree-toggle)
;; ルートディレクトリを自動更新しない
(setq neo-autorefresh nil)
;; neotreeを開いた時のカレントファイルのディレクトリを表示する
(setq neo-smart-open t)
;; キーバインドをシンプルにする
(setq neo-keymap-style 'concise)

;; ***** tabbar *****

(require 'tabbar)

(tabbar-mode 1)
;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)
;; グループ化しない
(setq tabbar-buffer-groups-function nil)
;; 画像を使わないことで軽量化する
(setq tabbar-use-images nil)
;; キーに割り当てる
(global-set-key (kbd "M-<right>") 'tabbar-forward-tab)
(global-set-key (kbd "M-<left>") 'tabbar-backward-tab)
;;----- 左側のボタンを消す
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))


;;----- タブのセパレーターの長さ
(setq tabbar-separator '(2.0))


;;----- タブの色（CUIの時。GUIの時は後でカラーテーマが適用）
(set-face-attribute
 'tabbar-default nil
 :background "brightblue"
 :foreground "white"
 )
(set-face-attribute
 'tabbar-selected nil
 :background "#ff5f00"
 :foreground "brightwhite"
 :box nil
 )
(set-face-attribute
 'tabbar-modified nil
 :background "brightred"
 :foreground "brightwhite"
 :box nil
 )

;;----- 表示するバッファ
(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                     ;;((equal "*scratch*" (buffer-name b)) b) ; *scratch*バッファは表示する
                     ;;((equal "*helm ag results*" (buffer-name b)) b) ; *helm ag results*バッファは表示する
                     ((char-equal ?* (aref (buffer-name b) 0)) nil) ; それ以外の * で始まるバッファは表示しない
                     ((buffer-live-p b) b)))
                (buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
