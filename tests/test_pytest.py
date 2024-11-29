import pytest
from fn_sum import sum_value

def test_positive_numbers():
    """ Test with positive numbers """
    assert sum_value(7, 3) == 10

# Test con números negativos
def test_negative_numbers():
    """ Test with negative numbers """
    assert sum_value(-3, -4) == -7


def test_sum_mixt():
    """ Test with mixt numbers """
    assert sum_value(-7, 6) == 1
