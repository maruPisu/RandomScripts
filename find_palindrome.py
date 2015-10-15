import string
import random
import os

def is_pailndrome(str):
	length = len(str)
	ret = True
	for c in range(0,length/2):
		if str[c] != str[length - c -1]:
			ret = False
			break
	return ret

def max_palindrome(strin):
	length = len(strin)
	index = 0
	while length > 1:
		if is_pailndrome(strin[index:index+length]):
			return length

		if index+length >= len(strin):
			index = 0
			length -= 1
		else:
			index += 1
	return 1


os.system("clear")
print("\n\n --- MAX PALINDROME FINDER!! ---\nby Mauro Pisu\n\n")
myString = raw_input("Insert the string: ")
print("The length of the max palindrome in the string is " + str(max_palindrome(myString)))