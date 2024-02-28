# Liatach

## Install Qemu

Install curl and qemu from your OS/Distribution repositories. For example on
Debian and Arch Linux, use the respective commands below:

```
sudo apt install curl qemu qemu-utils qemu-system-x86
sudo pacman -S curl qemu-full
```

## Install Alpine

```
git clone https://github.com/johanmalm/liatach.git
cd liatach
./01-start-qemu.sh
```

The first time this script is run, an Alpine iso will be downloaded. Beyond
that the script will merely start qemu and can be called repeatedly.

In the guest environment (in Qemu), run the commands below.  In the
setup-alpine script choose 'vda' and 'sys' in response to the desk questions.
Use whatever username you prefer instead of `$USER`

```
setup-alpine
apk update
apk add git doas
adduser -g $USER $USER
echo "permit persist :wheel" > /etc/doas.d/doas.conf
adduser $USER wheel
```

Logout.

## Install Labwc

Login as $USER and run the following.

```
git clone https://github.com/johanmalm/liatach.git
cd liatach
./02-bootstrap-compositor.sh $USER
```

Logout. Then log back in again and issue `labwc -s foot`.

[labwc]: https://github.com/labwc/labwc.git

