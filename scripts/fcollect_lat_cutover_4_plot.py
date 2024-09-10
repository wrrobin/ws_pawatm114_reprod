import matplotlib.pyplot as plt 
  
sizes = [] 
t_16 = []
t_64 = []
t_256 = [] 
t_1024 = [] 
  
f = open('fcollect_4','r') 
for row in f: 
    row = row.split('\t') 
    sizes.append(int(row[0])) 
    t_16.append(float(row[1])) 
    t_64.append(float(row[2])) 
    t_256.append(float(row[3])) 
    t_1024.append(float(row[4])) 

plt.plot(sizes, t_16, label = '#work_items = 16', marker = '+', markersize = 5)
plt.plot(sizes, t_64, label = '#work_items = 64', marker = 'v', markersize = 5)
plt.plot(sizes, t_256, label = '#work_items = 256', marker = '*', markersize = 5)
plt.plot(sizes, t_1024, label = '#work_items = 1024', marker = 'x', markersize = 5)
  
plt.xscale('log', base = 2)
plt.yscale('log')
plt.xticks([1, 4, 16, 64, 256, 1024, 4096, 16384, 65536], [1, 4, 16, 64, 256, "1K", "4K", "16K", "64K"])
  
plt.xlabel('Number of Elements', fontsize = 12) 
plt.ylabel('Execution Time (us)', fontsize = 12) 

plt.ylim(ymin = 1)
plt.xlim(xmin = 1)
  
plt.legend()
plt.grid()
plt.savefig('fcollect_4.pdf') 
plt.show() 
