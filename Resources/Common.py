import random

__author__ = 'Vadim'


def Rundom_Number(start=1, finish=30, step=1):
    start=int(start)
    finish=int(finish)+1
    step=int(step)
    R_Number = random.randrange(start, finish, step)
    return R_Number

# example
result1 = Rundom_Number(1, '4', 1)
result2 = random.randint(1, 4)
print(result1)
print(result2)
