(define-key evil-normal-state-map ",," 'evil-buffer)
(define-key evil-normal-state-map "-" 'delete-other-windows)
(define-key evil-normal-state-map "E" 'ido-find-file)
(define-key evil-normal-state-map "  " 'evil-jump-item)
(define-key evil-visual-state-map "  " 'evil-jump-item)
(define-key evil-normal-state-map "\\" 'evil-repeat-find-char-reverse)
(define-key evil-normal-state-map "H" 'evil-first-non-blank)
(define-key evil-normal-state-map "Y" 'copy-to-end-of-line)
(define-key evil-normal-state-map "L" 'evil-last-non-blank)
(define-key evil-normal-state-map (kbd "<right>") 'next-error)
(define-key evil-normal-state-map (kbd "<left>") 'previous-error)
(define-key evil-normal-state-map (kbd "<C-return>") 'new-line-in-normal-mode)
(define-key evil-normal-state-map (kbd "M-t") 'command-t)
(define-key evil-normal-state-map (kbd "M-s") 'textmate-goto-symbol)
(define-key evil-normal-state-map (kbd "M-b") 'anything-opened)
(define-key evil-normal-state-map (kbd "M-B") 'ibuffer)
(define-key evil-normal-state-map (kbd "M-f") 'dired)
(define-key evil-normal-state-map (kbd "M-.") 'find-tag)
(define-key evil-normal-state-map (kbd "C-w") 'delete-trailing-whitespace)
(define-key evil-normal-state-map (kbd "M-j") 'evil-window-next)
(define-key evil-normal-state-map (kbd "M-.") 'find-tag)
(define-key evil-normal-state-map (kbd "C-w") 'delete-trailing-whitespace)
(define-key evil-normal-state-map (kbd "C-SPC") 'comment-or-uncomment-region-or-line)
(define-key evil-normal-state-map (kbd "C-]") 'tb:gtags-find-tag)
(define-key evil-normal-state-map (kbd "C-}") 'tb:gtags-find-rtag)

(define-key evil-normal-state-map (kbd "C-j") 'evil-forward-paragraph)
(define-key evil-normal-state-map (kbd "C-k") 'evil-backward-paragraph)
(define-key evil-normal-state-map (kbd "C-l") 'evil-forward-word-begin)
(define-key evil-normal-state-map (kbd "C-h") 'evil-backward-word-begin)
(define-key evil-visual-state-map (kbd "C-j") 'evil-forward-paragraph)
(define-key evil-visual-state-map (kbd "C-k") 'evil-backward-paragraph)
(define-key evil-visual-state-map (kbd "C-l") 'evil-forward-word-begin)
(define-key evil-visual-state-map (kbd "C-h") 'evil-backward-word-begin)

(define-key evil-normal-state-map ",sc" 'rinari-find-controller)
(define-key evil-normal-state-map ",sh" 'rinari-find-helper)
(define-key evil-normal-state-map ",si" 'rinari-find-migration)
(define-key evil-normal-state-map ",sm" 'rinari-find-model)
(define-key evil-normal-state-map ",st" 'rinari-find-test)
(define-key evil-normal-state-map ",sv" 'rinari-find-view)
(define-key evil-normal-state-map ",sl" 'rinari-find-lib)

(define-key evil-visual-state-map ",ve" 'extract-variable)
(define-key evil-normal-state-map ",vi" 'inline-variable)

(define-key evil-normal-state-map ",tf" 'test-verify)
(define-key evil-normal-state-map ",ta" 'test-verify-all)
(define-key evil-normal-state-map ",t," 'test-toggle)
(define-key evil-normal-state-map ",tt" 'test-verify-single)
(define-key evil-normal-state-map ",te" (lambda ()
                                          (compile "lein expectations")))

(global-set-key (kbd "C-;") 'er/expand-region)
(global-set-key (kbd "C-:") 'er/contract-region)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-]") 'textmate-shift-right)
(global-set-key (kbd "M-[") 'textmate-shift-left)
(global-set-key (kbd "M-j") 'other-window)
;; (global-set-key (kbd "M-.") 'etags-select-find-tag)
(global-set-key (kbd "M-.") 'gtags-find-symbol)
(global-set-key (kbd "M-k") 'cycle-buffer)
(global-set-key (kbd "M-K") 'cycle-buffer-backward)

(add-hook 'ido-minibuffer-setup-hook
          (lambda ()
            (define-key ido-completion-map "\C-n" 'ido-next-match)
            (define-key ido-completion-map "\C-p" 'ido-prev-match)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'newline-and-indent)
            (local-set-key [f1] 'yari)))

(add-hook 'change-major-mode-hook
          (lambda ()
            (global-set-key (kbd "C-/") 'comment-or-uncomment-region-or-line)))


(add-hook 'dired-mode-hook (lambda ()
  (define-key dired-mode-map "U" 'dired-up-directory)
  (define-key dired-mode-map "/" 'dired-isearch-filenames)))

(evil-define-motion evil-jump-to-next-tag ()
  :jump t
  (let ((tag (thing-at-point 'symbol)))
    (find-tag tag t)))

(evil-define-motion evil-jump-to-previous-tag ()
  :jump t
  (let ((tag (thing-at-point 'symbol)))
    (find-tag tag ?-)))

(provide 'my-keymaps)
