#!/usr/bin/python

def get_num_divisors(val):
	num = 0
	true_sqrt = False
	sqrt = val**.5

	# check if the number actually has a swrt
	if sqrt % int(sqrt) == 0:
		true_sqrt = True

	sqrt = int(sqrt)

	for i in xrange(1,sqrt+1):
		if val % i == 0:
			num += 2

	# need to remove one if a sqrt actually exists
	if true_sqrt:
		num -= 1

	return num

def main():
	count = 1
	triangle = 0
	target = 500
	while True:
		triangle += count
		if get_num_divisors(triangle) > target:
			print "Answer: %s" % (triangle)
			break
		count += 1

if __name__ == "__main__":
	main()
