import pandas as pd


s = pd.Series({'Archery': 'Bhutan', 'Golf': 'Scotland', 'Sumo':'Japan'})

print(s.iloc[-1])
print(s[-1])
print(s['Sumo'])
print(s.loc['Sumo'])


x = "This is a string"
print(x[-1])
