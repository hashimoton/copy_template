***********************
copy_template
***********************

copy_template.pl is an alternative of "new" context menu on Windows.
You can use any folder to collect template files and select them in the file open dialog.

==========================
PLATFORMS
==========================

* Works on Windows XP and 7.

* Not tested on Windows Vista, 8, and 8.1.

==========================
REQUIREMENTS
==========================

* ActivePerl 5.10.0 or later(since this script depends on Tkx).

==========================
SETUP
==========================

1. Edit copy_template.pl.
2. Modify $TemplateDir, it is the path to your template files.
3. Modify $RuntimeCharSet, it is the default encoding og your Windows.
4. Run regedit.exe.
5. Create a new key under HKEY_CLASSES_ROOT\Directory\Background\shell.
6. Edit the new key as
   * name=Template
   * value=Copy Template
   The text in the value will appear when you right-click on background of a folder.
7. Create a sub key as
   * name=command
   * value=\path\to\wperl.exe \path\to\copy_template.pl "%V"

==========================
TODO
==========================

* Get encoding automatically.
* Check overwriting.

==========================
LICENSE
==========================

Public Domain

