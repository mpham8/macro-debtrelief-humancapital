import numpy as np

class Search:
  def __init__(self, function, left, initial_guess, right, tolerance) -> None:
    self.function = function
    self.left = left
    self.right = right
    self.initial_guess = initial_guess
    self.tolerance = tolerance

  def find_max(self):
    golden_ratio = ((1+np.sqrt(5))/2)
    golden_ratio_dec = golden_ratio - 1


    if abs(self.right - self.initial_guess) >= abs(self.initial_guess - self.left):
      golden_left = self.initial_guess
      golden_right = self.initial_guess + (1 - golden_ratio_dec) * (self.right - self.initial_guess)
    else:
      golden_right = self.initial_guess
      golden_left = self.initial_guess - (1 - golden_ratio_dec) * (self.initial_guess - self.left)

    iterations = 0
    while (self.right - self.left) > self.tolerance:
      if self.function(golden_left) < self.function(golden_right):
        self.left = golden_left
      elif self.function(golden_left) > self.function(golden_right):
        self.right = golden_right
      elif self.function(golden_left) == self.function(golden_right):
        self.left = golden_left
        self.right = golden_right

      iterations += 1

      # print(f"left = {self.left}")
      # print(f"right = {self.right}")

      golden_left = self.left + (1 - golden_ratio_dec) * (self.right-self.left)
      golden_right = self.left + (golden_ratio_dec) * (self.right-self.left)
    
    print(iterations)
    return self.left if self.function(self.left) > self.function(self.right)  else self.right




# def testfunc(x):
#     return -x**2 + 4*x + 6
# result = Search(testfunc,-2.2,0.0,10.0,0.001).find_max()
# print(result)
def testfunc(x):
    return -x**2 + 4*x + 6

def run_tests():
    # Test case 1: Simple quadratic function
    search1 = Search(testfunc, -2.2, 0, 10.0, 0.001)
    result1 = search1.find_max()
    print(f"Test case 1 result: x = {result1}, f(x) = {testfunc(result1)}")

    # Test case 2: Different interval
    search2 = Search(testfunc, 0.0, 0.0000, 5.0, 0.001)
    result2 = search2.find_max()
    print(f"Test case 2 result: x = {result2}, f(x) = {testfunc(result2)}")

    # Test case 3: Function with a peak at x = 0
    def testfunc2(x):
        return -x**2 + 1
    search3 = Search(testfunc2, -5.0, 0, 5.0, 0.001)
    result3 = search3.find_max()
    print(f"Test case 3 result: x = {result3}, f(x) = {testfunc2(result3)}")


    # Test case 5: Exponential decay function
    def testfunc4(x):
        return -np.exp(-x) + x
    search5 = Search(testfunc4, 0, 5, 10, 0.001)
    result5 = search5.find_max()
    print(f"Test case 5 result: x = {result5}, f(x) = {testfunc4(result5)}")

run_tests()