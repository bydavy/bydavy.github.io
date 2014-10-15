---
author: Davy
comments: true
date: 2014-01-15 07:08:11+00:00
layout: page
slug: sensorify
title: Sensorify
wordpress_id: 320
---

**What is Sensorify?**

Sensorify is a prototype of game backed by Google App Engine (aka GAE). The idea is to use your smartphone's browser to control the game and your desktop's browser to visualise the game (almost like [Rollit](http://chrome.com/campaigns/rollit) from Google).

**Where can I find it?**

You can checkout the code: [https://github.com/bydavy/sensorify](https://github.com/bydavy/sensorify)

**What technologies are used?**

It's written in Python and uses Google App Engine. For simplicity of deployment, I didn't use websocket but instead channel api provided by GAE. Yes, channel api can be used for game although it's far from replacing websockets (it's not the same needs and requirements).

(This prototype is still a work in progress)




