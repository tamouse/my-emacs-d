My `.emacs.d` files.

Useful when setting up a new computer, so I can have all my normal
emacs goodness.

## Installation

Clone to a new computer:

    git clone git@github.com:tamouse/my-emacs-d.git $HOME/.emacs.d
	cd $HOME/.emacs.d
	cp init.el-starter .init.el

Make local changes in `local.org`. For example, overriding some
settings:

```org
* settings
** personal settings

#+BEGIN_SRC emacs-lisp
(setq
 user-mail-address "tamara.temple@work.com"
 user-organization "Work"
 user-signature    (concat user-full-name " <" user-mail-address ">")
 )
#+END_SRC
```

## Keeping up to date

The files `init.el`, `local.org`, and `local.el` are not included in
the git distribution, so they can be modified as needed while not
affecting upstream. Making changes to things like snippets, common,
etc., are good, but make them on a branch and merge in Github to
ensure safety.

## License

Copyright 2017 Tamara Temple <tamara@tamouse.org>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
