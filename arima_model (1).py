# -*- coding: utf-8 -*-
"""
Created on Wed Feb 27 20:53:45 2019

@author: Mdaneshvar
"""
import numpy as np
from pandas import DataFrame
import matplotlib.pyplot as plt
from statsmodels.tsa.arima_model import ARIMA
import csv
from pyramid.arima import auto_arima


x = []
y = []

with open("s.txt","r") as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    print(plots)
    for row in plots:
        x=np.linspace(0,11,11)
        y.append(float(row[0]))
    #print(y)   #y.append((row[1]))
plt.plot(x,y, label='Data')
plt.title('Data')



stepwise_model = auto_arima(y, start_p=0, start_q=0,
                            max_p=5, max_q=5, m=12,
                            start_P=0, seasonal=True,
                            d=0, D=0, trace=True,
                            error_action='ignore',  
                            suppress_warnings=True, 
                            stepwise=True)
print(stepwise_model.aic())




model = ARIMA(y, order=(1,0,0))
model_fit = model.fit(disp=0)
print(model_fit.summary())
# plot residual errors
residuals = DataFrame(model_fit.resid)
residuals.plot()
plt.title('residuals')
plt.show()
residuals.plot(kind='kde')
plt.title('density of residuals')
plt.show()
print(residuals.describe())


size = int(len(y) * 0.9)
train, test = y[0:size], y[size:len(y)]
history = [x for x in train]
predictions = list()
for t in range(len(test)):
 	model = ARIMA(history, order=(1,0,2))
 	model_fit = model.fit(disp=0)
 	output = model_fit.forecast()
 	yhat = output[0]
 	predictions.append(yhat)
 	obs = test[t]
 	history.append(obs)

plt.plot(predictions, color='red')
plt.title(' Next 20 predictions')
plt.show()





