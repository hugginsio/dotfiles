;; $DOOMDIR/init.el -*- lexical-binding: t; mode: Lisp; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).

;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input

	:completion
	company             ; the ultimate code completion backend
	vertico             ; the search engine of the future

	:ui
	doom                ; what makes DOOM look the way it does
	doom-dashboard      ; a nifty splash screen for Emacs
	(emoji +unicode)    ; 🙂
	hl-todo             ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
	;;indent-guides     ; highlighted indent columns
	ligatures           ; ligatures and symbols to make your code pretty again
	modeline            ; snazzy, Atom-inspired modeline, plus API
	ophints             ; highlight the region an operation acts on
	(popup +defaults)   ; tame sudden yet inevitable temporary windows
	;;tabs              ; a tab bar for Emacs
	treemacs            ; a project drawer, like neotree but cooler
	(vc-gutter +pretty) ; vcs diff in the fringe
	vi-tilde-fringe     ; fringe tildes to mark beyond EOB
	workspaces          ; tab emulation, persistence & separate workspaces
	;;zen               ; distraction-free coding or writing

	:editor
	(evil +everywhere)  ; come to the dark side, we have cookies
	file-templates      ; auto-snippets for empty files
	fold                ; (nigh) universal code folding
	(format +onsave)    ; automated prettiness
	multiple-cursors    ; editing in many places at once
	;;objed             ; text object editing for the innocent
	snippets            ; my elves. They type so I don't have to
	word-wrap           ; soft wrapping with language-aware indent

	:emacs
	dired               ; making dired pretty [functional]
	electric            ; smarter, keyword-based electric-indent
	undo                ; persistent, smarter undo for your inevitable mistakes
	vc                  ; version-control and Emacs, sitting in a tree

	:term
	vterm               ; the best terminal emulation in Emacs

	:checkers
	syntax              ; tasing you for every semicolon you forget
	(spell +flyspell)   ; tasing you for misspelling mispelling

	:tools
	;;ansible
	;;debugger          ; FIXME stepping through code, to help you add bugs
	docker
	editorconfig        ; let someone else argue about tabs vs spaces
	(eval +overlay)     ; run code, run (also, repls)
	lookup              ; navigate your code and its documentation
	lsp                 ; M-x vscode
	magit               ; a git porcelain for Emacs
	pdf                 ; pdf enhancements
	;;terraform         ; infrastructure as code
	tree-sitter         ; syntax and parsing, sitting in a tree...

	:os
	(:if IS-MAC macos)  ; improve compatibility with macOS
	tty                 ; improve the terminal Emacs experience

	:lang
	;;csharp            ; unity, .NET, and mono shenanigans
	data                ; config/data formats
	emacs-lisp          ; drown in parentheses
	(go +lsp)           ; the hipster dialect
	;;(graphql +lsp)    ; Give queries a REST
	json                ; At least it ain't XML
	(java +lsp)         ; the poster child for carpal tunnel syndrome
	javascript          ; all(hope(abandon(ye(who(enter(here))))))
	;;kotlin            ; a better, slicker Java(Script)
	;;latex             ; writing papers in Emacs has never been so fun
	markdown            ; writing docs for people to ignore
	;;nix               ; I hereby declare "nix geht mehr!"
	org                 ; organize your plain life in plain text
	;;python            ; beautiful is better than ugly
	rest                ; Emacs as a REST client
	;;rst               ; ReST in peace
	;;(rust +lsp)       ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
	sh                  ; she sells {ba,z,fi}sh shells on the C xor
	web                 ; the tubes
	yaml                ; JSON, but readable

	:app
	calendar
	;;everywhere        ; *leave* Emacs!? You must be joking
	;;(rss +org)        ; emacs as an RSS reader

	:config
	;;literate
	(default +bindings +smartparens))
