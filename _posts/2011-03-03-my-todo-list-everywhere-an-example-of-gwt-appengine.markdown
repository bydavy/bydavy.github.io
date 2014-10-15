---
author: Davy
comments: true
date: 2011-03-03 00:37:51+00:00
layout: post
slug: my-todo-list-everywhere-an-example-of-gwt-appengine
title: '"My todo list everywhere" an example of GWT + AppEngine'
wordpress_id: 40
categories:
- GWT &amp; AppEngine
- Java
tags:
- Activity
- AppEngine
- Gin
- GWT
- JavaScript
- Place
- Servlet
- todo
---

Those days, I played with GWT and AppEngine (GWT is an easy way to write ajax application, and AppEngine is a host, datastore and set of tools for web applications). Their are great tools, and a lot of tutorials are available.

The downside for a new incomer is to find an example mixing a lot of features of each technology. But, don't be afraid, here you will find a great example =0).

[![]({{ relative_url }}wp-content/uploads/2011/03/Todo-list-Home-page-e1299339037564.jpg)]({{ relative_url }}/wp-content/uploads/2011/03/Todo-list-Home-page-e1299339037564.jpg)

The web application is a very simple todo list manager. You login with your Google Account, and be redirected to your set of todos. You can add/delete todos. It's simple but also enough complex to discover and use a lot of features of GWT and AppEngine.

[![]({{ relative_url }}wp-content/uploads/2011/03/Todo-list-–-App-page-e1299935022663.png)]({{ relative_url }}/wp-content/uploads/2011/03/Todo-list-–-App-page-e1299935022663.png)

**What can you find in this example ?**

How to serve a GWT application by a servlet generating the webpage and including the xxx.nocache.js

How to use Activity, ActivityManager and Place and how to mix them with GIN (Guice for GWT, which is a dependency injection framework)

How to use GWT RPC communications with the Action/Response design pattern.

How to inject RPC in and RPC out event to display a loading popup.

How to embedded JavaScript data while serving the GWT application webpage in order to reduce the number of server requests (embedded implies that you save a few requests to the server after page loading)

To be continued ...

**What can be improved ? (a lot)**

** **1. Less server requests


  * <del>Inline CSS styleSheet</del>	
  * Serialize user todos in the app webpage javascript (those data will be display after the login, so "why do we wait that the user fully load the page and request his todos ?" Look at what was done for UserAccountDTO on app main page and do the same for user todos)
  * (Included in the previous: don't send a "get todos" to the server each time the todo activity is displayed.)

2. Less work on the client side

  * HeaderActivity is very simple at the moment and can be migrated into plain HTML.
  * (Some sort algorithm and deletion strategy can be improved.) <- Not the first goal of this example

3. Better user experience

	
  * Use GWT internationalization facilities
  * Better feedback that only the loading popup. (ie: todo added)
  * Smartphone dedicated interface (everything ready in the code, only need to write them)


**What you must don't look !!!**

Please, don't juge the CSS. I didn't spend time on it, so it's a bit messy and not well or not at all organized.

**Where can I find this example ?**

Application link: [http://todo-list-everywhere.appspot.com/](http://todo-list-everywhere.appspot.com/)

Source code link: [http://code.google.com/p/my-todo-list-everywhere/](http://code.google.com/p/my-todo-list-everywhere/)
