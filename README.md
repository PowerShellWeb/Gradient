<a href='https://www.powershellgallery.com/packages/gradient/'>
<img src='https://img.shields.io/powershellgallery/dt/gradient' />
</a>

# Gradient

## CSS Gradient Generator

CSS Gradients are pretty great.

Their syntax is pretty flexible, but can require a commanding knowledge of CSS and comma placement.

This PowerShell module tries to simplify things a bit.

## Installing and Importing

You can install Gradient from the PowerShell Gallery

~~~PowerShell
Install-Module Gradient
~~~

Once installed, you can import Gradient with Import-Module

~~~PowerShell
Import-Module Gradient -PassThru
~~~

### Cloning and Importing

You can also install this module by cloning the repository and importing it

~~~PowerShell
git clone https://github.com/PowerShellWeb/Gradient
Import-Module ./Gradient -PassThru
~~~

## Generating gradients

Gradients are really easy to generate:

Let's make a red green blue radial gradient

~~~PowerShell
gradient red green blue
~~~

This will give us back a Gradient object.

It has our .input and also has a .css property that contains the gradient as CSS

~~~PowerShell
(gradient red green blue).CSS
~~~

Gradients can get pretty cool.
For some inspiration, check out the MDN topic on [using gradients](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Images/Using_gradients)

To get a full sense of what we can do with Gradient, 
feel free to check out [my page of gradient experiments](https://MrPowerShell.com/CSS/Gradients).


