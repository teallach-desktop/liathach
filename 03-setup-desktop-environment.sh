#!/bin/sh

# Build and runtime deps
doas apk add \
	build-base \
	meson \
	glib-dev \
	qt6-qtbase \
	qt6-qttools \
	libxml2 \
	dialog \
	bash

# Additional build deps for subprojects (tint, labwc-tweaks, labwc-menu-generator)
doas apk add \
	qt6-qtbase-dev \
	qt6-qttools-dev \
	libxml2-dev \
	perl \
	cmake

# Teallach desktop components
doas apk add \
	swaylock \
	swaybg \
	swayidle \
	wl-clipboard \
	wlr-randr \
	grim

# Teallach desktop applications
doas apk add \
	ristretto \
	mousepad

# Stuff that I just find convenient to have
doas apk add \
	vim \
	mc \
	gimp \
	imv

