### Assignment 4d Attachment Video Mobile Automation: https://drive.google.com/file/d/1EkPH2kJsVBYCgapPuVDwSGSYhERG4lKe/view?usp=sharing

### Assignment 3a:

```bash
def sort_even_odd_desc(arr):
    evens = sorted([num for num in arr if num % 2 == 0], reverse=True)
    odds = sorted([num for num in arr if num % 2 != 0], reverse=True)

    return evens + odds

input_array = [3, 2, 5, 1, 8, 9, 6]
result = sort_even_odd_desc(input_array)
print(result)
```

# Robot Framework Setup & Execution Guide

This guide explains how to set up and run automation tests using Robot Framework. It covers creating a virtual environment, installing required libraries, running tests, and viewing test results.

---

## 1. Set Up Virtual Environment

Before installing Robot Framework and its dependencies, create a virtual environment (venv) to isolate your installation.

Create a virtual environment:

```bash
python -m venv venv
```

macOS/Linux:

```bash
source venv/bin/activate
```

## 2.Install Robot Framework and Required Libraries

After activating the virtual environment, install Robot Framework and the necessary libraries:

```bash
pip install robotframework
pip install robotframework-requests
pip install robotframework-seleniumlibrary
pip install robotframework-appiumlibrary
pip install urllib3
pip install robotframework-collections
```

## 3. Verify Installation

To ensure all libraries have been installed, run:

```bash
pip list | grep robotframework
```

## 4. Run Tests and Generate Report

You can run different test suites using the following commands. The results will be stored in the results/ folder.

### To run the API tests:

```bash
robot -d results api/tests/api_test.robot
```

### To run the Mobile tests:

```bash
robot -d results api/tests/mobile_test.robot
```

### To run the Web tests:

```bash
robot -d results api/tests/web_test.robot
```

## 7. View Test Results

After the tests have run, check the results/ folder for the generated files:

- log.html – Detailed test execution log.
- report.html – Summary test report.
- output.xml – Test output in XML format.

Open the report in your browser:

```bash
open results/report.html
```
