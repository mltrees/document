# A Step by Step Backpropagation Example

## Background

Backpropagation is a common method for training a neural network. There is [no shortage of papers](https://www.google.com/search?q=backpropagation+algorithm) online that attempt to explain how backpropagation works, but few that  include an example with actual numbers. This post is my attempt to  explain how it works with a concrete example that folks can compare  their own calculations to in order to ensure they understand  backpropagation correctly.

If this kind of thing interests you, you should [sign up for my newsletter](http://www.emergentmind.com/newsletter) where I post about AI-related projects that I’m working on.

## Backpropagation in Python

You can play around with a Python script that I wrote that implements the backpropagation algorithm in [this Github repo](https://github.com/mattm/simple-neural-network).

## Backpropagation Visualization

For an interactive visualization showing a neural network as it learns, check out my [Neural Network visualization](http://www.emergentmind.com/neural-network).

## Additional Resources

If you find this tutorial useful and want to continue learning about  neural networks, machine learning, and deep learning, I highly recommend checking out Adrian Rosebrock’s new book, [Deep Learning for Computer Vision with Python](https://www.pyimagesearch.com/deep-learning-computer-vision-python-book/). I really enjoyed the book and will have a full review up soon.

## Overview

For this tutorial, we’re going to use a neural network with two  inputs, two hidden neurons, two output neurons. Additionally, the hidden and output neurons will include a bias.

Here’s the basic structure:

![neural_network (C:\zml\src\github.com\mltrees\documents\note\A_Step_by_Step_Backpropagation_Example\image1.png)](https://matthewmazur.files.wordpress.com/2018/03/neural_network-7.png?w=525)

In order to have some numbers to work with, here are the initial weights, the biases, and training inputs/outputs:

![neural_network (C:\zml\src\github.com\mltrees\documents\note\A_Step_by_Step_Backpropagation_Example\image2.png)](https://matthewmazur.files.wordpress.com/2018/03/neural_network-9.png?w=525)

The goal of backpropagation is to optimize the weights so that the  neural network can learn how to correctly map arbitrary inputs to  outputs.

For the rest of this tutorial we’re going to work with a single  training set: given inputs 0.05 and 0.10, we want the neural network to  output 0.01 and 0.99.

## The Forward Pass

To begin, lets see what the neural network currently predicts given  the weights and biases above and inputs of 0.05 and 0.10. To do this  we’ll feed those inputs forward though the network.

We figure out the *total net input* to each hidden layer neuron, *squash* the total net input using an *activation function* (here we use the *logistic function*), then repeat the process with the output layer neurons.

Total net input is also referred to as just *net input* by [some sources](http://web.cs.swarthmore.edu/~meeden/cs81/s10/BackPropDeriv.pdf).

Here’s how we calculate the total net input for ![h_1](https://s0.wp.com/latex.php?latex=h_1&bg=ffffff&fg=404040&s=0):

![net_{h1} = w_1 * i_1 + w_2 * i_2 + b_1 * 1](https://s0.wp.com/latex.php?latex=net_%7Bh1%7D+%3D+w_1+%2A+i_1+%2B+w_2+%2A+i_2+%2B+b_1+%2A+1&bg=ffffff&fg=404040&s=0)

![net_{h1} = 0.15 * 0.05 + 0.2 * 0.1 + 0.35 * 1 = 0.3775](https://s0.wp.com/latex.php?latex=net_%7Bh1%7D+%3D+0.15+%2A+0.05+%2B+0.2+%2A+0.1+%2B+0.35+%2A+1+%3D+0.3775&bg=ffffff&fg=404040&s=0)

We then squash it using the logistic function to get the output of ![h_1](https://s0.wp.com/latex.php?latex=h_1&bg=ffffff&fg=404040&s=0):

![out_{h1} = \frac{1}{1+e^{-net_{h1}}} = \frac{1}{1+e^{-0.3775}} = 0.593269992](https://s0.wp.com/latex.php?latex=out_%7Bh1%7D+%3D+%5Cfrac%7B1%7D%7B1%2Be%5E%7B-net_%7Bh1%7D%7D%7D+%3D+%5Cfrac%7B1%7D%7B1%2Be%5E%7B-0.3775%7D%7D+%3D+0.593269992&bg=ffffff&fg=404040&s=0)

Carrying out the same process for ![h_2](https://s0.wp.com/latex.php?latex=h_2&bg=ffffff&fg=404040&s=0) we get:

![out_{h2} = 0.596884378](https://s0.wp.com/latex.php?latex=out_%7Bh2%7D+%3D+0.596884378&bg=ffffff&fg=404040&s=0)

We repeat this process for the output layer neurons, using the output from the hidden layer neurons as inputs.

Here’s the output for ![o_1](https://s0.wp.com/latex.php?latex=o_1&bg=ffffff&fg=404040&s=0):

![net_{o1} = w_5 * out_{h1} + w_6 * out_{h2} + b_2 * 1](https://s0.wp.com/latex.php?latex=net_%7Bo1%7D+%3D+w_5+%2A+out_%7Bh1%7D+%2B+w_6+%2A+out_%7Bh2%7D+%2B+b_2+%2A+1&bg=ffffff&fg=404040&s=0)

![net_{o1} = 0.4 * 0.593269992 + 0.45 * 0.596884378 + 0.6 * 1 = 1.105905967](https://s0.wp.com/latex.php?latex=net_%7Bo1%7D+%3D+0.4+%2A+0.593269992+%2B+0.45+%2A+0.596884378+%2B+0.6+%2A+1+%3D+1.105905967&bg=ffffff&fg=404040&s=0)

![out_{o1} = \frac{1}{1+e^{-net_{o1}}} = \frac{1}{1+e^{-1.105905967}} = 0.75136507](https://s0.wp.com/latex.php?latex=out_%7Bo1%7D+%3D+%5Cfrac%7B1%7D%7B1%2Be%5E%7B-net_%7Bo1%7D%7D%7D+%3D+%5Cfrac%7B1%7D%7B1%2Be%5E%7B-1.105905967%7D%7D+%3D+0.75136507&bg=ffffff&fg=404040&s=0)

And carrying out the same process for ![o_2](https://s0.wp.com/latex.php?latex=o_2&bg=ffffff&fg=404040&s=0) we get:

![out_{o2} = 0.772928465](https://s0.wp.com/latex.php?latex=out_%7Bo2%7D+%3D+0.772928465&bg=ffffff&fg=404040&s=0)

### Calculating the Total Error

We can now calculate the error for each output neuron using the [squared error function](http://en.wikipedia.org/wiki/Backpropagation#Derivation) and sum them to get the total error:

![E_{total} = \sum \frac{1}{2}(target - output)^{2}](https://s0.wp.com/latex.php?latex=E_%7Btotal%7D+%3D+%5Csum+%5Cfrac%7B1%7D%7B2%7D%28target+-+output%29%5E%7B2%7D&bg=ffffff&fg=404040&s=0)

[Some sources](http://www.amazon.com/Introduction-Math-Neural-Networks-Heaton-ebook/dp/B00845UQL6/ref=sr_1_1?ie=UTF8&qid=1426296804&sr=8-1&keywords=neural+network) refer to the target as the *ideal* and the output as the *actual*.

The ![\frac{1}{2}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B1%7D%7B2%7D&bg=D5E9F6&fg=404040&s=0) is included so that exponent is cancelled when we differentiate later  on. The result is eventually multiplied by a learning rate anyway so it  doesn’t matter that we introduce a constant here [[1](http://en.wikipedia.org/wiki/Backpropagation#Derivation)].

For example, the target output for ![o_1](https://s0.wp.com/latex.php?latex=o_1&bg=ffffff&fg=404040&s=0) is 0.01 but the neural network output 0.75136507, therefore its error is:

![E_{o1} = \frac{1}{2}(target_{o1} - out_{o1})^{2} = \frac{1}{2}(0.01 - 0.75136507)^{2} = 0.274811083](https://s0.wp.com/latex.php?latex=E_%7Bo1%7D+%3D+%5Cfrac%7B1%7D%7B2%7D%28target_%7Bo1%7D+-+out_%7Bo1%7D%29%5E%7B2%7D+%3D+%5Cfrac%7B1%7D%7B2%7D%280.01+-+0.75136507%29%5E%7B2%7D+%3D+0.274811083&bg=ffffff&fg=404040&s=0)

Repeating this process for ![o_2](https://s0.wp.com/latex.php?latex=o_2&bg=ffffff&fg=404040&s=0) (remembering that the target is 0.99) we get:

![E_{o2} = 0.023560026](https://s0.wp.com/latex.php?latex=E_%7Bo2%7D+%3D+0.023560026&bg=ffffff&fg=404040&s=0)

The total error for the neural network is the sum of these errors:

![E_{total} = E_{o1} + E_{o2} = 0.274811083 + 0.023560026 = 0.298371109](https://s0.wp.com/latex.php?latex=E_%7Btotal%7D+%3D+E_%7Bo1%7D+%2B+E_%7Bo2%7D+%3D+0.274811083+%2B+0.023560026+%3D+0.298371109&bg=ffffff&fg=404040&s=0)

## The Backwards Pass

Our goal with backpropagation is to update each of the weights in the network so that they cause the actual output to be closer the target  output, thereby minimizing the error for each output neuron and the  network as a whole.

### Output Layer

Consider ![w_5](https://s0.wp.com/latex.php?latex=w_5&bg=ffffff&fg=404040&s=0). We want to know how much a change in ![w_5](https://s0.wp.com/latex.php?latex=w_5&bg=ffffff&fg=404040&s=0) affects the total error, aka ![\frac{\partial E_{total}}{\partial w_{5}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B5%7D%7D&bg=ffffff&fg=404040&s=0).

![\frac{\partial E_{total}}{\partial w_{5}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B5%7D%7D&bg=D5E9F6&fg=404040&s=0) is read as “the partial derivative of ![E_{total}](https://s0.wp.com/latex.php?latex=E_%7Btotal%7D&bg=D5E9F6&fg=404040&s=0) with respect to ![w_{5}](https://s0.wp.com/latex.php?latex=w_%7B5%7D&bg=D5E9F6&fg=404040&s=0)“. You can also say “the gradient with respect to ![w_{5}](https://s0.wp.com/latex.php?latex=w_%7B5%7D&bg=D5E9F6&fg=404040&s=0)“.

By applying the [chain rule](http://en.wikipedia.org/wiki/Chain_rule) we know that:

![\frac{\partial E_{total}}{\partial w_{5}} = \frac{\partial E_{total}}{\partial out_{o1}} * \frac{\partial out_{o1}}{\partial net_{o1}} * \frac{\partial net_{o1}}{\partial w_{5}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B5%7D%7D+%3D+%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+out_%7Bo1%7D%7D+%2A+%5Cfrac%7B%5Cpartial+out_%7Bo1%7D%7D%7B%5Cpartial+net_%7Bo1%7D%7D+%2A+%5Cfrac%7B%5Cpartial+net_%7Bo1%7D%7D%7B%5Cpartial+w_%7B5%7D%7D&bg=ffffff&fg=404040&s=2)

Visually, here’s what we’re doing:

![output_1_backprop (C:\zml\src\github.com\mltrees\documents\note\A_Step_by_Step_Backpropagation_Example\image3.png)](https://matthewmazur.files.wordpress.com/2018/03/output_1_backprop-4.png?w=525)

We need to figure out each piece in this equation.

First, how much does the total error change with respect to the output?

![E_{total} = \frac{1}{2}(target_{o1} - out_{o1})^{2} + \frac{1}{2}(target_{o2} - out_{o2})^{2}](https://s0.wp.com/latex.php?latex=E_%7Btotal%7D+%3D+%5Cfrac%7B1%7D%7B2%7D%28target_%7Bo1%7D+-+out_%7Bo1%7D%29%5E%7B2%7D+%2B+%5Cfrac%7B1%7D%7B2%7D%28target_%7Bo2%7D+-+out_%7Bo2%7D%29%5E%7B2%7D&bg=ffffff&fg=404040&s=0)

![\frac{\partial E_{total}}{\partial out_{o1}} = 2 * \frac{1}{2}(target_{o1} - out_{o1})^{2 - 1} * -1 + 0](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+out_%7Bo1%7D%7D+%3D+2+%2A+%5Cfrac%7B1%7D%7B2%7D%28target_%7Bo1%7D+-+out_%7Bo1%7D%29%5E%7B2+-+1%7D+%2A+-1+%2B+0&bg=ffffff&fg=404040&s=0)

![\frac{\partial E_{total}}{\partial out_{o1}} = -(target_{o1} - out_{o1}) = -(0.01 - 0.75136507) = 0.74136507](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+out_%7Bo1%7D%7D+%3D+-%28target_%7Bo1%7D+-+out_%7Bo1%7D%29+%3D+-%280.01+-+0.75136507%29+%3D+0.74136507&bg=ffffff&fg=404040&s=0)

![-(target - out)](https://s0.wp.com/latex.php?latex=-%28target+-+out%29&bg=D5E9F6&fg=404040&s=0) is sometimes expressed as ![out - target](https://s0.wp.com/latex.php?latex=out+-+target&bg=D5E9F6&fg=404040&s=0)

When we take the partial derivative of the total error with respect to ![out_{o1}](https://s0.wp.com/latex.php?latex=out_%7Bo1%7D&bg=D5E9F6&fg=404040&s=0), the quantity ![\frac{1}{2}(target_{o2} - out_{o2})^{2}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B1%7D%7B2%7D%28target_%7Bo2%7D+-+out_%7Bo2%7D%29%5E%7B2%7D&bg=D5E9F6&fg=404040&s=0) becomes zero because ![out_{o1}](https://s0.wp.com/latex.php?latex=out_%7Bo1%7D&bg=D5E9F6&fg=404040&s=0) does not affect it which means we’re taking the derivative of a constant which is zero.

Next, how much does the output of ![o_1](https://s0.wp.com/latex.php?latex=o_1&bg=ffffff&fg=404040&s=0) change with respect to its total net input?

The partial [derivative of the logistic function](http://en.wikipedia.org/wiki/Logistic_function#Derivative) is the output multiplied by 1 minus the output:

![out_{o1} = \frac{1}{1+e^{-net_{o1}}}](https://s0.wp.com/latex.php?latex=out_%7Bo1%7D+%3D+%5Cfrac%7B1%7D%7B1%2Be%5E%7B-net_%7Bo1%7D%7D%7D&bg=ffffff&fg=404040&s=0)

![\frac{\partial out_{o1}}{\partial net_{o1}} = out_{o1}(1 - out_{o1}) = 0.75136507(1 - 0.75136507) = 0.186815602](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+out_%7Bo1%7D%7D%7B%5Cpartial+net_%7Bo1%7D%7D+%3D+out_%7Bo1%7D%281+-+out_%7Bo1%7D%29+%3D+0.75136507%281+-+0.75136507%29+%3D+0.186815602&bg=ffffff&fg=404040&s=0)

Finally, how much does the total net input of ![o1](https://s0.wp.com/latex.php?latex=o1&bg=ffffff&fg=404040&s=0) change with respect to ![w_5](https://s0.wp.com/latex.php?latex=w_5&bg=ffffff&fg=404040&s=0)?

![net_{o1} = w_5 * out_{h1} + w_6 * out_{h2} + b_2 * 1](https://s0.wp.com/latex.php?latex=net_%7Bo1%7D+%3D+w_5+%2A+out_%7Bh1%7D+%2B+w_6+%2A+out_%7Bh2%7D+%2B+b_2+%2A+1&bg=ffffff&fg=404040&s=0)

![\frac{\partial net_{o1}}{\partial w_{5}} = 1 * out_{h1} * w_5^{(1 - 1)} + 0 + 0 = out_{h1} = 0.593269992](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+net_%7Bo1%7D%7D%7B%5Cpartial+w_%7B5%7D%7D+%3D+1+%2A+out_%7Bh1%7D+%2A+w_5%5E%7B%281+-+1%29%7D+%2B+0+%2B+0+%3D+out_%7Bh1%7D+%3D+0.593269992&bg=ffffff&fg=404040&s=0)

Putting it all together:

![\frac{\partial E_{total}}{\partial w_{5}} = \frac{\partial E_{total}}{\partial out_{o1}} * \frac{\partial out_{o1}}{\partial net_{o1}} * \frac{\partial net_{o1}}{\partial w_{5}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B5%7D%7D+%3D+%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+out_%7Bo1%7D%7D+%2A+%5Cfrac%7B%5Cpartial+out_%7Bo1%7D%7D%7B%5Cpartial+net_%7Bo1%7D%7D+%2A+%5Cfrac%7B%5Cpartial+net_%7Bo1%7D%7D%7B%5Cpartial+w_%7B5%7D%7D&bg=ffffff&fg=404040&s=0)

![\frac{\partial E_{total}}{\partial w_{5}} = 0.74136507 * 0.186815602 * 0.593269992 = 0.082167041](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B5%7D%7D+%3D+0.74136507+%2A+0.186815602+%2A+0.593269992+%3D+0.082167041&bg=ffffff&fg=404040&s=0)

You’ll often see this calculation combined in the form of the [delta rule](http://en.wikipedia.org/wiki/Delta_rule):

![\frac{\partial E_{total}}{\partial w_{5}} = -(target_{o1} - out_{o1}) * out_{o1}(1 - out_{o1}) * out_{h1}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B5%7D%7D+%3D+-%28target_%7Bo1%7D+-+out_%7Bo1%7D%29+%2A+out_%7Bo1%7D%281+-+out_%7Bo1%7D%29+%2A+out_%7Bh1%7D&bg=D5E9F6&fg=404040&s=0)

Alternatively, we have ![\frac{\partial E_{total}}{\partial out_{o1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+out_%7Bo1%7D%7D&bg=D5E9F6&fg=404040&s=0) and ![\frac{\partial out_{o1}}{\partial net_{o1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+out_%7Bo1%7D%7D%7B%5Cpartial+net_%7Bo1%7D%7D&bg=D5E9F6&fg=404040&s=0) which can be written as ![\frac{\partial E_{total}}{\partial net_{o1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+net_%7Bo1%7D%7D&bg=D5E9F6&fg=404040&s=0), aka ![\delta_{o1}](https://s0.wp.com/latex.php?latex=%5Cdelta_%7Bo1%7D&bg=D5E9F6&fg=404040&s=0) (the Greek letter delta) aka the *node delta*. We can use this to rewrite the calculation above:

![\delta_{o1} = \frac{\partial E_{total}}{\partial out_{o1}} * \frac{\partial out_{o1}}{\partial net_{o1}} = \frac{\partial E_{total}}{\partial net_{o1}}](https://s0.wp.com/latex.php?latex=%5Cdelta_%7Bo1%7D+%3D+%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+out_%7Bo1%7D%7D+%2A+%5Cfrac%7B%5Cpartial+out_%7Bo1%7D%7D%7B%5Cpartial+net_%7Bo1%7D%7D+%3D+%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+net_%7Bo1%7D%7D&bg=D5E9F6&fg=404040&s=0)

![\delta_{o1} = -(target_{o1} - out_{o1}) * out_{o1}(1 - out_{o1})](https://s0.wp.com/latex.php?latex=%5Cdelta_%7Bo1%7D+%3D+-%28target_%7Bo1%7D+-+out_%7Bo1%7D%29+%2A+out_%7Bo1%7D%281+-+out_%7Bo1%7D%29&bg=D5E9F6&fg=404040&s=0)

Therefore:

![\frac{\partial E_{total}}{\partial w_{5}} = \delta_{o1} out_{h1}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B5%7D%7D+%3D+%5Cdelta_%7Bo1%7D+out_%7Bh1%7D&bg=D5E9F6&fg=404040&s=0)

Some sources extract the negative sign from ![\delta](https://s0.wp.com/latex.php?latex=%5Cdelta&bg=D5E9F6&fg=404040&s=0) so it would be written as:

![\frac{\partial E_{total}}{\partial w_{5}} = -\delta_{o1} out_{h1}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B5%7D%7D+%3D+-%5Cdelta_%7Bo1%7D+out_%7Bh1%7D&bg=D5E9F6&fg=404040&s=0)

To decrease the error, we then subtract this value from the current  weight (optionally multiplied by some learning rate, eta, which we’ll  set to 0.5):

![w_5^{+} = w_5 - \eta * \frac{\partial E_{total}}{\partial w_{5}} = 0.4 - 0.5 * 0.082167041 = 0.35891648](https://s0.wp.com/latex.php?latex=w_5%5E%7B%2B%7D+%3D+w_5+-+%5Ceta+%2A+%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B5%7D%7D+%3D+0.4+-+0.5+%2A+0.082167041+%3D+0.35891648&bg=ffffff&fg=404040&s=0)

[Some](http://en.wikipedia.org/wiki/Delta_rule) [sources](http://aima.cs.berkeley.edu/) use ![\alpha](https://s0.wp.com/latex.php?latex=%5Calpha&bg=D5E9F6&fg=404040&s=0) (alpha) to represent the learning rate, [others use](https://www4.rgu.ac.uk/files/chapter3 - bp.pdf) ![\eta](https://s0.wp.com/latex.php?latex=%5Ceta&bg=D5E9F6&fg=404040&s=0) (eta), and [others](http://web.cs.swarthmore.edu/~meeden/cs81/s10/BackPropDeriv.pdf) even use ![\epsilon](https://s0.wp.com/latex.php?latex=%5Cepsilon&bg=D5E9F6&fg=404040&s=0) (epsilon).

We can repeat this process to get the new weights ![w_6](https://s0.wp.com/latex.php?latex=w_6&bg=ffffff&fg=404040&s=0), ![w_7](https://s0.wp.com/latex.php?latex=w_7&bg=ffffff&fg=404040&s=0), and ![w_8](https://s0.wp.com/latex.php?latex=w_8&bg=ffffff&fg=404040&s=0):

![w_6^{+} = 0.408666186](https://s0.wp.com/latex.php?latex=w_6%5E%7B%2B%7D+%3D+0.408666186&bg=ffffff&fg=404040&s=0)

![w_7^{+} = 0.511301270](https://s0.wp.com/latex.php?latex=w_7%5E%7B%2B%7D+%3D+0.511301270&bg=ffffff&fg=404040&s=0)

![w_8^{+} = 0.561370121](https://s0.wp.com/latex.php?latex=w_8%5E%7B%2B%7D+%3D+0.561370121&bg=ffffff&fg=404040&s=0)

We perform the actual updates in the neural network *after* we  have the new weights leading into the hidden layer neurons (ie, we use  the original weights, not the updated weights, when we continue the  backpropagation algorithm below).

### Hidden Layer

Next, we’ll continue the backwards pass by calculating new values for ![w_1](https://s0.wp.com/latex.php?latex=w_1&bg=ffffff&fg=404040&s=0), ![w_2](https://s0.wp.com/latex.php?latex=w_2&bg=ffffff&fg=404040&s=0), ![w_3](https://s0.wp.com/latex.php?latex=w_3&bg=ffffff&fg=404040&s=0), and ![w_4](https://s0.wp.com/latex.php?latex=w_4&bg=ffffff&fg=404040&s=0).

Big picture, here’s what we need to figure out:

![\frac{\partial E_{total}}{\partial w_{1}} = \frac{\partial E_{total}}{\partial out_{h1}} * \frac{\partial out_{h1}}{\partial net_{h1}} * \frac{\partial net_{h1}}{\partial w_{1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B1%7D%7D+%3D+%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D+%2A+%5Cfrac%7B%5Cpartial+out_%7Bh1%7D%7D%7B%5Cpartial+net_%7Bh1%7D%7D+%2A+%5Cfrac%7B%5Cpartial+net_%7Bh1%7D%7D%7B%5Cpartial+w_%7B1%7D%7D&bg=ffffff&fg=404040&s=0)

Visually:

[![nn-calculation](C:\zml\src\github.com\mltrees\documents\note\A_Step_by_Step_Backpropagation_Example\image4.png)](https://matthewmazur.files.wordpress.com/2015/03/nn-calculation.png)

We’re going to use a similar process as we did for the output layer,  but slightly different to account for the fact that the output of each  hidden layer neuron contributes to the output (and therefore error) of  multiple output neurons. We know that ![out_{h1}](https://s0.wp.com/latex.php?latex=out_%7Bh1%7D&bg=ffffff&fg=404040&s=0) affects both ![out_{o1}](https://s0.wp.com/latex.php?latex=out_%7Bo1%7D&bg=ffffff&fg=404040&s=0) and ![out_{o2}](https://s0.wp.com/latex.php?latex=out_%7Bo2%7D&bg=ffffff&fg=404040&s=0) therefore the ![\frac{\partial E_{total}}{\partial out_{h1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D&bg=ffffff&fg=404040&s=0) needs to take into consideration its effect on the both output neurons:

![\frac{\partial E_{total}}{\partial out_{h1}} = \frac{\partial E_{o1}}{\partial out_{h1}} + \frac{\partial E_{o2}}{\partial out_{h1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D+%3D+%5Cfrac%7B%5Cpartial+E_%7Bo1%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D+%2B+%5Cfrac%7B%5Cpartial+E_%7Bo2%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D&bg=ffffff&fg=404040&s=0)

Starting with ![\frac{\partial E_{o1}}{\partial out_{h1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Bo1%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D&bg=ffffff&fg=404040&s=0):

![\frac{\partial E_{o1}}{\partial out_{h1}} = \frac{\partial E_{o1}}{\partial net_{o1}} * \frac{\partial net_{o1}}{\partial out_{h1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Bo1%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D+%3D+%5Cfrac%7B%5Cpartial+E_%7Bo1%7D%7D%7B%5Cpartial+net_%7Bo1%7D%7D+%2A+%5Cfrac%7B%5Cpartial+net_%7Bo1%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D&bg=ffffff&fg=404040&s=0)

We can calculate ![\frac{\partial E_{o1}}{\partial net_{o1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Bo1%7D%7D%7B%5Cpartial+net_%7Bo1%7D%7D&bg=ffffff&fg=404040&s=0) using values we calculated earlier:

![\frac{\partial E_{o1}}{\partial net_{o1}} = \frac{\partial E_{o1}}{\partial out_{o1}} * \frac{\partial out_{o1}}{\partial net_{o1}} = 0.74136507 * 0.186815602 = 0.138498562](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Bo1%7D%7D%7B%5Cpartial+net_%7Bo1%7D%7D+%3D+%5Cfrac%7B%5Cpartial+E_%7Bo1%7D%7D%7B%5Cpartial+out_%7Bo1%7D%7D+%2A+%5Cfrac%7B%5Cpartial+out_%7Bo1%7D%7D%7B%5Cpartial+net_%7Bo1%7D%7D+%3D+0.74136507+%2A+0.186815602+%3D+0.138498562&bg=ffffff&fg=404040&s=0)

And ![\frac{\partial net_{o1}}{\partial out_{h1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+net_%7Bo1%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D&bg=ffffff&fg=404040&s=0) is equal to ![w_5](https://s0.wp.com/latex.php?latex=w_5&bg=ffffff&fg=404040&s=0):

![net_{o1} = w_5 * out_{h1} + w_6 * out_{h2} + b_2 * 1](https://s0.wp.com/latex.php?latex=net_%7Bo1%7D+%3D+w_5+%2A+out_%7Bh1%7D+%2B+w_6+%2A+out_%7Bh2%7D+%2B+b_2+%2A+1&bg=ffffff&fg=404040&s=0)

![\frac{\partial net_{o1}}{\partial out_{h1}} = w_5 = 0.40](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+net_%7Bo1%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D+%3D+w_5+%3D+0.40&bg=ffffff&fg=404040&s=0)

Plugging them in:

![\frac{\partial E_{o1}}{\partial out_{h1}} = \frac{\partial E_{o1}}{\partial net_{o1}} * \frac{\partial net_{o1}}{\partial out_{h1}} = 0.138498562 * 0.40 = 0.055399425](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Bo1%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D+%3D+%5Cfrac%7B%5Cpartial+E_%7Bo1%7D%7D%7B%5Cpartial+net_%7Bo1%7D%7D+%2A+%5Cfrac%7B%5Cpartial+net_%7Bo1%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D+%3D+0.138498562+%2A+0.40+%3D+0.055399425&bg=ffffff&fg=404040&s=0)

Following the same process for ![\frac{\partial E_{o2}}{\partial out_{h1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Bo2%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D&bg=ffffff&fg=404040&s=0), we get:

![\frac{\partial E_{o2}}{\partial out_{h1}} = -0.019049119](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Bo2%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D+%3D+-0.019049119&bg=ffffff&fg=404040&s=0)

Therefore:

![\frac{\partial E_{total}}{\partial out_{h1}} = \frac{\partial E_{o1}}{\partial out_{h1}} + \frac{\partial E_{o2}}{\partial out_{h1}} = 0.055399425 + -0.019049119 = 0.036350306](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D+%3D+%5Cfrac%7B%5Cpartial+E_%7Bo1%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D+%2B+%5Cfrac%7B%5Cpartial+E_%7Bo2%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D+%3D+0.055399425+%2B+-0.019049119+%3D+0.036350306&bg=ffffff&fg=404040&s=0)

Now that we have ![\frac{\partial E_{total}}{\partial out_{h1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D&bg=ffffff&fg=404040&s=0), we need to figure out ![\frac{\partial out_{h1}}{\partial net_{h1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+out_%7Bh1%7D%7D%7B%5Cpartial+net_%7Bh1%7D%7D&bg=ffffff&fg=404040&s=0) and then ![\frac{\partial net_{h1}}{\partial w}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+net_%7Bh1%7D%7D%7B%5Cpartial+w%7D&bg=ffffff&fg=404040&s=0) for each weight:

![out_{h1} = \frac{1}{1+e^{-net_{h1}}}](https://s0.wp.com/latex.php?latex=out_%7Bh1%7D+%3D+%5Cfrac%7B1%7D%7B1%2Be%5E%7B-net_%7Bh1%7D%7D%7D&bg=ffffff&fg=404040&s=0)

![\frac{\partial out_{h1}}{\partial net_{h1}} = out_{h1}(1 - out_{h1}) = 0.59326999(1 - 0.59326999 ) = 0.241300709](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+out_%7Bh1%7D%7D%7B%5Cpartial+net_%7Bh1%7D%7D+%3D+out_%7Bh1%7D%281+-+out_%7Bh1%7D%29+%3D+0.59326999%281+-+0.59326999+%29+%3D+0.241300709&bg=ffffff&fg=404040&s=0)

We calculate the partial derivative of the total net input to ![h_1](https://s0.wp.com/latex.php?latex=h_1&bg=ffffff&fg=404040&s=0) with respect to ![w_1](https://s0.wp.com/latex.php?latex=w_1&bg=ffffff&fg=404040&s=0) the same as we did for the output neuron:

![net_{h1} = w_1 * i_1 + w_3 * i_2 + b_1 * 1](https://s0.wp.com/latex.php?latex=net_%7Bh1%7D+%3D+w_1+%2A+i_1+%2B+w_3+%2A+i_2+%2B+b_1+%2A+1&bg=ffffff&fg=404040&s=0)

![\frac{\partial net_{h1}}{\partial w_1} = i_1 = 0.05](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+net_%7Bh1%7D%7D%7B%5Cpartial+w_1%7D+%3D+i_1+%3D+0.05&bg=ffffff&fg=404040&s=0)

Putting it all together:

![\frac{\partial E_{total}}{\partial w_{1}} = \frac{\partial E_{total}}{\partial out_{h1}} * \frac{\partial out_{h1}}{\partial net_{h1}} * \frac{\partial net_{h1}}{\partial w_{1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B1%7D%7D+%3D+%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D+%2A+%5Cfrac%7B%5Cpartial+out_%7Bh1%7D%7D%7B%5Cpartial+net_%7Bh1%7D%7D+%2A+%5Cfrac%7B%5Cpartial+net_%7Bh1%7D%7D%7B%5Cpartial+w_%7B1%7D%7D&bg=ffffff&fg=404040&s=0)

![\frac{\partial E_{total}}{\partial w_{1}} = 0.036350306 * 0.241300709 * 0.05 = 0.000438568](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B1%7D%7D+%3D+0.036350306+%2A+0.241300709+%2A+0.05+%3D+0.000438568&bg=ffffff&fg=404040&s=0)

You might also see this written as:

![\frac{\partial E_{total}}{\partial w_{1}} = (\sum\limits_{o}{\frac{\partial E_{total}}{\partial out_{o}} * \frac{\partial out_{o}}{\partial net_{o}} * \frac{\partial net_{o}}{\partial out_{h1}}}) * \frac{\partial out_{h1}}{\partial net_{h1}} * \frac{\partial net_{h1}}{\partial w_{1}}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B1%7D%7D+%3D+%28%5Csum%5Climits_%7Bo%7D%7B%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+out_%7Bo%7D%7D+%2A+%5Cfrac%7B%5Cpartial+out_%7Bo%7D%7D%7B%5Cpartial+net_%7Bo%7D%7D+%2A+%5Cfrac%7B%5Cpartial+net_%7Bo%7D%7D%7B%5Cpartial+out_%7Bh1%7D%7D%7D%29+%2A+%5Cfrac%7B%5Cpartial+out_%7Bh1%7D%7D%7B%5Cpartial+net_%7Bh1%7D%7D+%2A+%5Cfrac%7B%5Cpartial+net_%7Bh1%7D%7D%7B%5Cpartial+w_%7B1%7D%7D&bg=D5E9F6&fg=404040&s=0)

![\frac{\partial E_{total}}{\partial w_{1}} = (\sum\limits_{o}{\delta_{o} * w_{ho}}) * out_{h1}(1 - out_{h1}) * i_{1}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B1%7D%7D+%3D+%28%5Csum%5Climits_%7Bo%7D%7B%5Cdelta_%7Bo%7D+%2A+w_%7Bho%7D%7D%29+%2A+out_%7Bh1%7D%281+-+out_%7Bh1%7D%29+%2A+i_%7B1%7D&bg=D5E9F6&fg=404040&s=0)

![\frac{\partial E_{total}}{\partial w_{1}} = \delta_{h1}i_{1}](https://s0.wp.com/latex.php?latex=%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B1%7D%7D+%3D+%5Cdelta_%7Bh1%7Di_%7B1%7D&bg=D5E9F6&fg=404040&s=0)

We can now update ![w_1](https://s0.wp.com/latex.php?latex=w_1&bg=ffffff&fg=404040&s=0):

![w_1^{+} = w_1 - \eta * \frac{\partial E_{total}}{\partial w_{1}} = 0.15 - 0.5 * 0.000438568 = 0.149780716](https://s0.wp.com/latex.php?latex=w_1%5E%7B%2B%7D+%3D+w_1+-+%5Ceta+%2A+%5Cfrac%7B%5Cpartial+E_%7Btotal%7D%7D%7B%5Cpartial+w_%7B1%7D%7D+%3D+0.15+-+0.5+%2A+0.000438568+%3D+0.149780716&bg=ffffff&fg=404040&s=0)

Repeating this for ![w_2](https://s0.wp.com/latex.php?latex=w_2&bg=ffffff&fg=404040&s=0), ![w_3](https://s0.wp.com/latex.php?latex=w_3&bg=ffffff&fg=404040&s=0), and ![w_4](https://s0.wp.com/latex.php?latex=w_4&bg=ffffff&fg=404040&s=0)

![w_2^{+} = 0.19956143](https://s0.wp.com/latex.php?latex=w_2%5E%7B%2B%7D+%3D+0.19956143&bg=ffffff&fg=404040&s=0)

![w_3^{+} = 0.24975114](https://s0.wp.com/latex.php?latex=w_3%5E%7B%2B%7D+%3D+0.24975114&bg=ffffff&fg=404040&s=0)

![w_4^{+} = 0.29950229](https://s0.wp.com/latex.php?latex=w_4%5E%7B%2B%7D+%3D+0.29950229&bg=ffffff&fg=404040&s=0)

Finally, we’ve updated all of our weights! When we fed forward the  0.05 and 0.1 inputs originally, the error on the network was  0.298371109. After this first round of backpropagation, the total error  is now down to 0.291027924. It might not seem like much, but after  repeating this process 10,000 times, for example, the error plummets to  0.0000351085. At this point, when we feed forward 0.05 and 0.1, the two  outputs neurons generate 0.015912196 (vs 0.01 target) and 0.984065734  (vs 0.99 target).

If you’ve made it this far and found any errors in any of the above  or can think of any ways to make it clearer for future readers, don’t  hesitate to [drop me a note](https://mattmazur.com/contact/). Thanks!