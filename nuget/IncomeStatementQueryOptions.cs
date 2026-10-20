using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.IncomeStatement
{
    /// <summary>
    /// Query options for the Income Statement API
    /// </summary>
    public class IncomeStatementQueryOptions
    {
        /// <summary>
        /// Stock ticker symbol (e.g. AAPL, MSFT, ADBE)
        /// </summary>
        [JsonProperty("ticker")]
        public string Ticker { get; set; }

        /// <summary>
        /// Fiscal year to retrieve. Defaults to latest available. History covers only the quarters captured so far; a missing period answers 404 listing the available ones.
        /// </summary>
        [JsonProperty("year")]
        public int? Year { get; set; }

        /// <summary>
        /// Fiscal quarter to retrieve. Defaults to latest available.
        /// </summary>
        [JsonProperty("quarter")]
        public int? Quarter { get; set; }
    }
}
