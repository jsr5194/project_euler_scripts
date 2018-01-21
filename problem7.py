#!/usr/bin/python

from time import sleep


def is_prime(val):
	ret = True
	for i in xrange(2,val):
		if val % i == 0:
			ret = False
			break
	return ret

def main():
	cur = 3
	prime_count = 1
	prime_limit = 10001
	while True:
		if is_prime(cur):
			prime_count += 1
			if prime_count == prime_limit:
				print "Answer: %s" % (cur)
				break
		cur += 2

if __name__ == "__main__":
	main()
