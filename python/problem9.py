#!/usr/bin/python

def main():
	limit = 1000

	for a in xrange(0,limit):
		for b in xrange(0, limit):
			for c in xrange(0, limit):
				if a<b<c:
					if ((a**2 + b**2 == c**2) and (a + b + c == limit)):
						print "Answer: a=%s b=%s c=%s product=%s" % (a, b, c, a*b*c)

if __name__ == "__main__":
	main()
