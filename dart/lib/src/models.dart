/// Response models for the Income Statement API.

/// API Response wrapper.
class IncomestatementResponse {
  final String status;
  final dynamic error;
  final IncomestatementData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  IncomestatementResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory IncomestatementResponse.fromJson(Map<String, dynamic> json) => IncomestatementResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? IncomestatementData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Income Statement API.

class IncomestatementData {
  String? ticker;
  String? company;
  String? cik;
  num? fiscalYear;
  num? fiscalQuarter;
  String? filingType;
  String? filingDate;
  String? periodEnd;
  IncomestatementDataIncome? income;
  IncomestatementDataMargins? margins;
  IncomestatementDataGrowth? growth;
  IncomestatementDataFormatted? formatted;

  IncomestatementData({
    this.ticker,
    this.company,
    this.cik,
    this.fiscalYear,
    this.fiscalQuarter,
    this.filingType,
    this.filingDate,
    this.periodEnd,
    this.income,
    this.margins,
    this.growth,
    this.formatted,
  });

  factory IncomestatementData.fromJson(Map<String, dynamic> json) => IncomestatementData(
      ticker: json['ticker'],
      company: json['company'],
      cik: json['cik'],
      fiscalYear: json['fiscalYear'],
      fiscalQuarter: json['fiscalQuarter'],
      filingType: json['filingType'],
      filingDate: json['filingDate'],
      periodEnd: json['periodEnd'],
      income: json['income'] != null ? IncomestatementDataIncome.fromJson(json['income']) : null,
      margins: json['margins'] != null ? IncomestatementDataMargins.fromJson(json['margins']) : null,
      growth: json['growth'] != null ? IncomestatementDataGrowth.fromJson(json['growth']) : null,
      formatted: json['formatted'] != null ? IncomestatementDataFormatted.fromJson(json['formatted']) : null,
    );
}

class IncomestatementDataIncome {
  num? revenue;
  num? costOfRevenue;
  num? grossProfit;
  num? operatingIncome;
  num? netIncome;
  num? eps;
  num? epsBasic;
  num? sharesOutstanding;
  num? sharesOutstandingBasic;
  num? researchAndDevelopment;
  num? sellingAndMarketing;
  num? sellingGeneralAndAdmin;
  num? generalAndAdmin;
  dynamic interestExpense;
  num? incomeTax;
  num? depreciation;
  num? stockBasedCompensation;

  IncomestatementDataIncome({
    this.revenue,
    this.costOfRevenue,
    this.grossProfit,
    this.operatingIncome,
    this.netIncome,
    this.eps,
    this.epsBasic,
    this.sharesOutstanding,
    this.sharesOutstandingBasic,
    this.researchAndDevelopment,
    this.sellingAndMarketing,
    this.sellingGeneralAndAdmin,
    this.generalAndAdmin,
    this.interestExpense,
    this.incomeTax,
    this.depreciation,
    this.stockBasedCompensation,
  });

  factory IncomestatementDataIncome.fromJson(Map<String, dynamic> json) => IncomestatementDataIncome(
      revenue: json['revenue'],
      costOfRevenue: json['costOfRevenue'],
      grossProfit: json['grossProfit'],
      operatingIncome: json['operatingIncome'],
      netIncome: json['netIncome'],
      eps: json['eps'],
      epsBasic: json['epsBasic'],
      sharesOutstanding: json['sharesOutstanding'],
      sharesOutstandingBasic: json['sharesOutstandingBasic'],
      researchAndDevelopment: json['researchAndDevelopment'],
      sellingAndMarketing: json['sellingAndMarketing'],
      sellingGeneralAndAdmin: json['sellingGeneralAndAdmin'],
      generalAndAdmin: json['generalAndAdmin'],
      interestExpense: json['interestExpense'],
      incomeTax: json['incomeTax'],
      depreciation: json['depreciation'],
      stockBasedCompensation: json['stockBasedCompensation'],
    );
}

class IncomestatementDataMargins {
  num? grossMargin;
  num? operatingMargin;
  num? netMargin;
  num? effectiveTaxRate;

  IncomestatementDataMargins({
    this.grossMargin,
    this.operatingMargin,
    this.netMargin,
    this.effectiveTaxRate,
  });

  factory IncomestatementDataMargins.fromJson(Map<String, dynamic> json) => IncomestatementDataMargins(
      grossMargin: json['grossMargin'],
      operatingMargin: json['operatingMargin'],
      netMargin: json['netMargin'],
      effectiveTaxRate: json['effectiveTaxRate'],
    );
}

class IncomestatementDataGrowth {
  dynamic revenueYoY;
  dynamic netIncomeYoY;
  dynamic epsYoY;

  IncomestatementDataGrowth({
    this.revenueYoY,
    this.netIncomeYoY,
    this.epsYoY,
  });

  factory IncomestatementDataGrowth.fromJson(Map<String, dynamic> json) => IncomestatementDataGrowth(
      revenueYoY: json['revenueYoY'],
      netIncomeYoY: json['netIncomeYoY'],
      epsYoY: json['epsYoY'],
    );
}

class IncomestatementDataFormatted {
  String? revenue;
  String? grossProfit;
  String? operatingIncome;
  String? netIncome;

  IncomestatementDataFormatted({
    this.revenue,
    this.grossProfit,
    this.operatingIncome,
    this.netIncome,
  });

  factory IncomestatementDataFormatted.fromJson(Map<String, dynamic> json) => IncomestatementDataFormatted(
      revenue: json['revenue'],
      grossProfit: json['grossProfit'],
      operatingIncome: json['operatingIncome'],
      netIncome: json['netIncome'],
    );
}

class IncomestatementRequest {
  String ticker;
  int? year;
  int? quarter;

  IncomestatementRequest({
    required this.ticker,
    this.year,
    this.quarter,
  });

  Map<String, dynamic> toJson() => {
      'ticker': ticker,
      if (year != null) 'year': year,
      if (quarter != null) 'quarter': quarter,
    };
}
