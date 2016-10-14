= file-complete

* https://github.com/bhenderson/weechat-file-complete

== DESCRIPTION:

Weechat ruby plugin to add completions from files

== FEATURES/PROBLEMS:

* Reads a glob of files and for each line, add tab completion. Strips comments
  '#'
* Adds a file-complete command to lookup what the completions are. Comments
  are shown, useful for displaying a url of the corresponding emoji for
  example.

== SYNOPSIS:

  /ruby load file-complete.rb
  /set plugins.var.ruby.file-complete.glob </path/to/completions>
  /set weechat.completion.default_template <old value>|%(file-complete)

== REQUIREMENTS:

* https://github.com/bhenderson/weechat-ruby # my fork

== INSTALL:

* Copy file to $WEECHAT_HOME/ruby/autoload

== LICENSE:

(The MIT License)

Copyright (c) 2016 Brian Henderson

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
