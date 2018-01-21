#!/usr/bin/python

# prime number algorithm from here:
# http://whatis.techtarget.com/definition/prime-number

def round_up(val):
	if val % int(val) != 0:
		val = int(val+1)
	else:
		val = int(val)
	return val


def is_prime(val):
	ret = True
	m = round_up((val**.5))
	for i in xrange(m-1):
		if float(val) % float(m-i) == 0:
			ret = False
			break
	return ret


def main():
	limit = 2000000
	answer = 2 # initialize it with the first prime
	for i in xrange(3, limit, 2):
		if is_prime(i):
			answer += i
	print "Answer: %s" % (answer)



if __name__ == "__main__":
	main()
