SELECT rs.*
FROM dbo.DimEmployee e
JOIN dbo.FactResellerSales rs ON e.EmployeeKey = rs.EmployeeKey
WHERE e.LastName = 'Carson'
AND e.FirstName = 'Jillian'

SELECT rs.*
FROM dbo.DimEmployee e
JOIN dbo.FactResellerSales rs ON e.EmployeeKey = rs.EmployeeKey
WHERE e.LastName = 'Carson'
AND e.FirstName = 'Jillian'
AND OrderDateKey LIKE '2013%'

SELECT *
FROM dbo.DimEmployee e
WHERE e.LastName = 'Carson'
AND e.FirstName = 'Jillian'

INSERT INTO dbo.DimEmployee
	(
	ParentEmployeeKey, EmployeeNationalIDAlternateKey, ParentEmployeeNationalIDAlternateKey, SalesTerritoryKey, 
	FirstName, LastName, MiddleName, NameStyle, Title, HireDate, BirthDate, LoginID, EmailAddress, Phone, MaritalStatus, EmergencyContactName, EmergencyContactPhone, SalariedFlag, Gender, PayFrequency, BaseRate, VacationHours, SickLeaveHours, CurrentFlag, SalesPersonFlag, DepartmentName, StartDate, EndDate, Status, EmployeePhoto
	)
SELECT 
	ParentEmployeeKey, EmployeeNationalIDAlternateKey, ParentEmployeeNationalIDAlternateKey, SalesTerritoryKey, 
	FirstName, 'Dingo', MiddleName, NameStyle, Title, HireDate, BirthDate, LoginID, EmailAddress, Phone, MaritalStatus, EmergencyContactName, EmergencyContactPhone, SalariedFlag, Gender, PayFrequency, BaseRate, VacationHours, SickLeaveHours, CurrentFlag, SalesPersonFlag, DepartmentName, StartDate, EndDate, Status, EmployeePhoto
FROM dbo.DimEmployee e
WHERE e.LastName = 'Carson'
AND e.FirstName = 'Jillian';

SELECT SCOPE_IDENTITY()

UPDATE dbo.FactResellerSales 
SET EmployeeKey = 297
WHERE EmployeeKey = 283
AND OrderDateKey LIKE '2013%'

-- 615389812
