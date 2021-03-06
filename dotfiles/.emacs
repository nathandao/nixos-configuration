;section; installed packages.  Don't delete this line.  If you don't want it,;
;; Added by Package.el.  This must come before configurations of
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))

;; (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

;;(add-to-list 'package-archives (cons "melpa" "http://melpa.milkbox.net/packages/"))


(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(clojure-align-forms-automatically t)
 '(comment-multi-line t)
 '(comment-style 'indent)
 '(company-quickhelp-color-background "#3E4452")
 '(company-quickhelp-color-foreground "#ABB2BF")
 '(css-indent-offset 2 t)
 '(custom-enabled-themes '(one-dark))
 '(custom-safe-themes
   '("ae65ccecdcc9eb29ec29172e1bfb6cadbe68108e1c0334f3ae52414097c501d2" "7675ffd2f5cb01a7aab53bcdd702fa019b56c764900f2eea0f74ccfc8e854386" "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "0dd2666921bd4c651c7f8a724b3416e95228a13fca1aa27dc0022f4e023bf197" "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "59e82a683db7129c0142b4b5a35dbbeaf8e01a4b81588f8c163bd255b76f4d21" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "d1cc05d755d5a21a31bced25bed40f85d8677e69c73ca365628ce8024827c9e3" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "6952b5d43bbd4f1c6727ff61bc9bf5677d385e101433b78ada9c3f0e3787af06" "b9cbfb43711effa2e0a7fbc99d5e7522d8d8c1c151a3194a4b176ec17c9a8215" "ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" "6de7c03d614033c0403657409313d5f01202361e35490a3404e33e46663c2596" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "4cbec5d41c8ca9742e7c31cc13d8d4d5a18bd3a0961c18eb56d69972bbcf3071" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" default))
 '(diary-entry-marker 'font-lock-variable-name-face)
 '(emms-mode-line-icon-image-cache
   '(image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };"))
 '(fci-rule-color "#383838" t)
 '(fill-column 120)
 '(flycheck-python-flake8-executable "python3")
 '(flycheck-python-pycompile-executable "python3")
 '(flycheck-python-pylint-executable "python3")
 '(gnus-logo-colors '("#1ec1c4" "#bababa") t)
 '(gnus-mode-line-image-cache
   '(image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };") t)
 '(indent-tabs-mode nil)
 '(json-reformat:pretty-string\? t)
 '(markdown-toc-header-toc-end "<!-- toc end -->")
 '(markdown-toc-header-toc-start "<!-- toc start -->")
 '(neo-show-hidden-files t)
 '(package-selected-packages
   '(nix-buffer direnv csv-mode pinentry graphql-mode graphql sudo-edit terraform-mode nix-mode php-mode add-node-modules-path zone-nyan oauth2 gitignore-mode projectile-git-autofetch one-themes pydoc org-agenda-property org helm-org ssh xclip jinja2-mode blacken emms cider restclient-helm restclient uuidgen elpy use-package python-mode wsd-mode winum window-numbering pg company-go go-playground-cli go-stacktracer go-projectile godoctor go-tag flymake-go exec-path-from-shell flycheck-golangci-lint go-errcheck gorepl-mode window-jump window-number multi-web-mode javap-mode alect-themes projectile-codesearch projectile-ripgrep wgrep docker-tramp docker-api dockerfile-mode svg-mode-line-themes svg elisp-lint markdown-toc prettier-js bitbucket docker-compose-mode rust-mode goto-last-change evil-indent-plus column-marker nginx-mode helm-descbinds less-css-mode writeroom-mode markdown-mode+ evil-magit flymake-google-cpplint yasnippet-snippets react-snippets go-gopath golint go-autocomplete go-complete go-guru go eldoc-extension helm-open-github tss nodejs-repl node-resolver web-mode-edit-element company-web eldoc-overlay-mode flyspell-correct-popup flyspell-correct flyspell-popup flymake-jslint flycheck-clojure js3-mode web-narrow-mode company-c-headers xml+ caps-lock scad-mode function-args tidy web-beautify go-mode lua-mode arduino-mode web-mode tide js2-refactor js2-highlight-vars lorem-ipsum js2-mode multi-term json-mode bash-completion moe-theme ample-theme evil-avy el-get neotree rainbow-delimiters helm-projectile projectile undo-tree elisp-format helm nyan-mode clojure-mode chess yasnippet yaml-mode whitespace-cleanup-mode typescript-mode tree-mode smartparens paredit nrepl-sync nrepl-eval-sexp-fu multiple-cursors markdown-mode magit-popup magit lispy jsx-mode ivy inflections hydra highlight-chars highlight haskell-mode haskell-emacs git-commit es-windows es-lib emmet-mode edn dash company cljr-helm clj-refactor buffer-utils align-cljlet ace-window))
 '(purescript-mode-hook '(turn-on-purescript-indentation))
 '(show-paren-mode t)
 '(sql-mysql-login-params '(user password server database port))
 '(sql-postgres-login-params
   '((user :default "ndao")
     server
     (database :default "ndao" :completion
               #[771 "\211\242\302=\206
 \211\303=?\2053 r\301\204 p\202( \304 \305!\203% \306!\202& p\262q\210\307\300!$)\207"
                     [#[257 "\300 \207"
                            [sql-postgres-list-databases]
                            2 "

(fn _)"]
                      nil boundaries metadata minibuffer-selected-window window-live-p window-buffer complete-with-action]
                     8 "

(fn STRING PRED ACTION)"]
               :must-match confirm)
     port))
 '(standard-indent 2)
 '(tab-width 2)
 '(typescript-indent-level 2)
 '(vc-annotate-background "#404040")
 '(vc-annotate-color-map
   '((20 . "#c83029")
     (40 . "#db4334")
     (60 . "#959508")
     (80 . "#bcaa00")
     (100 . "#dc7700")
     (120 . "#c9d617")
     (140 . "#319448")
     (160 . "#078607")
     (180 . "#60a060")
     (200 . "#29b029")
     (220 . "#47cd57")
     (240 . "#4c8383")
     (260 . "#1ba1a1")
     (280 . "#0a7874")
     (300 . "#1e7bda")
     (320 . "#00a2f5")
     (340 . "#58b1f3")
     (360 . "#da26ce")))
 '(vc-annotate-very-old-color "#da26ce")
 '(web-mode-attr-indent-offset 2)
 '(web-mode-attr-value-indent-offset 0)
 '(web-mode-enable-auto-indentation t)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-sql-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "medium spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "cyan")))))

;; Global

(pinentry-start)
(set-scroll-bar-mode nil)
(evil-mode 1)
(xclip-mode)
(ido-mode)


(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-set-key (kbd "C-c f t") 'neotree-project-dir)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-c p f") 'helm-projectile-find-file)
(global-set-key (kbd "C-c p g") 'helm-projectile-grep)
(global-set-key (kbd "C-c p s") 'projectile-switch-project)

(global-hl-line-mode t)
(column-number-mode)

;; Temporary directory for auto-save backup files
(setq backup-directory-alist '(("." . "~/.emacs-saves")))


(setq inhibit-startup-screen t)
(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")

(fa-config-default)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(nyan-mode t)
(nyan-start-animation)
(setq nyan-wavy-trail t)
(setq-default nyan-animate-nyancat t)
(setq-default nyan-bar-length 80)

(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode t)

(setq-default indent-tabs-mode nil)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
;;    apropos-do-all t
;;    mouse-yank-at-point t
      require-final-newline t
      visible-bell t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;(desktop-save-mode 1)
(setq-default show-trailing-whitespace t)
(setq max-lisp-eval-depth 10000)

(setq-default line-spacing 2)
;; (global-linum-mode nil)

(add-hook 'after-init-hook 'global-company-mode)
(setq-default company--auto-completion t)



(setq-default fci-rule-color "#bada55")

(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (rainbow-delimiters-mode t)
            (smartparens-mode t)
            (undo-tree-mode t)))

;; Custom indentations
(defun set-prefered-indent (prefered-indent)
  (setq-default css-indent-offset prefered-indent
                js-indent-level prefered-indent
                jsx-indent-level prefered-indent
                standard-indent prefered-indent
                web-mode-markup-indent-offset prefered-indent
                web-mode-css-indent-offset prefered-indent
                web-mode-code-indent-offset prefered-indent
                typescript-indent-level prefered-indent
                json-reformat:indent-width prefered-indent
                web-mode-sql-indent-offset prefered-indent))

(set-prefered-indent 2)

(defun my:set-web-indent ()
  (interactive)
  (set-prefered-indent
   (string-to-int (read-string "indent spaces: "))))

;; auto-complete
(require 'auto-complete)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

;; C and C++
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-header))

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint-load)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load))

(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

;; Helm
;; (require 'helm-config)

(setq helm-M-x-fuzzy-match                  t helm-bookmark-show-location           t
      helm-buffers-fuzzy-matching           t helm-completion-in-region-fuzzy-match t
      helm-file-cache-fuzzy-match           t helm-imenu-fuzzy-match                t
      helm-mode-fuzzy-match                 t helm-locate-fuzzy-match               t
      helm-quick-update                     t helm-recentf-fuzzy-match              t
      helm-semantic-fuzzy-match             t)

;; Projectile
(helm-projectile-on)
(setq projectile-use-git-grep t)

(setq projectile-project-search-path '("~/futu/" "~/__/"))

;; Neo tree
(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
	(file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir (if (neo-global--window-exists-p)
			(progn (neotree-dir project-dir)
			       (neotree-find file-name)))
      (message "Could not find git project root."))))


(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "C")   'neotree-change-root)
            (define-key evil-normal-state-local-map (kbd "U")   'neotree-select-up-node)
            (define-key evil-normal-state-local-map (kbd "r")   'neotree-refresh)
            (define-key evil-normal-state-local-map (kbd "o")   'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "i")   'neotree-enter-horizontal-split)
            (define-key evil-normal-state-local-map (kbd "s")   'neotree-enter-vertical-split)
            (define-key evil-normal-state-local-map (kbd "n")   'evil-search-next)
            (define-key evil-normal-state-local-map (kbd "N")   'evil-search-previous)
            (define-key evil-normal-state-local-map (kbd "ma")  'neotree-create-node)
            (define-key evil-normal-state-local-map (kbd "mc")  'neotree-copy-file)
            (define-key evil-normal-state-local-map (kbd "md")  'neotree-delete-node)
            (define-key evil-normal-state-local-map (kbd "mm")  'neotree-rename-node)
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-stretch-toggle)
            (define-key evil-normal-state-local-map (kbd "gg")  'evil-goto-first-line)))

;; (add-hook 'prog-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'wsd-mode-hook 'company-mode)

;; (setq wsd-style "napkin")
;; (setq wsd-style "qsd")
(setq wsd-style "earth")

;; golang
(add-hook 'before-save-hook #'gofmt-before-save)

(add-hook
 'go-mode-hook
 (lambda()
   (define-key evil-normal-state-local-map
     (kbd "M-.") 'go-guru-definition)
   (flycheck-mode)))


;; TypeScript / JS
;; (require 'flycheck)

;; Set global node exec path
(setq exec-path (append exec-path '("~/.npm-packages/bin")))

;; Use local eslint
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint
          (and root
               (expand-file-name "node_modules/.bin/eslint"
                                 root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; Use local node_modules
(defun my/use-local-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (when root
           (setq-local exec-path (append exec-path '((concat root "/.bin"))))))))

(add-hook 'web-mode-hook #'my/use-local-node-modules)

(require 'tide)
;; (require 'web-mode)

(defun use-web-mode (lst)
  (dolist (file lst)
    (add-to-list
     'auto-mode-alist
     (cons file (lambda ()
                  (web-mode)
                  (web-mode-set-content-type "jsx")
                  (flycheck-mode +1)
                  (setq flycheck-check-syntax-automatically '(save mode-enabled))
                  (graphql-mode +1)
                  ;; (eldoc-mode +1)
                  ;; (company-mode +1)
                  )))))

(use-web-mode
 (list "\\.js\\'"
       "\\.jsx\\'"
       "\\.ts\\'"
       "\\.tsx\\'"
       "\\.nunjucks\\'"
       "\\.syt\\'"))

(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-auto-indentation t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(add-hook
 'web-mode-hook
 (lambda ()
   (when (or (string-equal "jsx" (file-name-extension buffer-file-name))
             (string-equal "js" (file-name-extension buffer-file-name))
             (string-equal "tsx" (file-name-extension buffer-file-name))
             (string-equal "ts" (file-name-extension buffer-file-name)))
     (setup-tide-mode)
     (set-fill-column 120)
     (visual-fill-column-mode)
     (define-key evil-normal-state-local-map
       (kbd "C-M-x") 'nodejs-repl-send-region)
     (define-key evil-normal-state-local-map
       (kbd "M-.") 'tide-jump-to-definition))))

;; configure jsx-tide checker to run after your default jsx checker
(flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(eval-after-load 'web-mode
  '(progn
     (add-hook 'web-mode-hook #'add-node-modules-path)
     (add-hook 'web-mode-hook #'prettier-js-mode)
     ))

;; Clojure
(setq cider-default-repl-command "lein")
(add-hook
 'cider-mode-hook
 (lambda ()
   (define-key evil-normal-state-local-map
     (kbd "M-.") 'cider-find-dwim)))

(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
(add-to-list 'magic-mode-alist '(".* boot" . clojure-mode))

;; Common Lisp

(add-hook
 'slime-mode-hook
 (lambda ()
   (define-key evil-normal-state-local-map
     (kbd "M-.") 'slime-edit-definition)))

;; Tell emacs where is your personal elisp lib dir
;; (add-to-list 'load-path "~/pimpin/slime-docker/")

;; load the packaged named xyz.
;; (load "slime-docker") ;; best not to include the ending “.el” or “.elc”

;; Set your lisp system and, optionally, some contribs

(setq inferior-lisp-program "/usr/bin/sbcl")
;; Do some standard SLIME configuration.
;; (slime-setup '(slime-fancy slime-tramp))

(require 'json)
(require 'flycheck)

(defun my-parse-jslinter-warning (warning)
  (flycheck-error-new
   :line (1+ (cdr (assoc 'line warning)))
   :column (1+ (cdr (assoc 'column warning)))
   :message (cdr (assoc 'message warning))
   :level 'error
   :buffer (current-buffer)
   :checker 'javascript-jslinter))

(defun jslinter-error-parser (output checker buffer)
  (mapcar 'parse-jslinter-warning
          (cdr (assoc 'warnings (aref (json-read-from-string output) 0)))))

(flycheck-define-checker javascript-jslinter
  "A JavaScript syntax and style checker based on JSLinter.
See URL `https://github.com/tensor5/JSLinter'."
  :command ("jslint" "--raw" source)
  :error-parser jslinter-error-parser
  :modes (json-mode))

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode))

;; Python

(setq blacken-executable "~/.pyenv/shims/black")

(add-hook 'python-mode-hook 'blacken-mode)

(add-hook
 'python-mode-hook
 (lambda()
   (define-key evil-normal-state-local-map
     (kbd "M-.") 'elpy-goto-definition)
   (flycheck-mode)))
(setq transient-default-level 5)

;; org-mode
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (define-key evil-normal-state-local-map (kbd "C")
;;               'org-edit-src-exit (kbd "q"))))

;; (defun org-remove-headlines (backend)
;;   "Remove headlines with :notitle: tag."
;;   (org-map-entries (lambda () (let ((beg (point)))
;;                                 (outline-next-visible-heading 1)
;;                                 (backward-char)
;;                                 (delete-region beg (point))))
;;                    "noexport" tree)
;;   (org-map-entries (lambda () (delete-region (point-at-bol) (point-at-eol)))
;;                    "notitle"))

;; (add-hook 'org-export-before-processing-hook #'org-remove-headlines)

(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-agenda-files (quote ("/keybase/private/ndao/notes/todo.org")))

(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)

;;set colours for priorities
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

(setq org-agenda-window-setup (quote current-window))

(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      (quote (
              ("t" "todo"
               entry (file+headline "/keybase/private/ndao/notes/todo.org" "Tasks")
               "* TODO [#A] %?\n  %i\n")

              ("j" "Journal" entry (file+datetree "/keybase/private/ndao/notes/journal.org")
               "* %?\nEntered on %U\n  %i\n  %a")
              )))


;; Cloud formation

;; Set up a mode for JSON based templates

(define-derived-mode cfn-json-mode js-mode
    "CFN-JSON"
    "Simple mode to edit CloudFormation template in JSON format."
    (setq js-indent-level 2))

(add-to-list 'magic-mode-alist
             '("\\({\n *\\)? *[\"']AWSTemplateFormatVersion" . cfn-json-mode))
;; Set up a mode for YAML based templates if yaml-mode is installed
;; Get yaml-mode here https://github.com/yoshiki/yaml-mode

(define-derived-mode cfn-yaml-mode yaml-mode
  "CFN-YAML"
  "Simple mode to edit CloudFormation template in YAML format.")

(add-to-list 'magic-mode-alist
             '("\\(---\n\\)?AWSTemplateFormatVersion:" . cfn-yaml-mode))

;; Set up cfn-lint integration if flycheck is installed
;; Get flycheck here https://www.flycheck.org/
(flycheck-define-checker cfn-lint
  "AWS CloudFormation linter using cfn-lint.

Install cfn-lint first: pip install cfn-lint

See `https://github.com/aws-cloudformation/cfn-python-lint'."

  :command ("cfn-lint" "-f" "parseable" source)
  :error-patterns ((warning line-start (file-name) ":" line ":" column
                            ":" (one-or-more digit) ":" (one-or-more digit) ":"
                            (id "W" (one-or-more digit)) ":" (message) line-end)
                   (error line-start (file-name) ":" line ":" column
                          ":" (one-or-more digit) ":" (one-or-more digit) ":"
                          (id "E" (one-or-more digit)) ":" (message) line-end))
  :modes (cfn-yaml-mode cfn-json-mode))

(add-to-list 'flycheck-checkers 'cfn-lint)
(add-hook 'cfn-json-mode-hook 'flycheck-mode)
(add-hook 'cfn-yaml-mode-hook 'flycheck-mode)

(set-face-attribute 'default nil :family "Tlwg Mono" :height 112 :weight 'bold)
;; (spotify-enable-song-notifications)

;; (defun set-exec-path-from-login-shell ()
;;   "Set `exec-path' and PATH variable from the user's login shell."
;;   (interactive)
;;   (let ((path-from-shell
;;          (replace-regexp-in-string
;;           "[ \t\n]*$" ""
;;           (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))

(setq create-lockfiles nil)
