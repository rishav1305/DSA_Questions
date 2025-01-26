import colorama
from colorama import Fore, Style

# Initialize colorama for cross-platform color support
colorama.init(autoreset=True)

def run_tests(testcases, test_function):
    """
    Run tests with colored logging for pass/fail results.
    
    Args:
        testcases (list): List of test cases, where each test case is [input, expected_output]
        test_function (callable): Function to test
    """
    total_tests = len(testcases)
    passed_tests = 0

    print(f"Running {total_tests} test cases:")

    for i, testcase in enumerate(testcases, 1):
        input_value = testcase[0]
        expected = testcase[1]
        result = test_function(input_value)

        if result == expected:
            print(f"{Fore.GREEN}✓ Test {i}: PASSED{Style.RESET_ALL}")
            print(f"  Input: {input_value}")
            print(f"  Expected: {expected}")
            print(f"  Result: {result}\n")
            passed_tests += 1
        else:
            print(f"{Fore.RED}✗ Test {i}: FAILED{Style.RESET_ALL}")
            print(f"  Input: {input_value}")
            print(f"  Expected: {expected}")
            print(f"  Actual: {result}\n")

    # Summary
    print(f"{Fore.CYAN}Test Summary:{Style.RESET_ALL}")
    print(f"Total Tests: {total_tests}")
    print(f"{Fore.GREEN}Passed: {passed_tests}{Style.RESET_ALL}")
    print(f"{Fore.RED}Failed: {total_tests - passed_tests}{Style.RESET_ALL}")
