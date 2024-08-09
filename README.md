# distro-customizer

Auto install all importent apps and customization for distro after a fresh install.

**_Distro Customizer_** is a powerful Linux utility that allows users to quickly and seamlessly restore their entire desktop environment after a fresh OS installation. Whether you're setting up a new machine or reinstalling your operating system, Distro Customizer ensures you don't lose any of your precious app configurations, customizations, and dotfiles.

## Who is it for?

Distro Customizer is an essential tool for Linux power users, developers, IT professionals, and anyone who values their personalized desktop environment. It's perfect for:

Users who frequently reinstall their operating system or switch between different Linux distributions.
Developers and engineers who need to quickly set up a new development environment.
IT administrators managing multiple workstations across an organization.
Linux enthusiasts who enjoy customizing their desktop to perfection.
With Distro Customizer, you can say goodbye to the hassle of manually restoring your desktop after a fresh install and get back to being productive in no time.

## How distro customizer works.

Distro customizer works on profile model. You have to create a profile. Profile is basically a shell script contains the commands you run after fresh installing a distro to make it usable. It contains packet manager config, apps installation, app configs, customization etc. create a profile file and place it in /profiles directory. installation script will detect the available profiles and list them on installation.

> _Important Note : This designed not to be a generic scripts, It's designed to setup on your own for the first time and automate from the next time. So feel free to fork it and customize it as you like. Current scripts are according to my personal preference._

## How to run

- install git through packet manager

```
sudo apt install git
OR
sudo dnf install git
OR
sudo pacman -S git
```

- Clone this repo and cd into repo
- Run installer

```
git clone https://github.com/tirtharajsinha/distro-customizer.git
cd distro-customizer
sh install.sh
```
