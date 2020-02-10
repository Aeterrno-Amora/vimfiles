## Introduction

This is a copy of my personal vim config files, uploaded to github for version control and sharing inspirations. Please try all or some of these codes if you like those features. Any suggestion is welcome, especially inspirations, nice ideas, technical improvements...

All codes are written by myself, no other plugins are involved yet. Each `.vim` file is mostly independent. Codes tested only on my vim8.0, win7. Cross-plantform issues are also welcome to suggest.

## One-key Compile

[`plugin\my-compiler.vim`](/plugin/my-compiler.vim) provides **1-key compile & run** mappings depending on filetype. You can also set up option switches to control dynamic compilers, which allow you to **switch with 1 key** between e.g. `-std=c++98`, `-std=c++11`, `-std=gnu++14`.

+ `<F5>` Compile
+ `<F6>` Run
+ `<F7>` Compile and Run (=`<F5><F6>`)
+ `<F8>` Debug (gdb)

In each autocmd of corresponding filetype, buffer-local nnoremap `<F5>` `<F6>` `<F8>` to appropriate cmdlines. `<F5>` is `:up` by default and others are `<nop>`.

For a dynamic compiler, follow these steps:

* `call s:Init()` first to initialize a data structure.

* `call SetSwitch('<key>', 'Name', ['opt1','opt2',...])` to make a option switch list named 'Name'.  
  Then by pressing `<key>`, you switch cyclically from "opt1" to "opt2" etc. and a message is shown.  
  `<key>` can also be a sequence of keys, just as what you use in `map` (e.g. `'<leader>foo'`).
* `call Compiler(...)` to map `<F5>` to a cmdline. It parses arguments in order. Each String is left unchanged, items of each List of `'Name'` or List of `'<key>'` get dynamic values from corresponding switches. Arguments are then concatenated without space.

For example
```vim
call s:Init()
call Switch('<F4>', 'Standard', ['',' -std=c++11',' -std=gnu++14'])
call Compiler('!g++ %:S -o "%<.exe"', ['Standard'])
```
Now start a new buffer and `<F5>` will execute `!g++ %:S -o "%<.exe"`.
After hitting `<F4>` 2 times, cmdline becomes `!g++ %:S -o "%<.exe" -std=gnu++14`.

Edit [`plugin\my-compiler.vim`](/plugin/my-compiler.vim) to meet your needs and environments.

## Debug Statements Marker

Nervous about forgetting cleaning up your debug statements when doing competitive programming? Here's a solution in [`plugin\debug-marker.vim`](/plugin/debug-marker.vim).

It's currently designed for C/C++. In **insert mode**, ``` inserts a invisible marker. Or use `<leader>g` in **normal mode** to mark at the end of a line. To be precise, markers are in `Conceal` highlighting group.

When preparing to submit code, press `<F9>` to reveal and search all markers. To continue debuging, press `<S-F9>` to reset them invisible.

## Auto Complete Pairs

These are in [`vimrc`](/vimrc).
*My `<leader>` is `<space>`, change it at [line 37](/vimrc#L37).*

**Auto complete pairs** such as `()` `[]` `{}` `<>`. (`{}` and `<>` are disabled because 1-line `{}` and comparisons are common.)

In **visual** mode, `<leader>(` **inserts** a pair of `()` **around selected text**. Others are similar. `<leader>/` comments selected lines off. `<leader>/` and `<leader>{` work linewise, others work charwise.

In **normal** mode, `<leader>d(` **deletes** the nearest pair of `()` **around cursor**. Others are similar. `<leader>d/` deletes a pair of `/*` `*/`.

In **normal** mode, `<leader>/` comments current line off. `<leader>dI` / `<leader>dA` delete first / last 2 chars to remove a comment.

## Abbreviations

These are in [`vimrc`](/vimrc).
*My `<leader>` is `<space>`, change it at [line 37](/vimrc#L37).*
These are on my own coding habit. Just delete it if you don't like.

+ `#i`,`#d` are short for `#include <`,`#define `.
+ `<leader>xxx` inserts a defult template of codes.
+ When debuging, press `<C-P>` for `fprintf(stderr,...)`.
+ In command mode, `vds` is short for `vertical diffsplit`.

Codes with comments in Chinese in `vimrc` are quite old, written when I was new to vim.

## Colorschemes

`color Joker` is modified from `evening`, using grayish blue background instead of gray, and using black to highlight cursorline instead of light gray. It also avoids some syntax Error recognition bugs in vim7.4 (which are fixed in vim8.0).

`color devcpp` and `color pascal` are just for fun.
`devcpp` simulates any colorscheme of **Dev-Cpp**.
`pascal` makes your vim looks just like **freePascal**.
Have fun with them!

## Practise

Files under `practise\` are my exercises and notes made while reading [Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/).
There is a grep-operator plugin and some supports for Potion Language.

## Known Bugs & Wanted Features

May be done in the future and may not. Pleased if you'd like to write and contribute.

+ **Inserting pairs** from visual mode doesn't work at the **last char of a line**.
+ **Inserting pairs** should be rewritten as functions and **mapped as operators**, thus can also be used in normal mode (e.g. `<leader>(t;`).
+ `inoremap <expr>` doesn't work well when nested in other maps where `<C-R>=` seems to work. (vimrc [line 83](/vimrc#L83))
