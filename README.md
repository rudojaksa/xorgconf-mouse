# Middle-right mouse buttons remap for X

Just a simple middle-to-right mouse buttons remapping `xorg.conf` file.

### Reasoning

Clicking the middle-button (the wheel click) is not comfortable, while the
right button is comfortable.  However, many applications now require a lot of
middle-button usage while they reserve the right button for rarely used
optional actions.

I tested a system-wide remapping of middle and right buttons and after two
months I found that probably I will not return to a standard setup.

### Manual remapping

The `xinput` or `xmodmap -e "pointer = 1 3 2"` can be used.  To use the
`xinput`, first find your current mouse ID, then reassign the second and third
buttons (let's say the mouse ID is 14):

``` sh
xinput | grep Mouse
xinput set-button-map 14  1 3 2
xinput set-button-map 14  1 3 2 4 5 6 7 8 3
```

The last line will also assign the right button to the front side-button, to
avoid any need for wheel-click on a mouse with side buttons.

Map of buttons:

``` sh
 remapped --------  ----------------------------- original
                 1  1 = left button
 right on middle 3  2 = middle button - scroll wheel click
 middle on right 2  3 = right button
                 4  4 = wheel forward
                 5  5 = wheel back
                 6  6 = wheel right
                 7  7 = wheel left
                 8  8 = rear side-button - page back
   right on side 3  9 = front side-button - page forward
```

### Xorg.conf remapping

Xorg.conf setup survives KVM switching, or other input devices events, whitch
will otherwise reset the `xinput` effect.  However, xorg.conf setup is
system-wide.


In the past the mouse was an extension of computer, nowdays it is an
extension of hand.  Anyway, the system-wide setup is more comfortable...

### Installation

The `make install` will copy the supplied `72-mouse.conf` into
`/usr/share/X11/xorg.conf.d/` and if it is not in conflict with any other setup
after the X restart it will become active.

### Debug

To check the current setup, and to check whether xmodmap setup is active:

``` sh
xev -event mouse
xmodmap -pp
```
### Propaganda

Mouse and keyboard have to be user-level configurable, not system level
configurable.  Because interface devices (input devices) belong to a human.
They are not a part of computer as a CPU, GPU, or memory.

<br><div align=right><i>R.Jaksa 2023</i></div>
