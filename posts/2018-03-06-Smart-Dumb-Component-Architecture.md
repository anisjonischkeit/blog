---
title: Smart Dumb Component Architecture
author: Anis Jonischkeit
---

## The ideal setup

There is a very popular way of componentising your react applications. The architecture
that I am talking about is often referred to as the Component/Container architecture or 
the Smart/Dumb component architecture. It says that we should split our components into
two types of components; components and containers. The role of the the components is 
simply to take some state and some callbacks and render a user interface from it.

This approach allows us to reuse so much of our application in other places. Your ui
components are completely decoupled from your application logic and can therefore be used
in a completely different context (or even a completely different application). Since the
job of the containers is to connect your application state and logic to your ui, your
application should become much more modular. This seperation makes it so that you can
also reuse your application logic and state easily in other react (or react native) 
projects. The only part that is coupled to your application specifically are the containers.
This is great as the only thing that containers are supposed to do are connect your ui to
your application logic.

## What are the difficulties. If it's so good, Why aren't all react applications written like this.

So let's start just writing all of our components like this. Easy righ? Actually sticking
to this structure tends to be a lot more difficult than most people initially think. We very
quickly start asking questions about how we can nicely achieve a certain type of component
structure using this architecture. Sometimes things that are a few components deep in pure
components need some state or a callback to update the state. We have to rethink about how
we would structure our component tree to stay in line with our proposed architecture. 

`Some examples of how we refactor components to remove local state`

In general, if we build the ui components first and don't connect them to our state at all,
we very quickly realise how we can build components that are completely stand alone.

## State in Dumb components

In general, dumb components should hold state. There are however some circumstances where
having local state simplifys things and doesn't couple the ui with the application state at all. Lets look at an example:

```

```

In the above example we have an input field that validates a person's name. The only thing
that this validation should do is make sure that the person's name is capitalised. We do
however want the user to be able to type an uncapitalised name, we just want to display a
warning that the name is not capitalised. Here we can put the validation code directly into the dumb component. This is due to one fact that is true about our interaction. our
application doesn't actually care about whether the name is or isn't capitalised. So because
of this we don't need to notify any outer state about it. Essentially if you are questioning whether something is okay to be put into a dumb component's state, ask yourself "do I actually care about the data or function call?" if the answer is no, then the state you are
keeping locally in the component is just ui state rather than application state and can stay there.


CRITICISM (it takes more upfront effort)
you don't end up writing more code, you write the same amount of code, just in a different 
place. rather than having all of your application code mashed into your view component, you seperate that code out (so less code in view, which ends up getting put in the components)