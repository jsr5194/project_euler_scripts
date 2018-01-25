#!/usr/bin/python

def invert_string(string):
	ret = ""
	length = len(string)
	for i in range(1,length+1):
		ret += string[length-i]
	return ret

def is_palindrome(v1, v2):
	is_even = False
	ret = False
	val = str(v1*v2)
	length = len(val)

	if length % 2 == 0: 
		is_even = True
	cut = length/2
	if is_even: 
		if str(val[:cut]) == str(invert_string(val[cut:])):
			ret = True
	else:
		if str(val[:cut]) == str(invert_string(val[cut+1:])):
			ret = True
		
	return ret

def main():
	top = 999
	low = 100
	answer = 0
	for i in xrange(top, low, -1):
		for j in xrange(top, low, -1):
			if is_palindrome(i, j): 
				if i*j > answer:
					answer = i*j
			j-=1
		i-=1

	print "Answer: %s" % (answer)

if __name__ == "__main__":
	main()
