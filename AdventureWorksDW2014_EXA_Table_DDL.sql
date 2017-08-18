set autocommit off;

CREATE SCHEMA "ADVENTUREWORKSDW2014";

CREATE TABLE "ADVENTUREWORKSDW2014"."DimAccount" (
		"AccountKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"ParentAccountKey" DECIMAL(10,0) ,
		"AccountCodeAlternateKey" DECIMAL(10,0) NOT NULL ,
		"ParentAccountCodeAlternateKey" DECIMAL(10,0) ,
		"AccountDescription" VARCHAR(50) UTF8 NOT NULL ,
		"AccountType" VARCHAR(50) UTF8  ,
		"Operator" VARCHAR(50) UTF8 NOT NULL ,
		"CustomMembers" VARCHAR(300) UTF8,
		"ValueType" VARCHAR(50) UTF8 NOT NULL ,
		"CustomMemberOptions" VARCHAR(200) UTF8
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimCurrency" (
		"CurrencyKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"CurrencyAlternateKey" CHAR(3) UTF8 NOT NULL ,
		"CurrencyName" VARCHAR(50) UTF8 NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimCustomer" (
		"CustomerKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"GeographyKey" DECIMAL(10,0) NOT NULL ,
		"CustomerAlternateKey" VARCHAR(15) UTF8 NOT NULL ,
		"Title" VARCHAR(8) UTF8,
		"FirstName" VARCHAR(50) UTF8 NOT NULL ,
		"MiddleName" VARCHAR(50) UTF8 ,
		"LastName" VARCHAR(50) UTF8 NOT NULL ,
		"NameStyle" BOOLEAN NOT NULL ,
		"BirthDate" DATE NOT NULL ,
		"MaritalStatus" CHAR(1) UTF8 NOT NULL ,
		"Suffix" VARCHAR(10) UTF8,
		"Gender" VARCHAR(1) UTF8 NOT NULL ,
		"EmailAddress" VARCHAR(50) UTF8 NOT NULL ,
		"YearlyIncome" DECIMAL(19,4) NOT NULL ,
		"TotalChildren" DECIMAL(3,0) NOT NULL ,
		"NumberChildrenAtHome" DECIMAL(3,0) NOT NULL ,
		"EnglishEducation" VARCHAR(40) UTF8 NOT NULL ,
		"SpanishEducation" VARCHAR(40) UTF8 NOT NULL ,
		"FrenchEducation" VARCHAR(40) UTF8 NOT NULL ,
		"EnglishOccupation" VARCHAR(100) UTF8 NOT NULL ,
		"SpanishOccupation" VARCHAR(100) UTF8 NOT NULL ,
		"FrenchOccupation" VARCHAR(100) UTF8 NOT NULL ,
		"HouseOwnerFlag" CHAR(1) UTF8 NOT NULL ,
		"NumberCarsOwned" DECIMAL(3,0) NOT NULL ,
		"AddressLine1" VARCHAR(120) UTF8 NOT NULL ,
		"AddressLine2" VARCHAR(120) UTF8 ,
		"Phone" VARCHAR(20) UTF8 NOT NULL ,
		"DateFirstPurchase" DATE NOT NULL ,
		"CommuteDistance" VARCHAR(15) UTF8 NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimDate" (
		"DateKey" DECIMAL(10,0) NOT NULL ,
		"FullDateAlternateKey" DATE NOT NULL ,
		"DayNumberOfWeek" DECIMAL(3,0) NOT NULL ,
		"EnglishDayNameOfWeek" VARCHAR(10) UTF8 NOT NULL ,
		"SpanishDayNameOfWeek" VARCHAR(10) UTF8 NOT NULL ,
		"FrenchDayNameOfWeek" VARCHAR(10) UTF8 NOT NULL ,
		"DayNumberOfMonth" DECIMAL(3,0) NOT NULL ,
		"DayNumberOfYear" DECIMAL(5,0) NOT NULL ,
		"WeekNumberOfYear" DECIMAL(3,0) NOT NULL ,
		"EnglishMonthName" VARCHAR(10) UTF8 NOT NULL ,
		"SpanishMonthName" VARCHAR(10) UTF8 NOT NULL ,
		"FrenchMonthName" VARCHAR(10) UTF8 NOT NULL ,
		"MonthNumberOfYear" DECIMAL(3,0) NOT NULL ,
		"CalendarQuarter" DECIMAL(3,0) NOT NULL ,
		"CalendarYear" DECIMAL(5,0) NOT NULL ,
		"CalendarSemester" DECIMAL(3,0) NOT NULL ,
		"FiscalQuarter" DECIMAL(3,0) NOT NULL ,
		"FiscalYear" DECIMAL(5,0) NOT NULL ,
		"FiscalSemester" DECIMAL(3,0) NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimDepartmentGroup" (
		"DepartmentGroupKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"ParentDepartmentGroupKey" DECIMAL(10,0),
		"DepartmentGroupName" VARCHAR(50) UTF8 NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimEmployee" (
		"EmployeeKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"ParentEmployeeKey" DECIMAL(10,0) ,
		"EmployeeNationalIDAlternateKey" VARCHAR(15) UTF8 NOT NULL ,
		"ParentEmployeeNationalIDAlternateKey" VARCHAR(15) UTF8 ,
		"SalesTerritoryKey" DECIMAL(10,0) NOT NULL ,
		"FirstName" VARCHAR(50) UTF8 NOT NULL ,
		"LastName" VARCHAR(50) UTF8 NOT NULL ,
		"MiddleName" VARCHAR(50) UTF8  ,
		"NameStyle" BOOLEAN NOT NULL ,
		"Title" VARCHAR(50) UTF8 ,
		"HireDate" DATE NOT NULL ,
		"BirthDate" DATE NOT NULL ,
		"LoginID" VARCHAR(256) UTF8 NOT NULL ,
		"EmailAddress" VARCHAR(50) UTF8 NOT NULL ,
		"Phone" VARCHAR(25) UTF8 NOT NULL ,
		"MaritalStatus" CHAR(1) UTF8 NOT NULL ,
		"EmergencyContactName" VARCHAR(50) UTF8 NOT NULL ,
		"EmergencyContactPhone" VARCHAR(25) UTF8 NOT NULL ,
		"SalariedFlag" BOOLEAN NOT NULL ,
		"Gender" CHAR(1) UTF8 NOT NULL ,
		"PayFrequency" DECIMAL(3,0) NOT NULL ,
		"BaseRate" DECIMAL(19,4) NOT NULL ,
		"VacationHours" DECIMAL(5,0) NOT NULL ,
		"SickLeaveHours" DECIMAL(5,0) NOT NULL ,
		"CurrentFlag" BOOLEAN NOT NULL ,
		"SalesPersonFlag" BOOLEAN NOT NULL ,
		"DepartmentName" VARCHAR(50) UTF8 NOT NULL ,
		"StartDate" DATE NOT NULL ,
		"EndDate" DATE ,
		"Status" VARCHAR(50) UTF8,
		"EmployeePhoto" VARCHAR(100) UTF8 NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimGeography" (
		"GeographyKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"City" VARCHAR(30) UTF8 NOT NULL ,
		"StateProvinceCode" VARCHAR(3) UTF8 NOT NULL ,
		"StateProvinceName" VARCHAR(50) UTF8 NOT NULL ,
		"CountryRegionCode" VARCHAR(3) UTF8 NOT NULL ,
		"EnglishCountryRegionName" VARCHAR(50) UTF8 NOT NULL ,
		"SpanishCountryRegionName" VARCHAR(50) UTF8 NOT NULL ,
		"FrenchCountryRegionName" VARCHAR(50) UTF8 NOT NULL ,
		"PostalCode" VARCHAR(15) UTF8 NOT NULL ,
		"SalesTerritoryKey" DECIMAL(10,0) NOT NULL ,
		"IpAddressLocator" VARCHAR(15) UTF8 NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimOrganization" (
		"OrganizationKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"ParentOrganizationKey" DECIMAL(10,0) ,
		"PercentageOfOwnership" VARCHAR(16) UTF8 NOT NULL ,
		"OrganizationName" VARCHAR(50) UTF8 NOT NULL ,
		"CurrencyKey" DECIMAL(10,0) NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimProduct" (
		"ProductKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"ProductAlternateKey" VARCHAR(25) UTF8 NOT NULL ,
		"ProductSubcategoryKey" DECIMAL(10,0) ,
		"WeightUnitMeasureCode" CHAR(3) UTF8  ,
		"SizeUnitMeasureCode" CHAR(3) UTF8 ,
		"EnglishProductName" VARCHAR(50) UTF8 NOT NULL ,
		"SpanishProductName" VARCHAR(50) UTF8 ,
		"FrenchProductName" VARCHAR(50) UTF8  ,
		"StandardCost" DECIMAL(19,4) ,
		"FinishedGoodsFlag" BOOLEAN NOT NULL ,
		"Color" VARCHAR(15) UTF8 NOT NULL ,
		"SafetyStockLevel" DECIMAL(5,0) NOT NULL ,
		"ReorderPoint" DECIMAL(5,0) NOT NULL ,
		"ListPrice" DECIMAL(19,4),
		"Size" VARCHAR(50) UTF8  ,
		"SizeRange" VARCHAR(50) UTF8  ,
		"Weight" DOUBLE  ,
		"DaysToManufacture" DECIMAL(10,0)  ,
		"ProductLine" CHAR(2) UTF8  ,
		"DealerPrice" DECIMAL(19,4)  ,
		"Class" CHAR(2) UTF8 ,
		"Style" CHAR(2) UTF8 ,
		"ModelName" VARCHAR(50) UTF8  ,
		"LargePhoto" VARCHAR(100) UTF8 ,
		"EnglishDescription" VARCHAR(400) UTF8  ,
		"FrenchDescription" VARCHAR(400) UTF8 ,
		"ChineseDescription" VARCHAR(400) UTF8  ,
		"ArabicDescription" VARCHAR(400) UTF8  ,
		"HebrewDescription" VARCHAR(400) UTF8  ,
		"ThaiDescription" VARCHAR(400) UTF8,
		"GermanDescription" VARCHAR(400) UTF8  ,
		"JapaneseDescription" VARCHAR(400) UTF8  ,
		"TurkishDescription" VARCHAR(400) UTF8 ,
		"StartDate" TIMESTAMP NOT NULL ,
		"EndDate" TIMESTAMP ,
		"Status" VARCHAR(7) UTF8  
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimProductCategory" (
		"ProductCategoryKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"ProductCategoryAlternateKey" DECIMAL(10,0) NOT NULL ,
		"EnglishProductCategoryName" VARCHAR(50) UTF8 NOT NULL ,
		"SpanishProductCategoryName" VARCHAR(50) UTF8 NOT NULL ,
		"FrenchProductCategoryName" VARCHAR(50) UTF8 NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimProductSubcategory" (
		"ProductSubcategoryKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"ProductSubcategoryAlternateKey" DECIMAL(10,0) NOT NULL ,
		"EnglishProductSubcategoryName" VARCHAR(50) UTF8 NOT NULL ,
		"SpanishProductSubcategoryName" VARCHAR(50) UTF8 NOT NULL ,
		"FrenchProductSubcategoryName" VARCHAR(50) UTF8 NOT NULL ,
		"ProductCategoryKey" DECIMAL(10,0) NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimPromotion" (
		"PromotionKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"PromotionAlternateKey" DECIMAL(10,0) NOT NULL ,
		"EnglishPromotionName" VARCHAR(255) UTF8 NOT NULL ,
		"SpanishPromotionName" VARCHAR(255) UTF8 NOT NULL ,
		"FrenchPromotionName" VARCHAR(255) UTF8 NOT NULL ,
		"DiscountPct" DOUBLE NOT NULL ,
		"EnglishPromotionType" VARCHAR(50) UTF8 NOT NULL ,
		"SpanishPromotionType" VARCHAR(50) UTF8 NOT NULL ,
		"FrenchPromotionType" VARCHAR(50) UTF8 NOT NULL ,
		"EnglishPromotionCategory" VARCHAR(50) UTF8 NOT NULL ,
		"SpanishPromotionCategory" VARCHAR(50) UTF8 NOT NULL ,
		"FrenchPromotionCategory" VARCHAR(50) UTF8 NOT NULL ,
		"StartDate" TIMESTAMP NOT NULL ,
		"EndDate" TIMESTAMP NOT NULL ,
		"MinQty" DECIMAL(10,0) NOT NULL ,
		"MaxQty" DECIMAL(10,0)  
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimReseller" (
		"ResellerKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"GeographyKey" DECIMAL(10,0) NOT NULL ,
		"ResellerAlternateKey" VARCHAR(15) UTF8 NOT NULL ,
		"Phone" VARCHAR(25) UTF8 NOT NULL ,
		"BusinessType" VARCHAR(20) ASCII NOT NULL ,
		"ResellerName" VARCHAR(50) UTF8 NOT NULL ,
		"NumberEmployees" DECIMAL(10,0) NOT NULL ,
		"OrderFrequency" CHAR(1) ASCII NOT NULL ,
		"OrderMonth" DECIMAL(3,0)  ,
		"FirstOrderYear" DECIMAL(10,0) ,
		"LastOrderYear" DECIMAL(10,0)  ,
		"ProductLine" VARCHAR(50) UTF8 NOT NULL ,
		"AddressLine1" VARCHAR(60) UTF8 NOT NULL ,
		"AddressLine2" VARCHAR(60) UTF8 ,
		"AnnualSales" DECIMAL(19,4) NOT NULL ,
		"BankName" VARCHAR(50) UTF8 NOT NULL ,
		"MinPaymentType" DECIMAL(3,0) ,
		"MinPaymentAmount" DECIMAL(19,4) ,
		"AnnualRevenue" DECIMAL(19,4)  ,
		"YearOpened" DECIMAL(10,0) 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimSalesReason" (
		"SalesReasonKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"SalesReasonAlternateKey" DECIMAL(10,0) NOT NULL ,
		"SalesReasonName" VARCHAR(50) UTF8 NOT NULL ,
		"SalesReasonReasonType" VARCHAR(50) UTF8 NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimSalesTerritory" (
		"SalesTerritoryKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"SalesTerritoryAlternateKey" DECIMAL(10,0) NOT NULL ,
		"SalesTerritoryRegion" VARCHAR(50) UTF8 NOT NULL ,
		"SalesTerritoryCountry" VARCHAR(50) UTF8 NOT NULL ,
		"SalesTerritoryGroup" VARCHAR(50) UTF8 NOT NULL ,
		"SalesTerritoryImage" VARCHAR(100) UTF8 NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."DimScenario" (
		"ScenarioKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"ScenarioName" VARCHAR(50) UTF8 NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."FactAdditionalInternationalProductDescription" (
		"ProductKey" DECIMAL(10,0) NOT NULL ,
		"CultureName" VARCHAR(50) UTF8 NOT NULL ,
		"ProductDescription" VARCHAR(4000) UTF8 NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."FactCallCenter" (
		"FactCallCenterID" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"DateKey" DECIMAL(10,0) NOT NULL ,
		"WageType" VARCHAR(15) UTF8 NOT NULL ,
		"Shift" VARCHAR(20) UTF8 NOT NULL ,
		"LevelOneOperators" DECIMAL(5,0) NOT NULL ,
		"LevelTwoOperators" DECIMAL(5,0) NOT NULL ,
		"TotalOperators" DECIMAL(5,0) NOT NULL ,
		"Calls" DECIMAL(10,0) NOT NULL ,
		"AutomaticResponses" DECIMAL(10,0) NOT NULL ,
		"Orders" DECIMAL(10,0) NOT NULL ,
		"IssuesRaised" DECIMAL(5,0) NOT NULL ,
		"AverageTimePerIssue" DECIMAL(5,0) NOT NULL ,
		"ServiceGrade" DOUBLE NOT NULL ,
		"Date" TIMESTAMP NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."FactCurrencyRate" (
		"CurrencyKey" DECIMAL(10,0) NOT NULL ,
		"DateKey" DECIMAL(10,0) NOT NULL ,
		"AverageRate" DOUBLE NOT NULL ,
		"EndOfDayRate" DOUBLE NOT NULL ,
		"Date" TIMESTAMP NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."FactFinance" (
		"FinanceKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"DateKey" DECIMAL(10,0) NOT NULL ,
		"OrganizationKey" DECIMAL(10,0) NOT NULL ,
		"DepartmentGroupKey" DECIMAL(10,0) NOT NULL ,
		"ScenarioKey" DECIMAL(10,0) NOT NULL ,
		"AccountKey" DECIMAL(10,0) NOT NULL ,
		"Amount" DOUBLE NOT NULL ,
		"Date" TIMESTAMP NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."FactInternetSales" (
		"ProductKey" DECIMAL(10,0) NOT NULL ,
		"OrderDateKey" DECIMAL(10,0) NOT NULL ,
		"DueDateKey" DECIMAL(10,0) NOT NULL ,
		"ShipDateKey" DECIMAL(10,0) NOT NULL ,
		"CustomerKey" DECIMAL(10,0) NOT NULL ,
		"PromotionKey" DECIMAL(10,0) NOT NULL ,
		"CurrencyKey" DECIMAL(10,0) NOT NULL ,
		"SalesTerritoryKey" DECIMAL(10,0) NOT NULL ,
		"SalesOrderNumber" VARCHAR(20) UTF8 NOT NULL ,
		"SalesOrderLineNumber" DECIMAL(3,0) NOT NULL ,
		"RevisionNumber" DECIMAL(3,0) NOT NULL ,
		"OrderQuantity" DECIMAL(5,0) NOT NULL ,
		"UnitPrice" DECIMAL(19,4) NOT NULL ,
		"ExtendedAmount" DECIMAL(19,4) NOT NULL ,
		"UnitPriceDiscountPct" DOUBLE NOT NULL ,
		"DiscountAmount" DOUBLE NOT NULL ,
		"ProductStandardCost" DECIMAL(19,4) NOT NULL ,
		"TotalProductCost" DECIMAL(19,4) NOT NULL ,
		"SalesAmount" DECIMAL(19,4) NOT NULL ,
		"TaxAmt" DECIMAL(19,4) NOT NULL ,
		"Freight" DECIMAL(19,4) NOT NULL ,
		"CarrierTrackingNumber" VARCHAR(25) UTF8  ,
		"CustomerPONumber" VARCHAR(25) UTF8 ,
		"OrderDate" TIMESTAMP NOT NULL ,
		"DueDate" TIMESTAMP NOT NULL ,
		"ShipDate" TIMESTAMP NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."FactInternetSalesReason" (
		"SalesOrderNumber" VARCHAR(20) UTF8 NOT NULL ,
		"SalesOrderLineNumber" DECIMAL(3,0) NOT NULL ,
		"SalesReasonKey" DECIMAL(10,0) NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."FactProductInventory" (
		"ProductKey" DECIMAL(10,0) NOT NULL ,
		"DateKey" DECIMAL(10,0) NOT NULL ,
		"MovementDate" DATE NOT NULL ,
		"UnitCost" DECIMAL(19,4) NOT NULL ,
		"UnitsIn" DECIMAL(10,0) NOT NULL ,
		"UnitsOut" DECIMAL(10,0) NOT NULL ,
		"UnitsBalance" DECIMAL(10,0) NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."FactResellerSales" (
		"ProductKey" DECIMAL(10,0) NOT NULL ,
		"OrderDateKey" DECIMAL(10,0) NOT NULL ,
		"DueDateKey" DECIMAL(10,0) NOT NULL ,
		"ShipDateKey" DECIMAL(10,0) NOT NULL ,
		"ResellerKey" DECIMAL(10,0) NOT NULL ,
		"EmployeeKey" DECIMAL(10,0) NOT NULL ,
		"PromotionKey" DECIMAL(10,0) NOT NULL ,
		"CurrencyKey" DECIMAL(10,0) NOT NULL ,
		"SalesTerritoryKey" DECIMAL(10,0) NOT NULL ,
		"SalesOrderNumber" VARCHAR(20) UTF8 NOT NULL ,
		"SalesOrderLineNumber" DECIMAL(3,0) NOT NULL ,
		"RevisionNumber" DECIMAL(3,0) NOT NULL ,
		"OrderQuantity" DECIMAL(5,0) NOT NULL ,
		"UnitPrice" DECIMAL(19,4) NOT NULL ,
		"ExtendedAmount" DECIMAL(19,4) NOT NULL ,
		"UnitPriceDiscountPct" DOUBLE NOT NULL ,
		"DiscountAmount" DOUBLE NOT NULL ,
		"ProductStandardCost" DECIMAL(19,4) NOT NULL ,
		"TotalProductCost" DECIMAL(19,4) NOT NULL ,
		"SalesAmount" DECIMAL(19,4) NOT NULL ,
		"TaxAmt" DECIMAL(19,4) NOT NULL ,
		"Freight" DECIMAL(19,4) NOT NULL ,
		"CarrierTrackingNumber" VARCHAR(25) UTF8 NOT NULL ,
		"CustomerPONumber" VARCHAR(25) UTF8 NOT NULL ,
		"OrderDate" TIMESTAMP NOT NULL ,
		"DueDate" TIMESTAMP NOT NULL ,
		"ShipDate" TIMESTAMP NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."FactSalesQuota" (
		"SalesQuotaKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"EmployeeKey" DECIMAL(10,0) NOT NULL ,
		"DateKey" DECIMAL(10,0) NOT NULL ,
		"CalendarYear" DECIMAL(5,0) NOT NULL ,
		"CalendarQuarter" DECIMAL(3,0) NOT NULL ,
		"SalesAmountQuota" DECIMAL(19,4) NOT NULL ,
		"Date" TIMESTAMP NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."FactSurveyResponse" (
		"SurveyResponseKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"DateKey" DECIMAL(10,0) NOT NULL ,
		"CustomerKey" DECIMAL(10,0) NOT NULL ,
		"ProductCategoryKey" DECIMAL(10,0) NOT NULL ,
		"EnglishProductCategoryName" VARCHAR(50) UTF8 NOT NULL ,
		"ProductSubcategoryKey" DECIMAL(10,0) NOT NULL ,
		"EnglishProductSubcategoryName" VARCHAR(50) UTF8 NOT NULL ,
		"Date" TIMESTAMP NOT NULL 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."NewFactCurrencyRate" (
		"AverageRate" DOUBLE NOT NULL ,
		"CurrencyID" VARCHAR(3) UTF8 NOT NULL ,
		"CurrencyDate" DATE NOT NULL ,
		"EndOfDayRate" DOUBLE NOT NULL ,
		"CurrencyKey" DECIMAL(10,0) NOT NULL ,
		"DateKey" DECIMAL(10,0) 
);

CREATE TABLE "ADVENTUREWORKSDW2014"."ProspectiveBuyer" (
		"ProspectiveBuyerKey" DECIMAL(10,0) IDENTITY 0 NOT NULL ,
		"ProspectAlternateKey" VARCHAR(15) UTF8 NOT NULL ,
		"FirstName" VARCHAR(50) UTF8 NOT NULL ,
		"MiddleName" VARCHAR(50) UTF8 ,
		"LastName" VARCHAR(50) UTF8 NOT NULL ,
		"BirthDate" TIMESTAMP NOT NULL ,
		"MaritalStatus" CHAR(1) UTF8 NOT NULL ,
		"Gender" VARCHAR(1) UTF8 NOT NULL ,
		"EmailAddress" VARCHAR(50) UTF8 NOT NULL ,
		"YearlyIncome" DECIMAL(19,4) NOT NULL ,
		"TotalChildren" DECIMAL(3,0) NOT NULL ,
		"NumberChildrenAtHome" DECIMAL(3,0) NOT NULL ,
		"Education" VARCHAR(40) UTF8 NOT NULL ,
		"Occupation" VARCHAR(100) UTF8 NOT NULL ,
		"HouseOwnerFlag" CHAR(1) UTF8 NOT NULL ,
		"NumberCarsOwned" DECIMAL(3,0) NOT NULL ,
		"AddressLine1" VARCHAR(120) UTF8 NOT NULL ,
		"AddressLine2" VARCHAR(120) UTF8 ,
		"City" VARCHAR(30) UTF8 NOT NULL ,
		"StateProvinceCode" VARCHAR(3) UTF8 NOT NULL ,
		"PostalCode" VARCHAR(15) UTF8 NOT NULL ,
		"Phone" VARCHAR(20) UTF8 NOT NULL ,
		"Salutation" VARCHAR(8) UTF8 NOT NULL ,
		"Unknown" DECIMAL(10,0) NOT NULL 
);


commit;