import sys
import random as rd
import string

if len(sys.argv) < 2:
    print(rd.randint(0,100))
    exit(0)
elif len(sys.argv) == 2:
    if not sys.argv[1].isdigit():
        print('error: must be -s, -c, integer or a blank input')
        exit(0)
    a = int(sys.argv[1])
    print(rd.randint(0,a))
    exit(0)
elif len(sys.argv) == 3:
    if sys.argv[1] == '-s':
        a = int(sys.argv[2])
        letters = [i for i in string.ascii_lowercase]
        letterOutput = rd.sample(letters, a)
        print(' '.join(letterOutput))
        exit(0)
    elif not sys.argv[1].isdigit():
        print('error: must be -s, -c, integer or a blank input')
        exit(0)
    elif sys.argv[1].isdigit():
        a = int(sys.argv[1])
        if sys.argv[2].isdigit():
            print(rd.randint(a, int(sys.argv[2])))
            exit(0)
        else:
            print('error: input must be an integer')
            exit(0)
elif sys.argv[1] == '-c':
    if sys.argv[2].isdigit():
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
    elif not sys.arg[2].isdigit():
        print('Error: -c must follow with a correct format')
        exit(0)
    exit(0)
elif sys.argv[1] == '-p':
    inputList = sys.argv
    del inputList[0]
    del inputList[:1]
    rd.shuffle(inputList)
    for i in range(len(inputList)):
        print(inputList[i])
    exit(0)
