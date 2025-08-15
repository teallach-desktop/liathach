# Liathach

## Introduction

This project provides a reproducible environment for running and evaluating the
[labwc] Wayland Compositor. It is intended for users who:

1. Find it difficult to install labwc because their OS/Distribution does not
   have the required dependencies.
2. Do not want to spend time setting up the larger system which a compositor
   always has to be part of in order to function and do anything useful.
3. Cannot be bothered do configure the compositor itself or the clients required
   to provide a complete desktop shell experience.

## Install Qemu

Install curl and qemu from your OS/Distribution repositories. For example on
Debian and Arch Linux, use the respective commands below:

```
sudo apt install curl qemu qemu-utils qemu-system-x86
sudo pacman -S curl qemu-full
```

## Install Alpine

```
git clone https://github.com/johanmalm/liathach.git
cd liathach
./01-start-qemu.sh
```

The first time this script is run, an Alpine iso will be downloaded. Beyond
that the script will merely start qemu and can be called repeatedly.

In the guest environment (in Qemu), login as `root` (no passwords) and then run
the commands below.  In the setup-alpine script choose 'vda' and 'sys' in
response to the disk questions.  Use whatever username you prefer instead of
`$USER`

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
git clone https://github.com/johanmalm/liathach.git
cd liathach
./02-bootstrap-compositor.sh $USER
```

Logout. Then log back in again and issue `labwc -s foot`.

[labwc]: https://github.com/labwc/labwc.git

