import matplotlib.pyplot as plt 
  
sizes = [] 
sames = []
tiles = []
xes = [] 
  
f = open('ishmem_get','r') 
for row in f: 
    row = row.split('\t') 
    sizes.append(int(row[0])) 
    sames.append(float(row[1])) 
    tiles.append(float(row[2])) 
    xes.append(float(row[3])) 

plt.plot(sizes, sames, label = 'ISHMEM (Same Tile)', marker = '*', markersize = 5, color = (0, 0, 0.9))
plt.plot(sizes, tiles, label = 'ISHMEM (Diff. Tile)', marker = 'x', markersize = 5, color = (0, 0.5, 0.5))
plt.plot(sizes, xes, label = 'ISHMEM (Diff. Device)', marker = 'o', markersize = 5, color = (0, 0.5, 1))
  
plt.xscale('log', base = 2)
plt.yscale('log')
plt.xticks([1, 16, 256, 4096, 65536, 1048576, 16777216], [1, 16, 256, "4K", "64K", "1M", "16M"])
  
plt.xlabel('Message Size (B)', fontsize = 12) 
plt.ylabel('Bandwidth (MBps)', fontsize = 12) 

plt.ylim(ymin = 1)
plt.xlim(xmin = 1)
  
plt.legend()
plt.grid()
plt.savefig('ishmem_get.pdf') 
plt.show() 
