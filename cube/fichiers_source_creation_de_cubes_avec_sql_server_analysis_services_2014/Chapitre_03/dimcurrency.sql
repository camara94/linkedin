SELECT * FROM dbo.DimCurrency ORDER BY CurrencyAlternateKey;

ALTER TABLE dbo.DimCurrency
ADD FrenchCurrencyName varchar(50) NULL;

UPDATE dbo.DimCurrency
SET FrenchCurrencyName = CurrencyName;

UPDATE dbo.DimCurrency
SET FrenchCurrencyName = 'Franc Suisse'
WHERE CurrencyAlternateKey = N'CHF';
