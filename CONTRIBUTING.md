# Issue Report Contributions:

* Issues will be closed without being looked into if the following information is missing (unless its not applicable).
* Client version (type `/ver` in game)
* Branch name \(such as [stable](https://github.com/DarkstarProject/darkstar/tree/stable) or [master](https://github.com/DarkstarProject/darkstar/tree/master))


----

# Pull Request Contributions:

All contributions must be done through pull requests to the darkstar repository.  We unfortunately don't have time to take fixes from Discord or the forums to apply ourselves.  If you need help with making a pull request, there is a GitHub guide on how to do so.  If you still need help after consulting the guide, you can ask for help in Discord and we will be happy to help you.

After a pull request is made, if a developer leaves feedback for you to change, you must fix it for your pull request to be merged.  We cannot merge incomplete or misformatted code, and (like before) we don't really have time to fix these ourselves.

Unfortunately, the team is small enough that we can't fix or open pull requests for others, or we would have no time to do anything else.

# Style Guide

### Code Editor Configuration

Much of this can be automated. 

We highly recommend [editorconfig](http://editorconfig.org/#download), which most code editors have either a plugin or native support for.
* [Visual Studio Plugin](https://github.com/editorconfig/editorconfig-visualstudio#readme)
* [Notepad++](https://github.com/editorconfig/editorconfig-notepad-plus-plus#readme)
  * As the plugin manager is usually installed by default\*, the easy way is to use that:
  Launch Notepad++, click on the `Plugins` menu, then `Plugin Manager` -> `Show Plugin Manager`. In the `Available` tab, find `EditorConfig` in the list, check the checkbox and click on the `Install` button.
    * \*64bit may require manual installation.
* [Sublime](https://github.com/sindresorhus/editorconfig-sublime#readme): Install EditorConfig with Package Control and restart Sublime.
* [Vim](https://github.com/editorconfig/editorconfig-vim#readme)

Clang-Format is also an option for C++
* [Visual Studio plugin](https://marketplace.visualstudio.com/items?itemName=LLVMExtensions.ClangFormat)
* [Visual Studio Code plugin](https://marketplace.visualstudio.com/items?itemName=xaver.clang-format)

### General code guidlines (all languages):

* Try not to exceed 120 chars width. Exceptions will occur, but try.
* 4 space indent (death to tabs)
* No using tabs for alignment either.
* Trim trailing whitespace.

### C++

* Unix (LF) line ends
* Braces go on a newline unless it's a lambda or empty ([allman](https://en.wikipedia.org/wiki/Indent_style#Allman_style) style)
* Space between keyword and parentheses
* No using tabs for alignment
* UpperCamelCase for namespaced functions and classes
* UPPER_SNAKE_CASE for ENUM (exception for enum classes: style as classes)
* Asterisk goes up against the type, not the value. We want:
  ```
  Foo* Bar
  ```
  not:
  ```
  Foo *Bar
  ```
  and *definitely* not:
  ```
  Foo * Bar
  ```

### Lua

* Unix (LF) line ends
* Curly braces go on a newline unless empty.
* Our lua functions are typically lowerCamelCased, with few exceptions (just FYI).
* No parentheses unless needed to clarify order of operations.
* No semicolons unless multiple statements on a single line.
* No excess whitespace inside of parentheses solely for alignment.
* *When* aligning (not always needed), it is preferred to do so like this:
  ```
  variable  = thing
  variable2 = thing2
  ```
  not like this:
  ```
  variable1 = thing1
   variable = thing
  ```
  and definitely not like this:
  ```
  if ( variable == thing ) then
  if (variable2 == thing2) then
  ```

### SQL

* Don't put single quotes around non string fields:
  ```
  42,0
  ```
  not:
  ```
  '42','0'
  ```

* No line breaks in the middle of a statement:
  ```
  INSERT INTO table_name (a,b,c,x,y,z);
  ```
  not:
  ```
  INSERT INTO table_name (a,b,c,
  x,y,z);
  ```
* Spaces in names get replaced with an underscore. Hyphens are allowed. Most other symbols are removed from item/mob/npc names *except* for polutils_name or packet_name columns, where they must be escaped.
* Full lower case skill/spell/pet/ability things.
* Don't change SQL keywords to lowercase:
  ```
  INSERT INTO table_name
  ```
  not:
  ```
  insert into table_name
  ```
