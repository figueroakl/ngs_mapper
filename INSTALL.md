# Installation

1. Clone

  Assumes you already have git installed. If not you will need to get it installed by your system administrator.

  ```
  git clone https://githubusername@github.com/VDBWRAIR/miseqpipeline.git
  cd miseqpipeline
  ```

2. Install System Packages

  This is the only part of the installation process that you should need to become the super user

  - Red Hat/CentOS(Requires the root password)
  
    ```
    su -c 'python setup.py install_system_packages'
    ```
  
  - Ubuntu
  
    ```
    sudo 'python setup.py install_system_packages'
    ```

3. Python

  The miseqpipeline requires python 2.7.3+ but < 3.0

  ```
  python setup.py install_python
  ```

  - Quick verify that Python is installed

    The following should return python 2.7.x(where x is somewhere from 3 to 9)

    ```
    $HOME/bin/python --version
    ```

4. Setup virtualenv
  
  
  1. Where do you want the pipeline to install? Don't forget this path, you will need it every time you want to activate the pipeline

    ```
    venvpath=$HOME/.miseqpipeline
    ```

  2. Install the virtualenv to the path you specified

    ```
    wget --no-check-certificate https://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.11.6.tar.gz#md5=f61cdd983d2c4e6aeabb70b1060d6f49 -O- | tar xzf -
    $HOME/bin/python virtualenv-1.11.6/virtualenv.py --prompt="(miseqpipeline) " $venvpath 
    ```

  3. Activate the virtualenv. You need to do this any time you want to start using the pipeline

    ```
    . $HOME/.miseqpipeline/bin/activate
    ```

5. Install the pipeline into virtualenv

  ```
  python setup.py install
  ```

  It should be safe to run this more than once in case some dependencies do not fully install.

6. Verify install

  You can pseudo test the installation of the pipeline by running the functional tests

  ```
  nosetests miseqpipeline/tests/test_functional.py
  ```

Back to the [README.md](README.md)