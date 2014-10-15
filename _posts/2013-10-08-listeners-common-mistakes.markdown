---
author: Davy
comments: true
date: 2013-10-08 06:08:15+00:00
layout: post
slug: listeners-common-mistakes
title: 'Listeners: Common mistakes'
wordpress_id: 306
categories:
- Design Patterns
- Java
---

Listeners are very common in Java and surprisingly they are rarely implemented correctly. The issue comes most of the time from the event firing, also known as notifying listeners. Let's go over a few implementation I've encounter and let's explain the shortcomings.

# Context

Let's assume that we have a class Listenable which is our object observed and an interface Listener which are our observers.

{% highlight java %}
public class Listenable {
	Collection mListeners;
	
	public void registerListener(Listener l) {
		mListeners.add(l);
	}

	public void unregisterListener(Listener l) {
		mListeners.remove(l);
	}

	private void notifyChanged() {
	// Piece of code we are interested in
	}
}

public interface Listener{
	void onChanged();
}
{% endhighlight %}


# Bad implementation #1: iterating over listeners


This is the naive implementation. As mlisteners is a collection, an approach is to just go iterate on it with an advanced for loop and invoke the "onChanged" method to notify of a change.

{% highlight java %}
for(Listener l: mListeners){
	l.onChanged();
}
{% endhighlight %}

It looks pretty simple and legit. Well not really... "onChanged" is implemented by another object and we don't know what could be its implementation.

{% highlight java %}
// Example of implementation where it gets bad
public class MyListener implements Listener {

	Listenable mListenable;

	public static void onChanged() {
		// Do the logic
		mListenable.removeListener(this);
	}
}
{% endhighlight %}

Advanced for loop in Java are based of iterators and unfortunately iterators have a few limitations. They don't support Collection edition after the iterator creation and during its usage. To be more precise, the Collection can be edited through the iterator's remove method but that's pretty much it. In our example, while scanning the Collection in the Observer, a Listener could invoke the "removeListener()" method. The consequence is a ConcurrentModificationException thrown in the Observer code -when it will try to iterating over the next Listener-.


# Bad implementation #2: iterating over listeners (bis)


In this code, the Collection is iterated in a reverse way. I guess the intent is to overcome the potential ConcurrentModificationException by getting rid of Iterators and iterating manually over the Collection and alowing Listener removal by doing a reverse scan. Unfortunately this piece of code fails at both.

{% highlight java %}
final int size = mListeners.size();
for(int i = size-1; size <= 0; i--) {
	Listener l = mListeners.get(i);
	l.onChanged();
}
{% endhighlight %}

As we don't know what could be implemented under the onChanged method of a Listener, we have to be ready to all eventualities. In case a Listener unregister more than one Listener our code could change the size of the list while we are iterating over it and potential throw w NullPointerException. Or it can add Listeners and depending if they are added at the beginning or end of the Collection they could receive or not the change currently notified.


# Bad implementation #3: let's synchronize


Listeners and synchronization together are most of the time a latent bomb.

{% highlight java %}
synchronized(mListeners) {
	for(Listener l: mListeners) { // Don't focus on the way we iterate here
		l.onChanged();
	}
}
{% endhighlight %}

Synchronizing a monitor during the invokation of a listener is a very bold idea. Again, we have no idea of what the Listener code could be and the other side, the Listener doesn't know if and why we have decided to synchronize on a monitor during it's onChanged invokation. In those circumstances, we can easily imagine potential deadlocks.


# A better way to do it


{% highlight java %}
// Take a snapshot of listeners registered when the change occured
List<Listener> listenersToinvoke = new ArrayList<Listener>(mListeners);
// Iterator over the snapshot without holding any monitors
for(Listener l: listenersToinvoke){
	l.onChanged();
}
{% endhighlight %}

Now, it probably makes sense why this is a better approach. By copying the Collection, we ensure two things:


  * The Collection copied will not change over time
  * All Listeners will be notified of the change -as they were registered at the time the Observer's change happen-


Also by not holding a monitor through a synchronize statement we avoid potential deadlocks and locking of the monitor during a long time -as we have no control over the Listener onChanged method implementation-.
