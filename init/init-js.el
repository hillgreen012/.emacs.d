(require 'js-comint)
(autoload 'js3-mode "js3" nil t)
;(require 'js2-highlight-vars)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.js.erb$" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.json.erb$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

(eval-after-load "coffee-mode"
  `(setq coffee-js-mode preferred-javascript-mode
         coffee-tab-width preferred-javascript-indent-level))

(add-hook 'coffee-mode-hook 'flymake-coffee-load)

(setq flymake-node-jshint-config "~/.jshint.json")
(add-hook 'js3-mode-hook (lambda () (flymake-mode t)))

(defun add-inferior-js-keys ()
  (local-set-key "\C-x\C-e" 'js-send-last-sexp)
  (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
  (local-set-key "\C-cb" 'js-send-buffer)
  (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
  (local-set-key "\C-cl" 'js-load-file-and-go))
(add-hook 'js-mode-hook 'add-inferior-js-keys)

; (add-hook 'js3-mode-hook
;           (lambda ()
;             (add-inferior-js-keys)
;             (js2-highlight-vars-mode)))

(setq inferior-js-program-command "node")
(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list 'comint-preoutput-filter-functions
                     (lambda (output)
                       (replace-regexp-in-string ".*1G\.\.\..*5G" "... "
                     (replace-regexp-in-string ".*1G.*3G" "> " output))))))
(provide 'init-js)
