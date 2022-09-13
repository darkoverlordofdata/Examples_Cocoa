# Cocoa Examples

Use Objective-c for GUI programming. No Gorm or Xcode required - everything is built usinga a text editor and command line. 

VSCode config included, use ctrl-shift-B to build, F5 to debug using CodeLLDB plugin.

this is a work in progress...

I Install GNUstep using https://github.com/plaurent/gnustep-build. Why not the version in the repo? It's built using gcc. You can try, but ObjectiveC 2.1 requres to be build using clang, leading to possible ABI issues with the gcc built programs.

On FreeBSD there is no gcc version, so just install gnustep and gmake from the repo:
```
sudo pkg install gmame gnustep
```

On FreeBSD, use gmake. On linux, use make.

Recomended settings:
```
defaults write NSGlobalDomain GSUseIconManager NO
defaults write NSGlobalDomain GSSuppressAppIcon YES

defaults write NSGlobalDomain NSMenuInterfaceStyle NSMacintoshInterfaceStyle

or 

defaults write NSGlobalDomain NSMenuInterfaceStyle NSWindows95InterfaceStyle
```

You can install themes, I am using https://github.com/gnustep/plugins-themes-nesedahrik
```
git clone https://github.com/gnustep/plugins-themes-nesedahrik
cd plugins-themes-nesedahrik
make
defaults write NSGlobalDomain GSTheme NesedahRik
```
Modified to work on both macOS and GNUstep on FreeBSD and Linux




