from collections import Counter
import numpy as np
import matplotlib.pyplot as plt
import random as rd

count = 0
numbers = []
fig = plt.figure(figsize=(15, 15))
ax = fig.add_axes([0,0,1,1])

while (count < 1000):
    numbers.append(rd.randint(0,100))
    count = count + 1

lbl, vals = zip(*Counter(numbers).items())

index = np.arange(len(lbl), 1.0)
start = 0
end = 100
ax.xaxis.set_ticks(np.arange(start, end, 1.0))
ax.set_title('Frequency of Random Generator')
ax.set_xlabel('Number')
ax.set_ylabel('Count')
ax.bar(lbl,vals)
plt.show()
