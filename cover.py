import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Step 1: Create a mesh grid covering the plot space
x = np.linspace(-2, 2, 200)  # Zooming in by reducing the range
y = np.linspace(-2, 2, 200)
xx, yy = np.meshgrid(x, y)

# Step 2: Define the mountain function
def mountain_function(x, y):
    return np.exp(-0.1 * (x**2 + y**2)) * np.sin(2 * np.pi * (x + y)) * 3

# Step 3: Generate the Z values using the mountain function
zz = mountain_function(xx, yy)

# Step 4: Create the 3D wireframe plot
fig = plt.figure(figsize=(10, 7))
ax = fig.add_subplot(111, projection='3d')

# Plot the wireframe with 80s terminal green
ax.plot_wireframe(xx, yy, zz, color='#00FF00', alpha=0.7, linewidth=1)

# Step 5: Remove box and customize for an abstract look
ax.set_facecolor('black')  # Dark background for the 80s terminal aesthetic
ax.set_xlabel('')
ax.set_ylabel('')
ax.set_zlabel('')
ax.set_xticks([])
ax.set_yticks([])
ax.set_zticks([])

# Remove the grid and set the background to black for that retro feel
ax.grid(False)

# Zooming in by limiting the axis ranges
ax.set_xlim([-2, 2])
ax.set_ylim([-2, 2])
ax.set_zlim([-3, 3])
ax.set_frame_on(False)  # Remove the frame for a cleaner look


# save the plot as an image
fig.savefig('wireframe_topographic_plot.png', dpi=300, bbox_inches='tight')