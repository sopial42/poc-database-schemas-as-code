CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE candles(
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  "date"      TIMESTAMPTZ NOT NULL,
  pair        TEXT NOT NULL,
  interval    TEXT NOT NULL,
  "open"      NUMERIC NOT NULL,
  "close"     NUMERIC NOT NULL,
  high        NUMERIC NOT NULL,
  low         NUMERIC NOT NULL,
  UNIQUE ("date", pair, interval)
);

CREATE INDEX idx_candles_pair ON candles ("pair");
CREATE INDEX idx_candles_interval ON candles ("interval");
CREATE INDEX idx_candles_date ON candles ("date");
