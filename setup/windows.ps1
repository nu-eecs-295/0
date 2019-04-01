# manual installation guide here
# TODO: add link here

# helpful Stack Overflow answer for general powershell scripting
# ref - https://stackoverflow.com/a/48144315/5121636

# refresh environment variables to use just installed packages
# ref - https://stackoverflow.com/a/17794885/5121636
function Refresh-EnvironmentVariables {
  $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
}

# install Chocolatey if not already installed
# ref - https://chocolatey.org/install#install-with-powershellexe
function Install-Chocolatey {
  if (!(Get-Command choco.exe -ErrorAction SilentlyContinue)) {
    try {
      iex ((New-Object System.Net.WebClient).
        DownloadString('https://chocolatey.org/install.ps1'))
    } catch {
      "Failed to install Chocolatey, ask a peer mentor or try manual instructions"
      # ref - https://stackoverflow.com/a/23703056/5121636
      exit
    }
  }
}

# install python if not already installed
# ref - https://chocolatey.org/packages/python
function Install-Python {
  if (!(Get-Command python.exe -ErrorAction SilentlyContinue)) {
    try {
      choco install -y python
    } catch {
      "Failed to install Python, ask a peer mentor or try manual instructions"
      exit
    }
  }
}

# install `pip`
# ref - https://docs.python-guide.org/starting/install3/win/#setuptools-pip
function Install-Pip {
  try {
    python -m pip install -U pip | out-null
  } catch {
    "Failed to install pip, ask a peer mentor or try manual instructions"
    exit
  }
}

function Install-Linter {
  try {
    pip install mypy | out-null
  } catch {
    "Failed to install mypy (linter), ask a peer mentor or try manual instructions"
    exit
  }
}

function SetUp-PythonAndPip {
  Install-Python
  Refresh-EnvironmentVariables
  Install-Pip
  Refresh-EnvironmentVariables
  Install-Linter
}

# install [Visual Studio Code](https://code.visualstudio.com/)
# ref (installation options & details) - https://chocolatey.org/packages/vscode
# check if Windows application installed
# ref - https://keestalkstech.com/2017/10/powershell-snippet-check-if-software-is-installed/
function Install-VSCode {
  try {
    code -v | out-null
  } catch {
    try {
      choco install -y vscode
      Refresh-EnvironmentVariables
    } catch {
      "Failed to install VSCode, ask a peer mentor or try manual instructions"
      exit
    }
  }
}

function Install-VSCodeExtensions {
  if (!((code --list-extensions) -like '*ms-python.python*')) {
    # Microsoft's Python extension
    # ref - https://marketplace.visualstudio.com/items?itemName=ms-python.python
    code --install-extension 'ms-python.python'
  }
}

# add user settings
function Configure-VSCode {
  # abort early if they already have settings
  if(Test-Path "$env:APPDATA\Code\User\settings.json" -PathType Leaf) {
    "You seem to already have some configured settings. You'll need to manually"
    " add settings (see the manual installation guide)."
    return
  }

  $vscode_settings_file_path = "$env:APPDATA\Code\User\settings.json"
  $vscode_settings_file_url='https://raw.githubusercontent.com/nu-eecs-295/0/master/setup/vscode_settings.json'

  # TODO: better error handling here
  (New-Object System.Net.WebClient).
    DownloadFile("$vscode_settings_file_url", "$vscode_settings_file_path")

  # ref - https://www.kittell.net/code/powershell-unix-sed-equivalent-change-text-file/
  (Get-Content "$vscode_settings_file_path").replace(
    '<path_to_python_installation>',
    (
      # ref - https://stackoverflow.com/a/16949127
      "$(Get-Command python | Select-Object -ExpandProperty Definition)" `
        -replace '\\', '/'
        # ^ comment below applies to above line
        # matches a single `\` in path, first `\` escapes the second `\`
        # could also do `-replace '\\', '\\'` to use double backslash in path
        # ref - https://stackoverflow.com/a/53867845
      )
  ) | Set-Content "$vscode_settings_file_path"
}

function SetUp-VSCode {
  Install-VSCode
  Install-VSCodeExtensions
  Configure-VSCode
}

# install git if not already installed
# ref - https://chocolatey.org/packages/git
function Install-Git {
  if (!(Get-Command git.exe -ErrorAction SilentlyContinue)) {
    try {
      choco install -y git
      Refresh-EnvironmentVariables
    } catch {
      "Failed to install Git, ask a peer mentor or try manual instructions"
      exit
    }
  }
}

# install if not already installed, add `user.name` & `user.email` configs
function SetUp-Git {
  Install-Git

  # set git `user.name` and `user.email` variables if not already
  # needed to interact with GitHub
  if (!((git config --list) -like "*user.name=*")) {
    # get user input
    # ref - https://stackoverflow.com/a/8184861/5121636
    $git_user_name = Read-Host 'What is your name?'
    git config --global user.name "$git_user_name"
  }

  if (!((git config --list) -like "*user.email=*")) {
    $git_user_email = Read-Host 'What is your email? (what you use for GitHub)'
    git config --global user.email "$git_user_email"
  }
}

# <<<<<<<< script execution starts here >>>>>>>>

# allow running of downloaded scripts, only for this process
# ref - https://stackoverflow.com/a/16141428/5121636
Set-ExecutionPolicy Bypass -Scope Process -Force

Install-Chocolatey
# must install python and pip before vscode to add to settings correctly
SetUp-PythonAndPip
SetUp-VSCode
SetUp-Git

"Installation successful! Last thing to do is set up VSCode settings"
"Follow the manual instructions to complete that"
