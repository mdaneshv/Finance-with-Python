import numpy as np
import matplotlib.pyplot as plt

def myplot1(data, ax=None, show=False):
    if not ax:
        _, ax = plt.subplots()
    ax.plot(data[0], data[1])
    if show:
        plt.show()

def myplot2(data, ax=None, show=False):
    if not ax:
        _, ax = plt.subplots()
    ax.hist(data, bins=20, density=True)
    if show:
        plt.show()

x = np.linspace(-3, 3, 100)
y = np.exp(-x**2/2)/np.sqrt(2*np.pi)
a = np.random.normal(size=10000)

# create figure 1
myplot1((x,y))
#create figure 2
myplot2(a)

# create figure with both
fig, ax = plt.subplots()
myplot1((x,y), ax=ax)
myplot2(a, ax=ax)

plt.show()