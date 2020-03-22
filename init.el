;; ***** パッケージ *****

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)

(package-initialize)

;; ***** 共通設定 *****

;; フォント設定
(setq face-font-rescale-alist '(("Hiragino.*" . 1.2)))

;; デフォルトエンコーディングをUTF-8 に
(prefer-coding-system 'utf-8)

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

;; クリップボードにコピー
(setq x-select-enable-clipboard t)

;; コメントの設定
(define-key global-map "\C-c;" 'comment-region)      ; コメントアウト
(define-key global-map "\C-c:" 'uncomment-region)    ; コメント解除
(setq comment-style 'multi-line)

;; ***** company *****

(require 'company)
;; 基本設定
(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
;; カラー設定
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
;; キー設定
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; ***** Verilog *****

(autoload 'verilog-mode "verilog-mode" "Verilog mode" t)
(setq verilog-indent-level             2
      verilog-indent-level-module      2
      verilog-indent-level-declaration 2
      verilog-indent-level-behavioral  2
      verilog-indent-level-directive   1
      verilog-case-indent              2
      verilog-auto-newline             nil
      verilog-auto-indent-on-newline   nil
      verilog-tab-always-indent        2
      verilog-auto-endcomments         nil
      verilog-minimum-comment-distance 40
      verilog-indent-begin-after-if    2
      verilog-auto-lineup              '(all)
      verilog-linter                   "iverilog"
      )
(setq auto-mode-alist
      (append
       '(("\\.v$" . verilog-mode))
       '(("\\.sv$" . verilog-mode))
       auto-mode-alist))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company material-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
