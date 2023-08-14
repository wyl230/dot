#include <algorithm>
#include <iostream>
#include <vector>

void fib() { return; }

void fib() { ret }

int main(int argc, char *argv[]) {
  std::vector<int> v{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
  auto a = std::count_if(v.begin(), v.end(), [&](int x) { return x % 2 == 0; });
  std::cout << a << std::endl;
  return 0;
}
