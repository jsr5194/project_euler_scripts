#!/usr/bin/python

def main():
	count = 1
	first_prior = 0
	second_prior = 0
	fibsum = 0
	while True:
		if count == 1:
			current = 1
		elif count == 2:
			first_prior = 1
			current = 2
		else:
			current = first_prior + second_prior
		if current >= 4000000:
			print fibsum
			break
		elif current % 2 == 0:
			fibsum += current
		second_prior = first_prior
		first_prior = current
		count += 1
		

	

if __name__ == "__main__":
	main()
