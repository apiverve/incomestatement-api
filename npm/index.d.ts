declare module '@apiverve/incomestatement' {
  export interface incomestatementOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface incomestatementResponse {
    status: string;
    error: string | null;
    data: IncomeStatementData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface IncomeStatementData {
      ticker:        null | string;
      company:       null | string;
      cik:           null | string;
      fiscalYear:    number | null;
      fiscalQuarter: number | null;
      filingType:    null | string;
      filingDate:    Date | null;
      periodEnd:     Date | null;
      income:        { [key: string]: number | null };
      margins:       Margins;
      growth:        Growth;
      formatted:     Formatted;
  }
  
  interface Formatted {
      revenue:         null | string;
      grossProfit:     null | string;
      operatingIncome: null | string;
      netIncome:       null | string;
  }
  
  interface Growth {
      revenueYoY:   null;
      netIncomeYoY: null;
      epsYoY:       null;
  }
  
  interface Margins {
      grossMargin:      number | null;
      operatingMargin:  number | null;
      netMargin:        number | null;
      effectiveTaxRate: number | null;
  }

  export default class incomestatementWrapper {
    constructor(options: incomestatementOptions);

    execute(callback: (error: any, data: incomestatementResponse | null) => void): Promise<incomestatementResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: incomestatementResponse | null) => void): Promise<incomestatementResponse>;
    execute(query?: Record<string, any>): Promise<incomestatementResponse>;
  }
}
