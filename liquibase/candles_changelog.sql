--liquibase formatted sql

--changeset your.name:1 labels:init
--comment Init candles table

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

/* liquibase rollback
DROP INDEX IF EXISTS idx_candles_pair;
DROP INDEX IF EXISTS idx_candles_interval;
DROP INDEX IF EXISTS idx_candles_date;
DROP TABLE IF EXISTS candles;
DROP INDEX IF EXISTS candles_pkey;
*/

--changeset your.name:2 labels:add_column
--comment Add metadata column

ALTER TABLE candles ADD COLUMN metadata JSONB;

/* liquibase rollback
ALTER TABLE candles DROP COLUMN IF EXISTS metadata;
*/
