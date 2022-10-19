from typing import List

def twoSum(nums: List[int], target: int) -> List [int]:
    values = {}
    for idx, value in enumerate(nums):
        if target - value in values:
            return [values[target - value], idx]
        else:
            values[value] = idx

def main():
    numbers = int(input("Create list of numbers: "))
    target = input("Input value to add: ")
    answer = twoSum(numbers, target)
    print (answer)

if __name__ == "__main__":
    main()
