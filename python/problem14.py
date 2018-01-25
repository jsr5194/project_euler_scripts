#!/usr/bin/python

def get_next_term(last_term):
	term = 0
	if last_term % 2 == 0:
		term = last_term/2
	else:
		term = 3 * last_term + 1
	return term

def main():
	start = 0
	max_chain_length = 0

	for i in xrange(1, 1000000):
		cur_chain_length = 0
		last = i

		while True:
			cur_chain_length += 1
			next_term = get_next_term(last)
			if next_term == 1:
				break
			last = next_term

		if cur_chain_length > max_chain_length:
			max_chain_length = cur_chain_length
			start = i

	print "Answer: %s" % (start)

	

if __name__ == "__main__":
	main()
