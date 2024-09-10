import matplotlib.pyplot as plt 
  
sizes = [] 
wi_1 = []
wi_16 = [] 
wi_128 = [] 
wi_1024 = [] 
  
f = open('ishmem_put_cutover_never','r') 
for row in f: 
    row = row.split('\t') 
    sizes.append(int(row[0])) 
    wi_1.append(float(row[1])) 
    wi_16.append(float(row[2])) 
    wi_128.append(float(row[3])) 
    wi_1024.append(float(row[4])) 
  
plt.plot(sizes, wi_1, label = '#work-items = 1', marker = '*', markersize = 5) 
plt.plot(sizes, wi_16, label = '#work-items = 16', marker = 'x', markersize = 5) 
plt.plot(sizes, wi_128, label = '#work-items = 128', marker = 'o', markersize = 5) 
plt.plot(sizes, wi_1024, label = '#work-items = 1024', marker = '+', markersize = 5) 

plt.xscale('log', base = 2)
plt.yscale('log')
plt.xticks([1, 16, 256, 4096, 65536, 1048576, 16777216], [1, 16, 256, "4K", "64K", "1M", "16M"])
  
plt.xlabel('Message Size (B)', fontsize = 12) 
plt.ylabel('Bandwidth (MBps)', fontsize = 12) 

plt.ylim(ymin = 0.1)
plt.ylim(ymax = 100000)
plt.xlim(xmin = 1)
  
plt.legend()
plt.grid()
plt.savefig('ishmem_put_cutover_never.pdf') 
plt.show() 
