---
author: Davy
comments: true
date: 2012-01-16 16:51:18+00:00
layout: post
slug: compiling-linux-kernel-modules-for-synology-devices
title: Compiling Linux Kernel modules for Synology devices
wordpress_id: 200
categories:
- Miscellaneous
---

Synology NAS are very versatile. They are running a stripped version of Linux with less kernel modules, but we can overcome this by compiling and adding modules (for instance the usbserial module used by usb serial converters).

**Requirements:**
	
  * a computer (or a virtual machine) running Linux (Debian, Fedora, Ubuntu, etc)
  * the [tool chains](http://sourceforge.net/projects/dsgpl/files/) specific to your Synology
  * the [Synology NAS GPL](http://sourceforge.net/projects/dsgpl/files/) source specific to your Synology


**How to proceed:**

  * Unzip the tool chains in /usr/local
{% highlight bash %}
	computer$ tar -xzf yourToolChains -C /usr/local/
{% endhighlight %}
	
  * Unzip the Synology NAS GPL source inside your tool chains
{% highlight bash %}
	computer$ tar -xzf yourNASGPLSource -C /usr/local/yourToolChains/
{% endhighlight %}
	
  * Before continuing, let's find out which Linux kernel we are running on the Synology in order to compile for the right version:
{% highlight bash %}
computer$ ssh -l root ipOfYourSynology
synology$ uname -a
Linux Syno youLinuxKernelVersion xxxxx yourSynologyArchi
{% endhighlight %}

	
  * Open the Synology NAS GPL source folder corresponding to your Synology Linux kernel
{% highlight bash %}
computer$ cd /usr/local/yourToolChains/source/linux-youLinuxKernelVersion
{% endhighlight %}

	
  * Copy the config file created by Synology to configure the kernel
{% highlight bash %}
computer$ cp synoconfigs/yourSynologyArchi .config
{% endhighlight %}

	
  * Edit the Makefile to compile for the right architecture and use the right tool chains
{% highlight bash %}
computer$ vi Makefile
edit the variable ARCH -> ARCH = yourSynologyAchi
edit the variable CROSS_COMPILE -> CROSS_COMPILE = /usr/local/yourToolChains/bin/yourToolChains-
{% endhighlight %}
	
  * Check the config file we just copied
{% highlight bash %}
computer$ make oldconfig
{% endhighlight %}
	
  * Edit the config file through the user interface to add modules
{% highlight bash %}
computer$ make menuconfig
{% endhighlight %}
	
  * Compile all modules
{% highlight bash %}
computer$ make modules 
# or only a specific module: make M=./drivers/usb/serial
{% endhighlight %}
	
  * Find your modules in the corresponding subfolder (in my case drivers/usb/serial/usbserial.ko)

