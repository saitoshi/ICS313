#assignment: ICS 313 Homework 6
#description: a random generator based on the command line argument
#author: Shin Saito

#import the packages necessary for the file
import sys
import random as rd
import string

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(rd.randint(0,100))
        exit(0)
    elif len(sys.argv) == 3:
        if sys.argv[1] == '-s':
            a = int(sys.argv[2])
            letters = [i for i in string.ascii_lowercase]
            letterOutput = rd.sample(letters, a)
            print(' '.join(letterOutput))
            exit(0)
        else:
            a = int(sys.argv[1])
            b = int(sys.argv[2])
            print(rd.randint(a,b))
            exit(0)
    elif len(sys.argv) == 2:
        a = int(sys.argv[1])
        print(rd.randint(0,a))
        exit(0)
    elif sys.argv[1] == '-c':
        a = int(sys.argv[2])
        for c in range(a):
            if sys.argv[3] == '-s':
                b = int(sys.argv[4])
                letters = [i for i in string.ascii_lowercase]
                letterOutput = rd.sample(letters, b)
                print(' '.join(letterOutput))
            elif sys.argv[3].isdigit():
                if sys.argv[4].isdigit():
                    b = int(sys.argv[3])
                    d = int(sys.argv[4])
                    print(rd.randint(b,d))
                else:
                    print(rd.randint(0,100))
    elif sys.argv[1] == '-p':
        exit(0)
