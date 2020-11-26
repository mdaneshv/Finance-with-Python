# -*- coding: utf-8 -*-
"""
Created on Sat Nov 16 20:23:26 2019

@author: Mdaneshvar
"""

import numpy as np

X = np.genfromtxt('Useries.dat', dtype = np.float64, delimiter=' ')

print((X[:,:4]))
