---
author: Davy
comments: true
date: 2012-06-15 00:23:35+00:00
layout: post
slug: script-to-build-android
title: Script to build Android
wordpress_id: 239
categories:
- Android
---

After compiling Android all day long you quickly learn a few tricks like "mmm" to do a partial build or "adb sync" to synchronize the device files tree to your compilation output directory. Those tools save you a lot of time, but you are still typing the same list of commands all day long. And here comes my script.

Do you need to compile your Android source ?
{% highlight bash %}
$ dt build
{% endhighlight %}

Do you need to flash your device with the latest image produced by your compilation ?
{% highlight bash %} 
$ dt flash
{% endhighlight %}

Do you need to do a fast partial build and push changed files to your device ?
{% highlight bash %} 
$ dt pbuild -p
{% endhighlight %}

Do you need to reinstall a bunch of files and apk to your device ?
{% highlight bash %}
$ dt reinstall
{% endhighlight %}

Here are a few examples of what you can do:

[![]({{ relative_url }}wp-content/uploads/2012/06/dt_screenshot.png)]({{ relative_url }}wp-content/uploads/2012/06/dt_screenshot.png)

[Download dt]({{ relative_url }}wp-content/uploads/2012/06/dt.zip)
