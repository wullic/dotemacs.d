;;---------------------------------------------------------------------
;; Rainbow-mode
;;---------------------------------------------------------------------
(when (maybe-require-package 'rainbow-mode)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (with-eval-after-load 'rainbow-delimiters-mode
    (diminish 'rainbow-delimiters-mode)))

;;---------------------------------------------------------------------
;; highlight-current-line
;;---------------------------------------------------------------------
(global-hl-line-mode +1)

(require-package 'volatile-highlights)
(volatile-highlights-mode t)
(diminish 'volatile-highlights-mode)

;;---------------------------------------------------------------------
;; highlight-parentheses
;;---------------------------------------------------------------------
(require-package 'highlight-parentheses)
(add-hook 'prog-mode-hook (lambda ()
                            (unless (derived-mode-p 'emacs-lisp-mode)
                              (highlight-parentheses-mode))))

;;---------------------------------------------------------------------
;; highlight-indent-guides
;;---------------------------------------------------------------------
(require-package 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'bitmap)
(setq highlight-indent-guides-bitmap-function 'highlight-indent-guides--bitmap-dots)

(with-eval-after-load 'highlight-parentheses
  (diminish 'highlight-parentheses-mode))
(with-eval-after-load 'highlight-indent-guides
  (diminish 'highlight-indent-guides-mode))


(provide 'init-highlight)

