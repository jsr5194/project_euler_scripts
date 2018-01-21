#!/usr/bin/python


def get_sum_of_squares(limit):
	ret = 0
	for i in xrange(1, limit+1):
		ret += i**2
	return ret

def get_square_of_sum(limit):
	ret = 0
	for i in xrange(1, limit+1):
		ret += i
	ret = ret**2
	return ret

def main():
	limit = 100
	answer = get_square_of_sum(limit) - get_sum_of_squares(limit)
	print "Answer: %s" % (answer)
	

if __name__ == "__main__":
	main()
