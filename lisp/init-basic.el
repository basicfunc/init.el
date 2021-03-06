;; Ligature for fonts.
(straight-use-package
 '(ligature :type git :host github :repo "mickeynp/ligature.el"))

(ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                     ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                     "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                     "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                     "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                     "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                     "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                     "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                     ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                     "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                     "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                     "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                     "\\\\" "://"))
(global-ligature-mode t)

;; Have some emotions XD.
(straight-use-package 'emojify)

;; Very powerful undo/redo system.
(straight-use-package 'undo-tree)
(global-undo-tree-mode +1)

;; Highlight your indentation to make things more simple.
(straight-use-package 'highlight-indent-guides)
(require 'highlight-indent-guides)
(set-face-background 'highlight-indent-guides-odd-face "darkgray")
(set-face-background 'highlight-indent-guides-even-face "dimgray")
(set-face-foreground 'highlight-indent-guides-character-face "dimgray")
(setq highlight-indent-guides-method 'character)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; Using icons.
(straight-use-package 'all-the-icons)
(straight-use-package 'all-the-icons-completion)
(all-the-icons-completion-mode)
(add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup)
(straight-use-package 'all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; A warm theme.
(straight-use-package 'doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(load-theme 'doom-wilmersdorf t)

;; OHhhh, this modeline
(straight-use-package 'mood-line)
(mood-line-mode +1)

;; Making things a lot easy.
(straight-use-package 'vertico)
(vertico-mode +1)

(straight-use-package 'marginalia)
(marginalia-mode +1)

;; Emacs completion style enhancement.
(straight-use-package 'orderless)
(setq completion-styles '(orderless))

;; Commands based on the Emacs completion.
(straight-use-package 'consult)

;; Text completion framework.
(straight-use-package 'company)
(add-hook 'after-init-hook 'global-company-mode)

(defvar my-company-point nil)
(advice-add 'company-complete-common :before (lambda () (setq my-company-point (point))))
(advice-add 'company-complete-common :after (lambda ()
  		  			      (when (equal my-company-point (point))
  			  			(yas-expand))))

(setq company-minimum-prefix-length 1
      company-ideal-dealy 0.0
      company-tooltip-align-annotations t
      company-selection-wrap-around t)
(company-tng-configure-default)

;; Woohh, present at multiple places at same time, like multiverse.
(straight-use-package 'multiple-cursors)
(multiple-cursors-mode +1)

(provide 'init-basic)
