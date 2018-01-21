#!/usr/bin/python


def is_divisible(val):
	noerror = True
	for i in xrange(2,21):
		if val % i != 0: 
			noerror = False
	return noerror

def main():
	
	cur = 1
	while True:
		if is_divisible(cur):
			if cur % 2 == 0:
				print cur
				break
		cur += 1

if __name__ == "__main__":
	main()
