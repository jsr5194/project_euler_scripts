#!/usr/bin/python

def has_factor(value):
	i = 2
	ret = False
	top = value
	while i < top:
		if value % i == 0:
			ret = i
			break
		i += 1
	return ret


def main():
	target = 600851475143
	last_prime = 0
	i = has_factor(target)
	print "Low Prime: %s" % (i)
	high_end = target/i
	while i < high_end:
		if target % i == 0: 
			high_end = target/i
			if not has_factor(i): 
				last_prime = i
		i += 2
	print "Last Prime: %s" % last_prime

if __name__ == "__main__":
	main()
