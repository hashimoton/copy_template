***********************
copy_template
***********************

copy_template.pl is an alternative of "new" context menu on Windows.
You can use any folder to collect template files and select them in the file open dialog.

==========================
Platforms
==========================

* Works on Windows XP/7/10.

* Not tested on Windows Vista, 8, and 8.1.

==========================
Requirements
==========================

* ActivePerl 5.10.0 or later(since this script depends on Tkx).

==========================
Setup
==========================

1. Open copy_template.pl with a text editor.
2. Modify $TemplateDir, it is the path to your template files.
3. Run regedit.exe.
4. Create a new key under HKEY_CLASSES_ROOT\Directory\Background\shell.
5. Edit the new key as:

::

  name=Template
  value=Copy Template
  
  The text in the value will appear when you right-click on background of a folder.

6. Create a sub key as:

::

  name=command
  value=\path\to\wperl.exe \path\to\copy_template.pl "%V"

==========================
Todo
==========================

* Configuration file for the template directory.

==========================
License
==========================

Public Domain


