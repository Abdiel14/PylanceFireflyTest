import unittest
from fn_sum import sum_value

class TestSum(unittest.TestCase):
    """
    Single Responsibility Principle (SRP): 
    This file only contains tests for the sum function.
    """

    def test_positive_numbers(self):
        """ Test with positive numbers """
        self.assertEqual(sum_value(2, 3), 5)

    def test_negative_numbers(self):
        """ Test with negative numbers """
        self.assertEqual(sum_value(-2, -3), -5)

    def test_mixt_numbers(self):
        """ Test with mixt numbers """
        self.assertEqual(sum_value(-2, 3), 1)

if __name__ == "__main__":
    unittest.main()
