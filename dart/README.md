# Income Statement API - Dart/Flutter Client

Income Statement returns the profit and loss statement for a US public company by ticker - revenue, cost of revenue, gross profit, operating income and net income - straight from SEC filings, with gross, operating and net margins and year-over-year growth calculated for you.

[![pub package](https://img.shields.io/pub/v/apiverve_incomestatement.svg)](https://pub.dev/packages/apiverve_incomestatement)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Income Statement API](https://apiverve.com/marketplace/incomestatement?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_incomestatement: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_incomestatement/apiverve_incomestatement.dart';

void main() async {
  final client = IncomestatementClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'ticker': 'AAPL',
      'year': 0,
      'quarter': 0
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Income Statement API](https://apiverve.com/marketplace/incomestatement?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/incomestatement](https://docs.apiverve.com/ref/incomestatement?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
