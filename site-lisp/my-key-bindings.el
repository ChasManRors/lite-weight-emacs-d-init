;;    C-⌘ k
(global-set-key (kbd "C-s-k") (quote forward-word))

;;    C-⌘ j
(global-set-key (kbd "C-s-j") (quote backward-word))

;;    C-shift-L
(global-set-key (kbd "C-S-l") (quote linum-mode))

;;    C-shift-T
(global-set-key (kbd "C-S-T") (quote toggle-truncate-lines))

;;    C-shift-D
(global-set-key (kbd "C-S-D") (quote compare-windows))

;;    C-shift-R
(global-set-key (kbd "C-S-R") (quote toggle-read-only))

;;    C-c C-I (mac has no insert key)
(global-set-key (kbd "C-C C-i") (quote overwrite-mode))

;;    ⌘ <- Go to Left over sexp
(global-set-key [s-left] (quote backward-sexp))

;;    ⌘ -> Go to Right over sexp
(global-set-key [s-right] (quote forward-sexp))

;;    C-shift-. find using codesearch
;; (global-set-key [67108926] (quote listing-codesearch-search))

;;    C-;
(global-set-key (kbd "C-;") (quote iedit-mode))

;;    C-shift-+ place alignment line at cursor
(global-set-key (kbd "C-+") (quote vline-mode))

;;    C-shift-b === "C-S-b"
(global-set-key (kbd "C-S-B") (quote vc-annotate))


;; (bind-key "C-c x" 'my-ctrl-c-x-command some-other-mode-map)
;;(bind-key "C-S-b" 'vc-annotate ruby-mode-map)

;;    C-shift-w === "C-S-w" search some/all buffers for a string
(global-set-key (kbd "C-S-w") (quote multi-occur-in-matching-buffers))

;;    C-s-i === control super i iedit-prev-occurrence
(global-set-key (kbd "C-s-i") (quote iedit-prev-occurrence))
;;    C-j iedit-prev-occurrence
(global-set-key [10] (quote iedit-prev-occurrence))

;;    C-c #   toggle between x = {:foo => 9}  and x = {foo: 9} syntax
(global-set-key [3 35] (quote ruby-hash-syntax-toggle))

;;    C-s-. runs the command helm-dash-at-point. NOTE M-x helm-dash-install-docset for the official docsets
;;                or M-x helm-dash-install-user-docset for user contributed docsets (experimental).
(global-set-key [75497518] (quote helm-dash-at-point))

;; C-S-j runs the command jump-to-file-and-line
(global-set-key [33554442] (quote jump-to-file-and-line))

