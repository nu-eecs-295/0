---
title: "Assignment 0: Hello World"
author: EECS 295
date: 'Due SOMETIME'
geometry: margin=1in
urlcolor: cyan
---

# Introduction

This exercise will guide you in setting up your working environment for the quarter. By the end you'll be able to write a simple Python program that outputs "Hello World!" to the screen and will be ready for future assignments. First we'll walk through installing Python (our programming language for this course), then installing Visual Studio Code (our text editor for this course) and finally writing our first Python program.

This guide is pretty long with a lot of instructions. I sincerely apologize for that but please make sure everything works for you at all stages along the way so that you don't have to worry about your environment for the rest of the course. And if you have any issues feel free to ask a peer mentor! Okay with that disclaimer let's get started!

# Python

First let's install Python![^1] Python has several versions, for this course we're using `Python 3.7`.[^2] This is the most up to date version. There are many people still using an older variant (`2.7`) but this has been sunsetted and will no longer be supported after 2020. In the interests of learning what will be the future of the language we're teaching `3.7`. If you've used `2.7` before the learning curve for `3.7` will be gentle as there aren't too many changes you'll have to worry about. To install follow the below instructions depending on your OS.[^3]

## Installation

**Note:** If you feel comfortable using a virtual environment manager like `Conda` feel free to use that for this course instead of the following instructions (if you don't know what this means then keep reading for the standard install instructions).

- **macOS:** `Python 2.7` comes preinstalled on macOS. Unfortunately, since we want `3.7` we're going to have to install it separately. Our suggested method involves using a package manager called Homebrew. If you have any questions about this method or would like to install in a different way feel free to ask peer mentors about it at office hours. To use our recommended method follow [this guide](http://docs.python-guide.org/en/latest/starting/install3/osx/). Do everything up until (not including) the section titled "Pipenv & Virtual Environments".
- **Windows:** Our suggested method involves a package manager called Chocolatey. If you have any questions about this method or would like to install in a different way feel free to ask peer mentors about it at office hours. To use our recommended method follw [this guide](http://docs.python-guide.org/en/latest/starting/install3/win/). Do everything up until (not including) the section titled "Pipenv & Virtual Environments".

    **Note:** For installing Chocolatey I recommend using Command Prompt over Powershell since it involves one less step. Simply click on the "Start" button, type "command prompt" and right click on the search result labeled Command Prompt then choose `Run as administrator" in the resulting menu. See below for an example photo:

    ![Run as Admin](../images/0/run_as_administrator.png "Run as admin"){height="3in"} \

- **Linux:** There are too many Linux variants to attempt to cover them all but general advice is use a package manager and go to office hours with any questions or difficulties installing.

## Confirm Installation

To confirm everything is working right open up your command line (Command Prompt on Windows, Terminal on macOS/Linux) and type `python` then hit Enter. You should see something like the following (this is an example run on Windows though it should look similar on every platform, really the only change is it will list OS specific architecture in the right hand corner, in this case it's `win32`, on recent macOS models it's `darwin`):

![Command Prompt](../images/0/confirm_windows_installation.png "Confirming Installation") \

If you see something similar and as long as your Python version says `3.7.<anything here>` you're all good! Go ahead and close your command line and move on to the next step.[^4] If not, come to see Sara or a peer mentor for help.

**Note:** If you see `2.7.<anything here>` instead, try typing `python3` then hitting enter and seeing if that gives you something like the image above with `3.7.<anything here>` for the version. If it does then feel free to ask a peer mentor how to make `python` launch `Python 3.7` by default but be aware that you can continue this guide swapping in `python3` anywhere you see `python` and `pip3` anywhere you see `pip`. If neither of these work try restarting your computer and running again, then go to a peer mentor for assistance if that doesn't change anything.

# Our Text Editor - Visual Studio Code

Next we're going to install the text editor we're using for this course. There are many different text editors out there that you're welcome to explore but for this course we're going to be using Visual Studio Code (referred to as VSCode from here on).

## Installation

Go to [this page](https://code.visualstudio.com/Download) and download the appropriate installer. Once the installer downloads follow the prompts to install (simply clicking next on each screen and accepting the defaults will work just fine). Once it's installed open it up and you should see a screen like this:

![VSCode](../images/0/welcome.png "Welcome Page") \

VSCode has almost unlimited configuration and customization options along with numerous capabilities that we won't be using in this class. Feel free to explore these as you'd like but for this guide we'll focus on a small subset of features.

## Add Python Support

First things first let's add Python support. To do so we need to install an extension and set VSCode's Python path. Almost everything I'm about to walk through can be done with keyboard shortcuts (which I'll try to list) if you like using them but I'll be prioritizing menu items as these are more universal across OSes. Note: if you see an error "Unknown configuration setting" while working through this section first try restarting VSCode before asking Sara or a TA for assistance.

### Extension

First click on `View->Extensions` (macOS/Win: `(Cmd|Ctrl)+Shift+x` or click on the square icon at the bottom of the leftmost sidebar) and then type "Python" in the search box. We want to install the extension just titled "Python" which is made by Microsoft:

![Extensions](../images/0/python_extension.png "Extensions") \

Click install beside that extension then click the reload button that shows up once installed. Perfect we now have Python support!

### Python Path

Open a new file by clicking `File->New File` (or `(Cmd|Ctrl)+N`). Next, set the language for this file to Python by clicking `View->Command Palette` (or `(Cmd|Ctrl)+Shift+P`) and type "language". From the list of results that pops up choose "Change Language Mode". Then type "Python" in the resulting search box and select Python from the list. Now look in the lower left hand corner (see below photo for an example) and confirm that it says `Python 3.7.<anything-else>`. If it does skip ahead to the next section titled **Extension**. If you don't see anything try restarting VSCode. If it shows `Python 2.<anything-else>` stick around and we'll fix it. **Note:** for Conda users you'll want to set this to the path to the `python` instance in the `bin` folder of your virtual environment.

![Python 3](../images/0/python_3.png "Python 3") \

To make it so that you get `Python 3.7.<anything-else>` open up VSCode settings by clicking on the cog in the lower left then "Settings" or find the Settings option in the menu (`Code->Preferences->Settings` on macOS, `File->Preferences->Settings` on Windows) or use the keyboard shortcut `Cmd/Ctrl+,`. This will open two panes, in the right one (where it says "User Settings") we want to add the following code:

```json
{
    "python.pythonPath": "<path_to_python_installation>"
}
```

You need to replace `<path_to_python_installation>` with the actual location of the Python 3 installation on your computer. On macOS for example this is the path: `/usr/local/bin/python3`. Note: on Windows this path would normally use backslashes but here you should use either forward slashes or double backslashes, e.g. `C:/Users/nathan/<rest of path>` or `C:\\Users\\nathan\\<rest of path>` (if you're curious why ask one of the TAs about escape characters). The easiest way to find where Python 3 is installed on your computer is to run one of the following commands (depending on your OS) in terminal or command prompt:

```bash
where python # Windows
which python # macOS/Linux
```

Here's an example of the output (run on macOS, note I'm running `which python3` because I have multiple Python installations, you should not type the 3 unless back in the confirm installation section running `python` didn't show `3.7.<anything-else>`):

![Which Python](../images/0/which_python.png "Which Python"){width="3in"} \

Now write the path that `which/where python` gives you in place of `"<path_to_python_installation>"` in the settings pane. At the end you should have something that looks like this:

![Python Path](../images/0/python_path.png "Python Path") \

Confirm that after restarting VSCode and selecting the language Python as before you now see `3.7.<anything>` in the lower left hand corner. If not go to mentor hours. Whew, okay let's move on to setting up the rest of our Python support!

## Add Linting

Linting is a form of statically checking programs to catch certain errors before running. The linter we install will help by checking types (Python 3's support for type hints is another reason we're using it over Python 2) and preventing silly mistakes.

Setting up this linter requires two steps. First, run the following command in the terminal (or Command Prompt):

```bash
pip install mypy
```

You should see something like this (run on macOS):

![Pip Install MyPy](../images/0/mypy_install.png "Pip Install MyPy") \

This command will install our linter (if you're curious `pip` is a package manager bundled with Python 3 for installing Python libraries that we'll discuss more later in the course). Next, we need to configure our linter.

To configure our linter we need to open up VSCode's settings. Click on the cog in the lower left then "Settings" or find the Settings option in the menu (`Code->Preferences->Settings` on macOS, `File->Preferences->Settings` on Windows) or use the keyboard shortcut `Cmd/Ctrl+,`. This will open two panes, in the right one (where it says "User Settings") we want to add the following code (**Note:** the whole settings is a single JSON dictionary, so if you added the python path previously the settings below would be two more lines inside the outer curly brackets, not inside a nested pair of brackets):

```json
{
    "python.linting.mypyEnabled": true,
    "python.linting.pylintEnabled": false
}
```

After adding these our settings file will look something like this (potentially with an extra setting from modifying our path if you had to do that earlier):

![Linter Settings](../images/0/linter_settings.png "Linter Settings"){height="2in"} \

Let's test this out. Open a file and switch the language to Python by clicking `View->Command Palette` (or `(Cmd|Ctrl)+Shift+P`) and type "language". From the list of results that pops up choose "Change Language Mode". Then type "Python" in the resulting search box and select Python from the list. Once we're in Python type the following in your new file:

```python
'hi' + 1
```

Save the file with any name and you should notice some weird red squiggles under the `'hi'` (if you don't see these try restarting VSCode). Hover over this to see the message screenshotted below:

![Linter Error](../images/0/linting_error.png "Linter Error") \

This message is telling us we can't add a `str` (Python's shorthand for `string`) and an `int` (an integer). This sort of type checking will come in super helpful as we continue to write programs later in this class. Okay now with everything set up let's write our first program and run it!

# Working in Python

In this class we'll be writing Python code in VSCode and running our programs from either VSCode or the Command Line. First let's write a simple program. Open a new file by going to `File->New File` (or `(Cmd|Ctrl+n`) and set the language to Python. We'll simply write `print('Hello World!')` on the first line of our file. Like below:

![Hello World](../images/0/hello_world.png "Hello World!"){width="6in"} \

Now save this file (`File->Save` or `(Cmd|Ctrl)+s`) calling it whatever you want making sure to have a `.py` extension at the end of it (VSCode should insert this extension for us since we changed the language mode to Python earlier). We've written a Python program, now let's run it!

## VSCode

### Setting Our Launch Configuration

First we need to set our launch configuration. Open up settings again (see the `Add Linting` section) and add the following code:

```json
"launch": {
    "configurations": [
        {
            "name": "Global Python",
            "type": "python",
            "request": "launch",
            "program": "${file}",
            "stopOnEntry": true,
            "internalConsoleOptions": "openOnSessionStart"
        }
    ]
}
```

If you had to add your Python path earlier your settings should like the following, if not then they should look the same minus the `python.pythonPath` line:

![Final Settings](../images/0/final_settings.png "Final Settings") \

### Running Code

Okay now let's run our code! Go to `View->Debug` (or click on the icon with the crossed out bug in the left sidebar). In the resulting view click the dropdown next to the green play button in the top left and from the menu select `Global Python` (the name of the launch configuration we just added in settings). Now click the green play button and you should see something like this (**Note:** if you see a dropdown with with multiple options such as `Python Experimental` choose the option that just says `Python`):

![Run Python VSCode Debugger](../images/0/debugger.png "Run Python VSCode Debugger") \

Now click the green play button button in the center at the top of your screen to view the output of your program in the Debug Console on the bottom of the screen. Don't worry about what everything in this view means, we'll get to it all over the first couple weeks of class. Whew, you're officially done with the first assignment! [^5] There isn't anything to turn in so as long as you've successfully completed everything in this guide you're all good! The rest of this guide is optional if you're interested in playing around more with python or VSCode. Feel free to do as much or little of it as you'd like.

## Just For Fun

### Command Line: Integrated Terminal

So we just ran Python using the VSCode debugger now let's try running it through the command line! VSCode actually has an integrated command line that we can open by going to `View->Integrated Terminal`. Note: for Windows users this will likely open to Powershell, change this by clicking `View->Command Palette` (or `(Cmd|Ctrl)+Shift+p`) then type "select default shell", choose the "Terminal: Select default shell" option and in the resulting menu select "Command Prompt".

For running Python files from the command line we need to be in the same folder as the file we want to run. To do so we need to be able to navigate the command line. Sara will cover how to navigate the command line during the first lecture and for more help see the following guides for navigating the command line (or come to peer mentor hours):

- [Windows](http://www.digitalcitizen.life/command-prompt-how-use-basic-commands)
- [macOS and Linux](http://www.macworld.com/article/2042378/master-the-command-line-navigating-files-and-folders.html)

Once we're in the folder that our Python file is in simply type `python <filename>`. Do this with the file you've just written, so if you named the file `hello_world.py` you'd write `python hello_world.py` and you should see 'Hello World!' outputted to the screen like below (note that you want to write the full filename with the ".py" extension):

![Run Python Integrated Terminal](../images/0/integrated_terminal.png "Run Python Integrated Terminal") \

### Command Line Part II: This Time It's External

We've now run python code from the integrated terminal but we can also run code from an external terminal like we did to confirm installation. Open up your terminal (Command Prompt for Windows) like we did before, navigate to the folder just like we did for the integrated terminal and once again type `python <filename>` to see 'Hello World!' like below:

![Run Python External Terminal](../images/0/external_terminal.png "Run Python External Terminal") \

## VSCode Tips

Here's a few tips and things to explore in VSCode:

1. Go to `View->Explorer` (or click on the top icon in the left sidebar that looks like overlapping documents) to see a list of the current open files and a button to open a folder. Click on that button and choose a random folder on your computer to see that folder and its contents and be able to navigate it and open files from it within VSCode. This has the added benefit that the integrated terminal will automatically open to the opened folder you opened. The below screenshot shows my VSCode with a folder called `grading` open. I can then see and open any of the subfolders and files in this folder more easily (`(Cmd|Ctrl)+P` opens a file searcher that searches through the open folder). ![Open Folder](../images/0/open_folder.png "Open Folder") \
2. Go to `File->Preferences->Color Theme` if you'd like to adjust the colors of the editor. More themes can be found [here](https://marketplace.visualstudio.com/search?target=VSCode&category=Themes&sortBy=Downloads).
3. Go to `File->Preferences->File Icon Theme` if you'd like icons in tabs or next to files/folders in the Explorer view. More icon themes can be found [here](https://marketplace.visualstudio.com/search?target=VSCode&category=Themes&sortBy=Downloads).
4. Go to `File->Preferences->Keyboard Shortucts` or `File->Preferences->Settings` to play around with the default settings or keybindings.

[^1]: Python is a widely used programming language older than us. Click [here](https://docs.python.org/3/) to view the official documentation.

[^2]: Python versions have three numbers, for example Python `3.7.1` but for this course any Python version that starts with `3.7` will work just fine!

[^3]: Linux users try the Confirm Installation step and if you get the expected result then you're all good and can keep going with this guide. If not go to Sara or one of the peer mentors for help.

[^4]: What we just started by typing `python` and hitting enter is called the Python Interpreter. This is an interactive environment like the REPL we had in 111 where you can write Python code and immediately see the result. For an example type `5+5` and hit enter. The interpreter will display 10 and then wait for your next instruction. Feel free to play around in the shell further if you'd like. To exit the shell and get back to your regular command line type `exit` and hit enter for macOS, on Windows type `exit()` and hit enter.

[^5]: [Hip hip hooray!](https://media.giphy.com/media/26gsfdArwyEnXnDGw/giphy.gif)