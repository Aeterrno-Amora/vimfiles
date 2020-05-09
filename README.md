## Introduction

My vim config files. Contents under the `vimfiles` directery except installed plugins.

## Major Features

+ [`vimrc`](/vimrc)
+ [`plugin/my-compiler.vim`](/plugin/my-compiler.vim): Easily setup 1-key commands whose arguments rotate dynamically among several frequently used options.
+ [`plugin/debug-marker.vim`](/plugin/debug-marker.vim): Insert TODO marks that can be either hidden or shown.
+ [color schemes](/colors/): `Joker.vim` is usually used. Others were written for fun -- mimicking appearances of [Free Pascal](https://www.freepascal.org/) or [Dev-C++](https://sourceforge.net/projects/dev-cpp/).

## Known Bugs

`inoremap <expr>` nested in other mappings doesn't work well while `<C-R>=` does work. (vimrc [line 83](/vimrc#L83))
