def fib():
    a, b = 0, 1
    while True:
        yield b
        a, b = b, a + b


if __name__ == "__main__":
    for i in fib():
        if i > 10 ** 100:
            break
        print(i)
