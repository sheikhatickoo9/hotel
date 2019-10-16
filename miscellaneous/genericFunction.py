import string
import random


def string_generate(length=10):
    letter = string.ascii_lowercase
    pwd = "".join(random.choice(letter) for i in range(length))
    print(pwd)
    return pwd
string_generate()