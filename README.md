## Introduction

This is a copy of my personal vim config files, uploaded to github for version control and sharing inspirations. Please try all or some of these codes if you like those features. Any suggestion is welcome, especially inspirations, nice ideas, technical improvements...

All codes are written by myself, no other plugins are involved yet. Each `.vim` file is mostly independent. Codes tested only on my vim8.0, win7. Cross-plantform issues are also welcome to suggest.

## One-key Compile

[`plugin\my-compiler.vim`](/plugin/my-compiler.vim) provides **1-key compile & run** mappings depending on filetype. You can also set up option switches, which allows you to **switch with 1 key** between `-std=c++98`, `-std=c++11`, `-std=gnu++14` e.g.

+ `<F5>` Compile
+ `<F6>` Run
+ `<F7>` Compile and Run
+ `<F8>` Debug (gdb)

In each function called by filetype autocmd, map these keys to define shell cmdlines. If no autocmd is called (e.g. plain text), they are default `<nop>`. Edit as following in to set up option switches.

`call s:Make('<key>', 'Option', '["opt1","opt2",...]')` makes a option switch list named `'Option'`.

Then by pressing `<key>`, you switch cyclically from "opt1" to "opt2" e.g. and a message is shown.

The value can then be obtained as a String by `s:Get('Option')`, which can be used in `:execute` to form a dynamic cmdline.

Note the List is writen in String form.
`<key>` can also be a sequence of keys, just as used in `map`.  e.g. `'<leader>foo'`

For example
```vim
call s:Make('<F4>', 'cppStandard', '["","-std=c++11","-std=gnu++14"]')
nnoremap <F5> :up<CR>:exe '!g++ %:S -o "%<.exe"' <SID>Get('cppStandard')<CR>
```
Without hitting `<F4>`, compiling cmdline is `!g++ %:S -o "%<.exe"`.
After hitting `<F4>` 2 times, cmdline becomes `!g++ %:S -o "%<.exe" -std=gnu++14`.

For vimscript *Compile* means `:update` and *Run* means `:source %`. For batch / exe files *Run* means `:!%`. Thus for all filetype, `<F7>` means save all changes and try run it.

Edit [`plugin\my-compiler.vim`](/plugin/my-compiler.vim) to meet your environment.

## Auto Complete Pairs

These are in [`_vimrc`](/_vimrc).
*My `<leader>` is `<space>`, change it in `_vimrc` line 50.*

**Auto complete pairs** such as `()` `[]` `{}` `<>`. (`{}` and `<>` are disabled yet because 1-line `{}` and comparisons are common.)

In **visual** mode, `<leader>(` **inserts** a pair of `()` **around selected text**. Others are similar. `<leader>/` comments selected lines off. `<leader>/` and `<leader>{` work linewise, others work charwise.

In **normal** mode, `<leader>d(` **deletes** the nearest pair of `()` **around cursor**. Others are similar. But `<leader>d/` only works when placing cursor on the first line of the multiline comment.

In **normal** mode, `<leader>/` comments current line off. `<leader>dI` / `<leader>dA` delete first / last 2 chars to remove a comment.

## Abbreviations

These are in [`_vimrc`](/_vimrc).
*My `<leader>` is `<space>`, change it in `_vimrc` line 50.*
These are on my own coding habit. Just delete it if you don't like.

+ `#i`,`#d` are short for `#include <`,`#define `.
+ `<leader>xxx` inserts a defult template of codes.
+ When debuging, press `<C-P>` for `fprintf(stderr,...)`.
+ In command mode, `vds` is short for `vertical diffsplit`.

Codes with comments in Chinese in `_vimrc` are quite old, written when I was new to vim.

## Colorschemes

`color Joker` is modified from `evening`, using grayish blue background instead of gray, and using black to highlight cursorline instead of light gray. It also avoids some syntax Error recognition bugs in vim7.4 (which are fixed in vim8.0).

`color devcpp` and `color pascal` are just for fun.
`devcpp` simulates any colorscheme of **Dev-Cpp**.
`pascal` makes your vim looks just like **freePascal**.
Have fun with them!

## Practise

Files under `practise\` arem my exercises and notes made while reading [Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/).
There is a grep-operator plugin and some supports for Potion Language.

## Known Bugs & Wanted Features

May be done and may not. Pleased if you'd like to write and contribute.

+ **Inserting pairs** from visual mode doesn't work at the **last char of a line**.
+ **Inserting pairs** should be rewritten as functions and **mapped as operators**, thus can also be used in normal mode, e.g. `<leader>(t;`.
+ `inoremap <expr>` doesn't work well when nested in other maps where `<C-R>=` seems to work. (`_vimrc` line 75)
