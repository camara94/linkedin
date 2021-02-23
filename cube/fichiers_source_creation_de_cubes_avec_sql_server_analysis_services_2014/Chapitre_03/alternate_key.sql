SELECT TOP 10 *
FROM AdventureWorks2014.Sales.Currency
ORDER BY CurrencyCode;

SELECT TOP 10 *
FROM AdventureWorksDW2014.dbo.DimCurrency
ORDER BY CurrencyAlternateKey;

-- un changement intempestif
UPDATE AdventureWorks2014.Sales.Currency
SET Name = 'Safe Haven'
WHERE CurrencyCode = 'CHF';

-- que faire ??
UPDATE AdventureWorksDW2014.dbo.DimCurrency
SET CurrencyName = 'Safe Haven',
	FrenchCurrencyName = 'Monnaie Refuge'
WHERE CurrencyAlternateKey = 'CHF';

-- ou ...
INSERT INTO AdventureWorksDW2014.dbo.DimCurrency
	(CurrencyAlternateKey, CurrencyName, FrenchCurrencyName)
VALUES
	('CHF', 'Safe Haven', 'Monnaie Refuge');

-- testons ça
SELECT * 
FROM AdventureWorksDW2014.dbo.FactInternetSales
WHERE CurrencyKey = 
	(	SELECT CurrencyKey 
		FROM AdventureWorksDW2014.dbo.DimCurrency
		WHERE CurrencyAlternateKey = 'CHF'
	)

UPDATE TOP (10) AdventureWorksDW2014.dbo.FactInternetSales
SET CurrencyKey = 
	(	SELECT CurrencyKey 
		FROM AdventureWorksDW2014.dbo.DimCurrency
		WHERE CurrencyAlternateKey = 'CHF'
		AND CurrencyName = 'Swiss Franc'
	)
WHERE SalesOrderNumber LIKE 'SO6%'

UPDATE TOP (10) AdventureWorksDW2014.dbo.FactInternetSales
SET CurrencyKey = 
	(	SELECT CurrencyKey 
		FROM AdventureWorksDW2014.dbo.DimCurrency
		WHERE CurrencyAlternateKey = 'CHF'
		AND CurrencyName = 'Safe Haven'
	)
WHERE SalesOrderNumber LIKE 'SO7%';