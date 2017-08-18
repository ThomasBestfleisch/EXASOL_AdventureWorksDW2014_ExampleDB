
-- vDMPrep will be used as a data source by the other data mining views.  
-- Uses DW data at customer, product, day, etc. granularity and
-- gets region, model, year, month, etc.
CREATE VIEW ADVENTUREWORKSDW2014.[vDMPrep]
AS
    SELECT
        pc.[EnglishProductCategoryName]
        ,Coalesce(p.[ModelName], p.[EnglishProductName]) AS [Model]
        ,c.[CustomerKey]
        ,s.[SalesTerritoryGroup] AS [Region]
        ,CASE
            WHEN Month(CURRENT_DATE) < Month(c.[BirthDate])
                THEN YEARS_BETWEEN(CURRENT_DATE, c.[BirthDate]) - 1
            WHEN Month(CURRENT_DATE) = Month(c.[BirthDate])
            AND Day(CURRENT_DATE) < Day(c.[BirthDate])
                THEN YEARS_BETWEEN(CURRENT_DATE,c.[BirthDate]) - 1
            ELSE YEARS_BETWEEN(CURRENT_DATE,c.[BirthDate])
        END AS [Age]
        ,CASE
            WHEN c.[YearlyIncome] < 40000 THEN 'Low'
            WHEN c.[YearlyIncome] > 60000 THEN 'High'
            ELSE 'Moderate'
        END AS [IncomeGroup]
        ,d.[CalendarYear]
        ,d.[FiscalYear]
        ,d.[MonthNumberOfYear] AS [Month]
        ,f.[SalesOrderNumber] AS [OrderNumber]
        ,f.[SalesOrderLineNumber] AS [LineNumber]
        ,f.[OrderQuantity] AS [Quantity]
        ,f.[ExtendedAmount] AS [Amount]  
    FROM
        ADVENTUREWORKSDW2014.[FactInternetSales] f
    INNER JOIN ADVENTUREWORKSDW2014.[DimDate] d
        ON f.[OrderDateKey] = d.[DateKey]
    INNER JOIN ADVENTUREWORKSDW2014.[DimProduct] p
        ON f.[ProductKey] = p.[ProductKey]
    INNER JOIN ADVENTUREWORKSDW2014.[DimProductSubcategory] psc
        ON p.[ProductSubcategoryKey] = psc.[ProductSubcategoryKey]
    INNER JOIN ADVENTUREWORKSDW2014.[DimProductCategory] pc
        ON psc.[ProductCategoryKey] = pc.[ProductCategoryKey]
    INNER JOIN ADVENTUREWORKSDW2014.[DimCustomer] c
        ON f.[CustomerKey] = c.[CustomerKey]
    INNER JOIN ADVENTUREWORKSDW2014.[DimGeography] g
        ON c.[GeographyKey] = g.[GeographyKey]
    INNER JOIN ADVENTUREWORKSDW2014.[DimSalesTerritory] s
        ON g.[SalesTerritoryKey] = s.[SalesTerritoryKey] 
;


-- vTargetMail supports targeted mailing data model
-- Uses vDMPrep to determine if a customer buys a bike and joins to DimCustomer
CREATE VIEW ADVENTUREWORKSDW2014.[vTargetMail] 
AS
    SELECT
        c.[CustomerKey], 
        c.[GeographyKey], 
        c.[CustomerAlternateKey], 
        c.[Title], 
        c.[FirstName], 
        c.[MiddleName], 
        c.[LastName], 
        c.[NameStyle], 
        c.[BirthDate], 
        c.[MaritalStatus], 
        c.[Suffix], 
        c.[Gender], 
        c.[EmailAddress], 
        c.[YearlyIncome], 
        c.[TotalChildren], 
        c.[NumberChildrenAtHome], 
        c.[EnglishEducation], 
        c.[SpanishEducation], 
        c.[FrenchEducation], 
        c.[EnglishOccupation], 
        c.[SpanishOccupation], 
        c.[FrenchOccupation], 
        c.[HouseOwnerFlag], 
        c.[NumberCarsOwned], 
        c.[AddressLine1], 
        c.[AddressLine2], 
        c.[Phone], 
        c.[DateFirstPurchase], 
        c.[CommuteDistance], 
        x.[Region], 
        x.[Age], 
        CASE x.[Bikes] 
            WHEN 0 THEN 0 
            ELSE 1 
        END AS [BikeBuyer]
    FROM
        ADVENTUREWORKSDW2014.[DimCustomer] c INNER JOIN (
            SELECT
                [CustomerKey]
                ,[Region]
                ,[Age]
                ,Sum(
                    CASE [EnglishProductCategoryName] 
                        WHEN 'Bikes' THEN 1 
                        ELSE 0 
                    END) AS [Bikes]
            FROM
                ADVENTUREWORKSDW2014.[vDMPrep] 
            GROUP BY
                [CustomerKey]
                ,[Region]
                ,[Age]
            ) AS x
        ON c.[CustomerKey] = x.[CustomerKey]
;

