#!/bin/bash

apt-get install emacs23 unzip python-pip --assume-yes

mkdir ~/.emacs.d/plugins

# setup python-mode
python_mode_tarball_name=python-mode.el-6.1.0.tar.gz
python_mode_dir_name=python-mode.el-6.1.0

rm -r ./tarballs/tmp
mkdir ./tarballs/tmp

tar xvf ./tarballs/$python_mode_tarball_name -C ./tarballs/tmp
cp -r ./tarballs/tmp/$python_mode_dir_name ~/.emacs.d/plugins/python-mode
rm -r ./tarballs/tmp

# setup pymacs
pymacs_tarball_name=pinard-Pymacs-v0.25-0-g5989046.tar.gz
pymacs_dir_name=pinard-Pymacs-5989046
rm -r ./tarballs/tmp
mkdir ./tarballs/tmp

tar xvf ./tarballs/$pymacs_tarball_name -C ./tarballs/tmp
cd ./tarballs/tmp/$pymacs_dir_name

make
make install

mkdir ~/.emacs.d/plugins/lisp
cp ./pymacs.el ~/.emacs.d/plugins/lisp/pymacs.el
emacs -batch -eval '(byte-compile-file "~/.emacs.d/plugins/lisp/pymacs.el")'
cd ../..
rm -r ./tmp
cd ..

pip install pymacs

# setup rope
pip install rope
pip install ropemode
pip install ropemacs

# setup auto-complete
autocomplete_tarball_name=auto-complete-1.3.1.tar.bz2
autocomplete_dir_name=auto-complete-1.3.1
mkdir ./tarballs/tmp

tar xvf ./tarballs/$autocomplete_tarball_name -C ./tarballs/tmp
cd ./tarballs/tmp/$autocomplete_dir_name
make
make install

cd ../..
rm -r ./tmp
cd ..

# setup pyflakes
pip install pyflakes pep8
cp ./pycheckers /usr/local/bin/
cp ./flymake-cursor.el ~/.emacs.d/plugins/
chmod a+x /usr/local/bin/pycheckers

# setup nxhtml
nxhtml_tarbal_name=nxhtml-2.08-100425.zip
nxhtml_dir_nam=something

unzip ./tarballs/$nxhtml_tarbal_name -d ./tarballs/tmp
mkdir ~/.emacs.d/plugins/nxhtml
cp -r ./tarballs/tmp/$nxhtml_dir_name ~/.emacs.d/plugins/nxhtml
rm -r ./tarballs/tmp
