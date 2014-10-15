---
author: Davy
date: 2011-03-20 02:42:36+00:00
layout: page
slug: contact
title: Contact
wordpress_id: 99
---

<form class="pure-form" action="http://getsimpleform.com/messages?form_api_token={{ site.simpleform-api-token }}" method="post" id="contactMe">
    <fieldset class="pure-group">
        <input type='hidden' name='redirect_to' value='{{ site.url }}/contact/thank_you.html' />
        <input id="name" class="pure-input-1-2"  type="text" name="Name" placeholder="Name"/>
        <input id="email" class="pure-input-1-2"  type="email" name="E-mail" placeholder="Email Address"/>
        <input id="subject" class="pure-input-1-2"  type="text" name="Sibject" placeholder="Subject"/><br/>
        <textarea class="pure-input-1-2" form="contactMe" style="height:200px;" name="message" placeholder="Message"></textarea>
        <div class="pure-controls">
            <button type="submit" class="pure-button pure-button-primary">Submit</button>
        </div>
    </fieldset>
</form>
