import matplotlib.pyplot as plt 
  
sizes = [] 
n_2 = []
n_4 = []
n_6 = []
n_8 = []
n_10 = []
n_12 = []
  
f = open('broadcast','r') 
for row in f: 
    row = row.split('\t') 
    sizes.append(int(row[0])) 
    n_2.append(float(row[1])) 
    n_4.append(float(row[2])) 
    n_6.append(float(row[3])) 
    n_8.append(float(row[4])) 
    n_10.append(float(row[5])) 
    n_12.append(float(row[6])) 

plt.plot(sizes, n_2, label = '2 PEs', marker = '+', markersize = 5)
plt.plot(sizes, n_4, label = '4 PEs', marker = 'v', markersize = 5)
plt.plot(sizes, n_6, label = '6 PEs', marker = '*', markersize = 5)
plt.plot(sizes, n_8, label = '8 PEs', marker = 'x', markersize = 5)
plt.plot(sizes, n_10, label = '10 PEs', marker = 'o', markersize = 5)
plt.plot(sizes, n_12, label = '12 PEs', marker = '<', markersize = 5)
  
plt.xscale('log', base = 2)
plt.yscale('log')
plt.xticks([1, 4, 16, 64, 256, 1024, 4096, 16384, 65536], [1, 4, 16, 64, 256, "1K", "4K", "16K", "64K"])
  
plt.xlabel('Number of Elements', fontsize = 12) 
plt.ylabel('Execution Time (us)', fontsize = 12) 

plt.ylim(ymin = 1)
plt.xlim(xmin = 1)
  
plt.legend()
plt.grid()
plt.savefig('broadcast.pdf') 
plt.show() 
