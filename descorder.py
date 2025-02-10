def sort_even_odd_desc(arr):
    evens = sorted([num for num in arr if num % 2 == 0], reverse=True)
    odds = sorted([num for num in arr if num % 2 != 0], reverse=True)

    return evens + odds

input_array = [3, 2, 5, 1, 8, 9, 6]
result = sort_even_odd_desc(input_array)
print(result) 