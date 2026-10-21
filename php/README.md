# Income Statement API - PHP Package

Income Statement returns the profit and loss statement for a US public company by ticker - revenue, cost of revenue, gross profit, operating income and net income - straight from SEC filings, with gross, operating and net margins and year-over-year growth calculated for you.

## Installation

Install via Composer:

```bash
composer require apiverve/incomestatement
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Incomestatement\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'ticker' => 'AAPL',
    'year' => 0,
    'quarter' => 0
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Incomestatement\Client;
use APIVerve\Incomestatement\Exceptions\APIException;
use APIVerve\Incomestatement\Exceptions\ValidationException;

try {
    $response = $client->execute(['ticker' => 'AAPL', 'year' => 0, 'quarter' => 0]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/incomestatement?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/incomestatement?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/incomestatement?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
