# -*- coding: utf-8 -*-
"""
Created on Wed Oct 17 14:03:13 2018

@author: Mdaneshvar
"""

import random

def roll_dice():
    return random.randint(1,100)

#  Now roll the dice 1000 times. 

x = 0
while x < 1000:
    result = roll_dice()
    print(result)
    x+=1
	
