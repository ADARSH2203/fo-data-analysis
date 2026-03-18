-- Top 10 Open Interest
SELECT symbol, strike_pr, option_typ, open_int
FROM trading_data
ORDER BY open_int DESC
LIMIT 10;

-- OI Change
SELECT *
FROM trading_data
ORDER BY chg_in_oi DESC
LIMIT 10;

-- Volatility (7-day rolling)
SELECT symbol, timestamp,
STDDEV(close) OVER (
    PARTITION BY symbol
    ORDER BY timestamp
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
) AS volatility
FROM trading_data;

-- Most Active Stocks
SELECT symbol, SUM(contracts) AS total_contracts
FROM trading_data
GROUP BY symbol
ORDER BY total_contracts DESC;

-- Expiry Analysis
SELECT expiry_dt, SUM(contracts), AVG(open_int)
FROM trading_data
GROUP BY expiry_dt;

-- Option Type Analysis
SELECT option_typ, SUM(contracts), AVG(open_int)
FROM trading_data
GROUP BY option_typ;
