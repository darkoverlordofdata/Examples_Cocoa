# Cocoa Examples

Use Objective-c for GUI programming. No Gorm required - everything is built using just a text editor and command line. 

VSCode config included, use ctrl-shift-B to build, F5 to debug using CodeLLDB plugin.

this is a work in progress...

I Install GNUstep using https://github.com/plaurent/gnustep-build. Why not the version in the repo? It's built using gcc. You can try, but ObjectiveC 2.1 requres to be built using clang, leading to possible ABI issues with the gcc built programs.

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
cp NesedahRik.theme ~/GNUstep/Library/Themes
defaults write NSGlobalDomain GSTheme NesedahRik
```
Modified to work using GNUstep on FreeBSD and Linux


## Gap

* Some enumerations are not found or remapped
* Asynchronous methods not avalable

## Working 

* Application
* Button
* CheckBox
* Label
* ListBox
* PictureBox
* ProgressBar
* RadioButton
* SwitchButton
* TextBox
* ToggleButton
* TrackBar
* ColorDialog
* FolderBrowserDialog
* FontDialog
* MessageBox
* OpenFileDialog
* SaveFileDialog
* Timer
* GroupBox
* Panel
* TabControl
* Window
* HelloWorld

## Not Working

* ApplicationWithMessageLoop: events
* ApplicationIde: uses Mach
* ComboBox
* Drawing: not drawing 
* WindowAndMessages: events  
* MainMenu: ???
* ColoredTabPages: ???