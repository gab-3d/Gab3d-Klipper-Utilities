sudo apt update

sudo apt install python3-numpy python3-matplotlib libatlas-base-dev

#check numpy is installed in ~/klippy-env/bin/pip if not install it
if ~/klippy-env/bin/pip list | grep -q 'numpy'; then
  echo "numpy is already installed in ~/klippy-env/bin/pip"
else
  echo "numpy is not installed in ~/klippy-env/bin/pip, installing it now"
  ~/klippy-env/bin/pip install -v numpy
fi

bash ~/Gab3d-Klipper-Utilities/install.sh
