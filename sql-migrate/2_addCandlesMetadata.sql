-- +migrate Down

ALTER TABLE candles DROP COLUMN IF EXISTS metadata;

-- +migrate Up

ALTER TABLE candles ADD COLUMN metadata JSONB;
