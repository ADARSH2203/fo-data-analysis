CREATE TABLE exchange_master (
    exchange_id INT PRIMARY KEY,
    exchange VARCHAR(10)
);

CREATE TABLE market_entities (
    entity_id INT PRIMARY KEY,
    symbol VARCHAR(50),
    instrument VARCHAR(20),
    exchange_id INT
);

CREATE TABLE contract_specs (
    contract_id INT PRIMARY KEY,
    symbol VARCHAR(50),
    instrument VARCHAR(20),
    expiry_dt DATE,
    strike_pr DOUBLE,
    option_typ VARCHAR(5),
    entity_id INT
);

CREATE TABLE trading_data (
    trade_id BIGINT PRIMARY KEY,
    symbol VARCHAR(50),
    expiry_dt DATE,
    strike_pr DOUBLE,
    option_typ VARCHAR(5),
    open DOUBLE,
    high DOUBLE,
    low DOUBLE,
    close DOUBLE,
    open_int BIGINT,
    timestamp DATE,
    exchange VARCHAR(10),
    entity_id INT,
    contract_id INT
);
