F&O Data Analysis using Polars

## Objective:
To design and analyze a high-volume Futures & Options dataset (~2.5M rows) and extract insights such as open interest trends, volatility, and trading activity.

---

## Dataset
- Source: NSE Future & Options Dataset (Kaggle)
- Rows: ~2.5 million
- Columns: Instrument, Symbol, Expiry Date, Strike Price, OHLC, Open Interest, Timestamp

---

##  Approach

Due to MySQL limitations with large datasets, data processing was performed using **Polars**, which provides efficient in-memory computation.

### Steps:
- Loaded raw CSV dataset
- Fixed inconsistent datatypes (float/int issues)
- Converted date columns
- Removed null values
- Removed duplicate records
- Built structured tables:
  - market_entities
  - contract_specs
  - trading_data

---

##  Database Design

A normalized schema (3NF) was used with:

- **Exchanges**
- **Instruments (Entities)**
- **Contracts**
- **Trades**

Supports multi-exchange data (NSE, BSE, MCX)

---

##  Key Analysis

### 1. Top Open Interest Contracts
Identifies most liquid contracts.

### 2. Open Interest Change
Detects market activity shifts.

### 3. Volatility Analysis
7-day rolling standard deviation of close prices.

### 4. Most Active Stocks
Based on traded contracts.

### 5. Expiry Analysis
Activity across expiry dates.

### 6. Option Type Analysis
Comparison of CE vs PE.

### 7. Daily Trend
Total open interest over time.

---

## Optimizations

- Index on timestamp, symbol, exchange
- Partitioning by expiry date
- Efficient processing using Polars instead of SQL joins

---

##  Tools Used

- Python (Polars)
- Google Colab
- GitHub

---

## Files in Repository

- `notebook.ipynb` → Data processing and analysis
- `schema.sql` → Database structure
- `queries.sql` → SQL queries
- CSV outputs for each analysis

---

## Conclusion

- Successfully handled large-scale financial data
- Built scalable pipeline
- Extracted meaningful trading insights

---
