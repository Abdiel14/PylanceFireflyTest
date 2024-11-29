#!/bin/bash

# Configuración inicial
PROJECT_NAME="."

echo "Iniciando la creación del proyecto $PROJECT_NAME..."

# Crear estructura del proyecto
echo "Creando directorios..."
mkdir -p $PROJECT_NAME/{.github/workflows,tests}

# Crear el archivo principal con principios SOLID
echo "Creando fn_sum.py..."
cat <<EOL > $PROJECT_NAME/fn_sum.py
def sum_value(a, b):
    """
    Returns the sum of two numbers.
    Single Responsibility Principle (SRP): 
    This function has only one responsibility: to add two numbers.
    """
    return a + b
EOL

# Crear pruebas unitarias para suma
echo "Creando tests/test_sum.py..."
cat <<EOL > $PROJECT_NAME/tests/test_sum.py
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
EOL

# Crear pruebas unitarias para suma con pytest
echo "Creando tests/test_pytest.py..."
cat <<EOL > $PROJECT_NAME/tests/test_pytest.py
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
EOL

# Crear archivo de dependencias
echo "Creando requirements.txt..."
cat <<EOL > $PROJECT_NAME/requirements.txt
# Dependencias del proyecto
# (Por ahora vacío, unittest es parte de la librería estándar)
EOL

# Crear configuración de GitHub Actions
echo "Creando workflow de GitHub Actions..."
cat <<EOL > $PROJECT_NAME/.github/workflows/ci.yml
name: CI Pipeline

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: "3.x"

    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt
        pip install pytest

    - name: Run tests with unittest
      run: |
        python -m unittest discover -s tests

    - name: Run tests with pytest
      run: |
        export PYTHONPATH=$(pwd) 
        pytest
EOL

# Finalizar configuración
echo "Creación de proyecto completada. Estructura generada:"
# tree $PROJECT_NAME

echo "¡Proyecto $PROJECT_NAME creado con éxito!"
