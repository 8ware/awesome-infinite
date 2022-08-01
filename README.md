
Infinite—Access your Awesome tags on whichever screen you like
==============================================================

When working with external monitors and a docking station tags are distributed
over multiple screens. If the screen count is reduced (e.g. by connecting to a
beamer while mirroring the laptop screen) all clients are moved to tag 1.

Infinite allows to access statically defined taglists from all screens by
moving the desired one to the currently focused screen. The previously active
tasklist is shelved to a hidden screen so that the usual keybindings can be
used to view tags 1–9.


Setup :wrench:
-----

```
cd .config/awesome/
git clone https://github.com/8ware/awesome-infinite.git infinite
patch rc.lua infinite/rc.lua.patch
```


Credits :coin:
-------

This module was inspired by Drauthius' [sharedtags](https://github.com/Drauthius/awesome-sharedtags).

