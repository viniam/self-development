:: DOSKEY shortcuts, https://stackoverflow.com/questions/20530996/aliases-in-windows-command-prompt
:: To add to Windows Terminal, add a `/k path/to/alias.bat` to the end of the `commandline` property on the [Settings>Profiles>Command Prompt] (Ctrl+,) page.
:: List all used aliases.
DOSKEY h=DOSKEY /HISTORY

:: List all available aliases.
DOSKEY alias=DOSKEY /macros


:: General shortcuts
:: List files and folders in the current directory.
DOSKEY ls=DIR $* 

:: Create a new directory and navigate to it.
DOSKEY mkdir=mkdir $* && cd $*

:: Search for text within files.
DOSKEY grep=find /i "$*"

:: Open File Explorer in the current directory.
DOSKEY s=start .

:: Go up N directories.
DOSKEY ..=cd ..
DOSKEY ...=cd ..\..
DOSKEY ....=cd ..\..\..
DOSKEY .....=cd ..\..\..\..

:: Go to / directory
DOSKEY /=cd /

:: Python shortcuts
DOSKEY p=python $*
DOSKEY pe=pyenv $*
DOSKEY pe311=pyenv shell 3.11.2
DOSKEY pe38=pyenv shell 3.8.10
DOSKEY pm=python -m $*
DOSKEY pp=python -m pip install $*

:: Activate the virtual environment.
DOSKEY a=.venv\Scripts\activate.bat

:: Deactivate the virtual environment.
DOSKEY d=deactivate


:: Git shortcuts
:: Clone a repository.
DOSKEY gcl=git clone $*

:: Stage changes for commit.
DOSKEY ga=git add $*

:: Commit changes with a message.
DOSKEY gc=git commit -m "$*"

:: Push changes to the remote repository.
DOSKEY gp=git push

:: Switch to a different branch or commit.
DOSKEY gco=git checkout $*

:: See the current status of the repository.
DOSKEY gs=git status

:: See the difference between the working directory and the staging area.
DOSKEY gd=git diff $*

:: See the commit history of the repository.
DOSKEY gl=git log $*

:: Manage the remote repositories.
DOSKEY gr=git remote $*

:: Open the Git repository visualizer in a separate window.
DOSKEY gitk=gitk --all&

:: Clear the screen.
cls