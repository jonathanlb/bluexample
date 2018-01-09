# Bluexample
Provide a simple example to scan for BlueToothLE peripherals from OS X and print peripherals to the console.

Early January 2018, I could not find working examples to access BlueTooth from OS X.  [BlueCove](http://bluecove.org) doesn't work with 64-bit Java and, outside [OpenJDK](http://openjdk.java.net/projects/macosx-port), modern Java no longer operates in 32-bit mode.  The Swift and Objective-C examples I found on-line were either incomplete, or failed to specify enough options to configure BlueTooth scanning.

I've only "tested" the example with the following environment.

- 2015 MacBook Pro
- macOS version 10.13.2
- [Crazepony Mini Quadcopter](http://www.crazepony.com/products/mini.html)