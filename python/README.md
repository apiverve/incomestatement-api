Income Statement API
============

Income Statement returns the profit and loss statement for a US public company by ticker - revenue, cost of revenue, gross profit, operating income and net income - straight from SEC filings, with gross, operating and net margins and year-over-year growth calculated for you.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-incomestatement.svg)](https://pypi.org/project/apiverve-incomestatement/)

This is a Python wrapper for the [Income Statement API](https://apiverve.com/marketplace/incomestatement?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-incomestatement
```

Using `pip3`:

```bash
pip3 install apiverve-incomestatement
```

---

## Configuration

Before using the Income Statement API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_incomestatement.apiClient import IncomestatementAPIClient

# Initialize the client with your APIVerve API key
api = IncomestatementAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Income Statement API documentation is found here: [https://docs.apiverve.com/ref/incomestatement](https://docs.apiverve.com/ref/incomestatement?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_incomestatement.apiClient import IncomestatementAPIClient

# Initialize the client with your APIVerve API key
api = IncomestatementAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "ticker": "AAPL",
    "company": "Apple Inc.",
    "cik": "0000320193",
    "fiscalYear": 2026,
    "fiscalQuarter": 3,
    "filingType": "10-Q",
    "filingDate": "2026-07-31",
    "periodEnd": "2026-06-27",
    "income": {
      "revenue": 109417000000,
      "costOfRevenue": 54647000000,
      "grossProfit": 54770000000,
      "operatingIncome": 35695000000,
      "netIncome": 29789000000,
      "eps": 2.02,
      "epsBasic": 2.03,
      "sharesOutstanding": 14714676000,
      "sharesOutstandingBasic": 14656110000,
      "researchAndDevelopment": 11729000000,
      "sellingAndMarketing": 5034000000,
      "sellingGeneralAndAdmin": 7346000000,
      "generalAndAdmin": 2312000000,
      "interestExpense": null,
      "incomeTax": 6478000000,
      "depreciation": 9973000000,
      "stockBasedCompensation": 10523000000
    },
    "margins": {
      "grossMargin": 50.06,
      "operatingMargin": 32.62,
      "netMargin": 27.23,
      "effectiveTaxRate": 18.15
    },
    "growth": {
      "revenueYoY": null,
      "netIncomeYoY": null,
      "epsYoY": null
    },
    "formatted": {
      "revenue": "$109.42B",
      "grossProfit": "$54.77B",
      "operatingIncome": "$35.70B",
      "netIncome": "$29.79B"
    }
  }
}
```

---

## Error Handling

The API client provides comprehensive error handling through the `IncomestatementAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_incomestatement.apiClient import IncomestatementAPIClient, IncomestatementAPIClientError

api = IncomestatementAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except IncomestatementAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_incomestatement.apiClient import IncomestatementAPIClient, IncomestatementAPIClientError

api = IncomestatementAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except IncomestatementAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_incomestatement.apiClient import IncomestatementAPIClient, IncomestatementAPIClientError

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}

# Using context manager ensures proper cleanup
with IncomestatementAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except IncomestatementAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_incomestatement.apiClient import IncomestatementAPIClient

# Enable debug mode
api = IncomestatementAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_incomestatement.apiClient import IncomestatementAPIClient

api = IncomestatementAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
