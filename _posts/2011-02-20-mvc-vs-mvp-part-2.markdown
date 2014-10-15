---
author: Davy
comments: true
date: 2011-02-20 20:36:16+00:00
layout: post
slug: mvc-vs-mvp-%e2%80%93-part-2
title: MVC vs MVP – Part 2
wordpress_id: 30
categories:
- Design Patterns
- Graphical User Interfaces
- Java
tags:
- controller
- java
- model
- MVC
- MVP
- presenter
- swing
- view
---

#What is the major difference ?

In MVC, the biggest portion of code is shared between the Controller and the View. The controller contains the logic, and the View know how to render the model and listen model changes.

In MVP, the biggest portion of code is solely in the Presenter and the View is entirely passive. The presenter contains the whole logic, and the View doesn't know what it's displaying.

#What is the benefit of each approach ?

In MVC:
  * All information displayed is manager by the view itself (When you need to translate your software, only view classes will be edited.)
  * The controller don't always need to push the new edited value of the model (push to view class).
  * FYI: The model must be designed and finalized before the view


In MVP:
  * The view is solely passive, you can easily replace the view by a stumb one in order to run unit tests. Such tests (with a stumb view) will have a better coverage than MVC approach
  * As the view is passive and doesn't contains any kind of logic, the view can be more easily tweaked without impacting the logic.
  * FYI: The model can be designed and finalized after the view


#When to use MVC or MVP ?

This is a project specific question: sometime the framework used is designed for on approach, sometime you will use the other approach because you cannot rely on the View for your tests, etc...

Between MVC and MVP, the best approach is the approach that match your needs.

#An example of programme designed with both approach:

[mvp example]({{ relative_url }}wp-content/uploads/2011/02/bydavy_mvp.zip)  
[mvc example]({{ relative_url }}wp-content/uploads/2011/02/bydavy_mvc.zip)

For MVC or MVP, the order of instantiation of the view, controller/presenter isn't important. Try to focus on the communication between the 3 entities (model, view, controller/presenter).
