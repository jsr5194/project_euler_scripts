#!/usr/bin/python

def get_paths(m, n):
	grid = [[0 for x in range(m)] for y in range(n)]

	for i in range(m):
		grid[0][i] = 1

	for i in range(n):
		grid[i][0] = 1

	for i in range(1, n):
		for j in range(1, m):
			grid[i][j] = grid[i-1][j] + grid[i][j-1]

	return grid[-1][-1]


def main():
	grid_x_limit = 21
	grid_y_limit = 21

	# determine paths
	print "Answer: %s" % (get_paths(grid_x_limit, grid_y_limit))

if __name__ == "__main__":
	main()
