# Function that we want to test
def func(x):
    return x + 1

def add_todo(todo):
    return todo

# Tests
def test_correct():
    assert func(4) == 5

def test_false_answer():
    assert func(3) == 8

def test_able_to_add_todo():
    assert add_todo("Mandiin Anak") == "Mandiin Anak"
