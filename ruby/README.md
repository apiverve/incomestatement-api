# Income Statement API - Ruby Gem

Income Statement returns the profit and loss statement for a US public company by ticker - revenue, cost of revenue, gross profit, operating income and net income - straight from SEC filings, with gross, operating and net margins and year-over-year growth calculated for you.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_incomestatement'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_incomestatement
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_incomestatement'

# Initialize the client
client = APIVerve::Incomestatement::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  ticker: "AAPL",
  year: 0,
  quarter: 0
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ ticker: "AAPL", year: 0, quarter: 0 })
  puts response["data"]
rescue APIVerve::Incomestatement::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Incomestatement::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Incomestatement::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/incomestatement?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/incomestatement?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/incomestatement?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
