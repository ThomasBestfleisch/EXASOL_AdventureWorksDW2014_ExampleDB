set autocommit off;

ALTER TABLE ADVENTUREWORKSDW2014."DimAccount" ADD 
    CONSTRAINT "PK_DimAccount" PRIMARY KEY 
	(
	"AccountKey"
	);

ALTER TABLE ADVENTUREWORKSDW2014."DimAccount" ADD 
    CONSTRAINT "FK_DimAccount_DimAccount" FOREIGN KEY 
    (
        "ParentAccountKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimAccount" ("AccountKey");


ALTER TABLE ADVENTUREWORKSDW2014."DimCurrency" ADD 
    CONSTRAINT "PK_DimCurrency_CurrencyKey" PRIMARY KEY  
    (
       "CurrencyKey"
    );
  

ALTER TABLE ADVENTUREWORKSDW2014."DimCustomer" ADD 
    CONSTRAINT "PK_DimCustomer_CustomerKey" PRIMARY KEY 
    (
        "CustomerKey"
    )  ;

ALTER TABLE ADVENTUREWORKSDW2014."DimGeography" ADD 
    CONSTRAINT "PK_DimGeography_GeographyKey" PRIMARY KEY  
    (
       "GeographyKey"
    );

ALTER TABLE ADVENTUREWORKSDW2014."DimCustomer" ADD
	CONSTRAINT "FK_DimCustomer_DimGeography" FOREIGN KEY
	(
		"GeographyKey"
	)
	REFERENCES ADVENTUREWORKSDW2014."DimGeography" ("GeographyKey");



ALTER TABLE ADVENTUREWORKSDW2014."DimDate" ADD 
    CONSTRAINT "PK_DimDate_DateKey" PRIMARY KEY  
    (
        "DateKey"
    )  ;


ALTER TABLE ADVENTUREWORKSDW2014."DimDepartmentGroup" ADD 
    CONSTRAINT "PK_DimDepartmentGroup" PRIMARY KEY  
    (
        "DepartmentGroupKey"
    ) ;

ALTER TABLE ADVENTUREWORKSDW2014."DimDepartmentGroup" ADD 
    CONSTRAINT "FK_DimDepartmentGroup_DimDepartmentGroup" FOREIGN KEY 
    (
        "ParentDepartmentGroupKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimDepartmentGroup" ("DepartmentGroupKey");


ALTER TABLE ADVENTUREWORKSDW2014."DimEmployee" ADD 
    CONSTRAINT "PK_DimEmployee_EmployeeKey" PRIMARY KEY  
    (
       "EmployeeKey"
    ) ;

ALTER TABLE ADVENTUREWORKSDW2014."DimEmployee" ADD 
	CONSTRAINT "FK_DimEmployee_DimEmployee" FOREIGN KEY 
    (
        "ParentEmployeeKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimEmployee" ("EmployeeKey")
;


ALTER TABLE ADVENTUREWORKSDW2014."DimSalesReason" ADD 
    CONSTRAINT "PK_DimSalesReason_SalesReasonKey" PRIMARY KEY  
    (
        "SalesReasonKey"
    )  ;

ALTER TABLE ADVENTUREWORKSDW2014."DimSalesTerritory" ADD 
    CONSTRAINT "PK_DimSalesTerritory_SalesTerritoryKey" PRIMARY KEY  
    (
        "SalesTerritoryKey"
    );


ALTER TABLE ADVENTUREWORKSDW2014."DimEmployee" ADD 
    CONSTRAINT "FK_DimEmployee_DimSalesTerritory" FOREIGN KEY 
    (
        "SalesTerritoryKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimSalesTerritory" ("SalesTerritoryKey");




ALTER TABLE ADVENTUREWORKSDW2014."DimGeography" ADD
    CONSTRAINT "FK_DimGeography_DimSalesTerritory"  FOREIGN KEY 
    (
        "SalesTerritoryKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimSalesTerritory" ("SalesTerritoryKey");



ALTER TABLE ADVENTUREWORKSDW2014."DimOrganization" ADD 
    CONSTRAINT "FK_DimOrganization_DimCurrency" FOREIGN KEY 
    (
        "CurrencyKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimCurrency" ("CurrencyKey");

ALTER TABLE ADVENTUREWORKSDW2014."DimOrganization" ADD 
    CONSTRAINT "PK_DimOrganization" PRIMARY KEY  
    (
       "OrganizationKey"
    ) ;

ALTER TABLE ADVENTUREWORKSDW2014."DimOrganization" ADD 
    CONSTRAINT "FK_DimOrganization_DimOrganization" FOREIGN KEY 
    (
        "ParentOrganizationKey"
    )REFERENCES ADVENTUREWORKSDW2014."DimOrganization" ("OrganizationKey");




ALTER TABLE ADVENTUREWORKSDW2014."DimProductCategory" ADD 
    CONSTRAINT "PK_DimProductCategory_ProductCategoryKey" PRIMARY KEY  
    (
        "ProductCategoryKey"
    )  ;

ALTER TABLE ADVENTUREWORKSDW2014."DimProductSubcategory" ADD 
    CONSTRAINT "FK_DimProductSubcategory_DimProductCategory" FOREIGN KEY 
    (
        "ProductCategoryKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimProductCategory" ("ProductCategoryKey");


ALTER TABLE ADVENTUREWORKSDW2014."DimProductSubcategory" ADD 
    CONSTRAINT "PK_DimProductSubcategory_ProductSubcategoryKey" PRIMARY KEY  
    (
        "ProductSubcategoryKey"
    );

ALTER TABLE ADVENTUREWORKSDW2014."DimProduct" ADD 
    CONSTRAINT "FK_DimProduct_DimProductSubcategory" FOREIGN KEY 
    (
        "ProductSubcategoryKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimProductSubcategory" ("ProductSubcategoryKey");


ALTER TABLE ADVENTUREWORKSDW2014."DimProduct" ADD 
    CONSTRAINT "PK_DimProduct_ProductKey" PRIMARY KEY  
    (
        "ProductKey"
    ) ;


ALTER TABLE ADVENTUREWORKSDW2014."DimPromotion" ADD 
    CONSTRAINT "PK_DimPromotion_PromotionKey" PRIMARY KEY  
    (
       "PromotionKey"
    );

  
ALTER TABLE ADVENTUREWORKSDW2014."DimReseller" ADD
	CONSTRAINT "FK_DimReseller_DimGeography" FOREIGN KEY
	(
		"GeographyKey"
	) REFERENCES ADVENTUREWORKSDW2014."DimGeography" ("GeographyKey");


ALTER TABLE ADVENTUREWORKSDW2014."DimReseller" ADD 
    CONSTRAINT "PK_DimReseller_ResellerKey" PRIMARY KEY  
    (
        "ResellerKey"
    ) ;





ALTER TABLE ADVENTUREWORKSDW2014."DimScenario" ADD 
    CONSTRAINT "PK_DimScenario" PRIMARY KEY  
    (
        "ScenarioKey"
    );

ALTER TABLE ADVENTUREWORKSDW2014."FactAdditionalInternationalProductDescription" ADD 
    CONSTRAINT "PK_FactAdditionalInternationalProductDescription_ProductKey_CultureName" PRIMARY KEY  
    (
       "ProductKey","CultureName"
    );


ALTER TABLE ADVENTUREWORKSDW2014."FactCallCenter" ADD 
    CONSTRAINT "FK_FactCallCenter_DimDate" FOREIGN KEY 
    (
        "DateKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimDate" ("DateKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactCallCenter" ADD 
    CONSTRAINT "PK_FactCallCenter_FactCallCenterID" PRIMARY KEY  
    (
        "FactCallCenterID"
    );

ALTER TABLE ADVENTUREWORKSDW2014."FactCurrencyRate" ADD 
    CONSTRAINT "FK_FactCurrencyRate_DimDate" FOREIGN KEY 
    (
       "DateKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimDate" ("DateKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactCurrencyRate" ADD 
	CONSTRAINT "FK_FactCurrencyRate_DimCurrency" FOREIGN KEY 
    (
       "CurrencyKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimCurrency" ("CurrencyKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactCurrencyRate" ADD 
    CONSTRAINT "PK_FactCurrencyRate_CurrencyKey_DateKey" PRIMARY KEY  
    (
      "CurrencyKey", "DateKey"
    );


ALTER TABLE ADVENTUREWORKSDW2014."FactFinance" ADD 
    CONSTRAINT "FK_FactFinance_DimScenario" FOREIGN KEY 
    (
        "ScenarioKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimScenario" ("ScenarioKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactFinance" ADD 
    CONSTRAINT "FK_FactFinance_DimOrganization" FOREIGN KEY 
    (
        "OrganizationKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimOrganization" ("OrganizationKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactFinance" ADD 
    CONSTRAINT "FK_FactFinance_DimDepartmentGroup" FOREIGN KEY 
    (
        "DepartmentGroupKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimDepartmentGroup" ("DepartmentGroupKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactFinance" ADD 
	CONSTRAINT "FK_FactFinance_DimDate" FOREIGN KEY 
    (
        "DateKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimDate" ("DateKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactFinance" ADD 
	CONSTRAINT "FK_FactFinance_DimAccount" FOREIGN KEY 
    (
        "AccountKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimAccount" ("AccountKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactInternetSales" ADD 
    CONSTRAINT "PK_FactInternetSales_SalesOrderNumber_SalesOrderLineNumber" PRIMARY KEY  
    (
        "SalesOrderNumber", "SalesOrderLineNumber"
    ) ;

ALTER TABLE ADVENTUREWORKSDW2014."FactInternetSalesReason" ADD 
    CONSTRAINT "FK_FactInternetSalesReason_FactInternetSales" FOREIGN KEY 
    (
        "SalesOrderNumber", "SalesOrderLineNumber"
    ) REFERENCES ADVENTUREWORKSDW2014."FactInternetSales" ("SalesOrderNumber", "SalesOrderLineNumber");

ALTER TABLE ADVENTUREWORKSDW2014."FactInternetSalesReason" ADD 
	CONSTRAINT "FK_FactInternetSalesReason_DimSalesReason" FOREIGN KEY
	(
		"SalesReasonKey"
	) REFERENCES ADVENTUREWORKSDW2014."DimSalesReason" ("SalesReasonKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactInternetSalesReason" ADD 
    CONSTRAINT "PK_FactInternetSalesReason_SalesOrderNumber_SalesOrderLineNumber_SalesReasonKey" PRIMARY KEY  
    (
        "SalesOrderNumber", "SalesOrderLineNumber", "SalesReasonKey"
    )  ;


ALTER TABLE ADVENTUREWORKSDW2014."FactInternetSales" ADD 
    CONSTRAINT "FK_FactInternetSales_DimCurrency" FOREIGN KEY 
    (
        "CurrencyKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimCurrency" ("CurrencyKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactInternetSales" ADD 
	 CONSTRAINT "FK_FactInternetSales_DimCustomer" FOREIGN KEY 
    (
        "CustomerKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimCustomer" ("CustomerKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactInternetSales" ADD 
	 CONSTRAINT "FK_FactInternetSales_DimDate" FOREIGN KEY 
    (
        "OrderDateKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimDate" ("DateKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactInternetSales" ADD 
	 CONSTRAINT "FK_FactInternetSales_DimDate1" FOREIGN KEY 
    (
        "DueDateKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimDate" ("DateKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactInternetSales" ADD 
	 CONSTRAINT "FK_FactInternetSales_DimDate2" FOREIGN KEY 
    (
        "ShipDateKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimDate" ("DateKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactInternetSales" ADD 
	 CONSTRAINT "FK_FactInternetSales_DimProduct" FOREIGN KEY 
    (
        "ProductKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimProduct" ("ProductKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactInternetSales" ADD 
	CONSTRAINT "FK_FactInternetSales_DimPromotion" FOREIGN KEY 
    (
        "PromotionKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimPromotion" ("PromotionKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactInternetSales" ADD 
	CONSTRAINT "FK_FactInternetSales_DimSalesTerritory" FOREIGN KEY 
    (
        "SalesTerritoryKey"
    ) REFERENCES ADVENTUREWORKSDW2014."DimSalesTerritory" ("SalesTerritoryKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactProductInventory" ADD 
    CONSTRAINT "FK_FactProductInventory_DimDate" FOREIGN KEY 
    (
        "DateKey"
    )REFERENCES ADVENTUREWORKSDW2014."DimDate" ("DateKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactProductInventory" ADD 
	CONSTRAINT "FK_FactProductInventory_DimProduct" FOREIGN KEY
	(
		"ProductKey"
	) REFERENCES ADVENTUREWORKSDW2014."DimProduct" ("ProductKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactProductInventory" ADD 
    CONSTRAINT "PK_FactProductInventory" PRIMARY KEY  
    (
        "ProductKey", "DateKey"
    )  ;

ALTER TABLE ADVENTUREWORKSDW2014."FactResellerSales" ADD 
    CONSTRAINT "FK_FactResellerSales_DimCurrency" FOREIGN KEY("CurrencyKey")
			REFERENCES ADVENTUREWORKSDW2014."DimCurrency" ("CurrencyKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactResellerSales" ADD 
	CONSTRAINT "FK_FactResellerSales_DimDate" FOREIGN KEY("OrderDateKey")
			REFERENCES ADVENTUREWORKSDW2014."DimDate" ("DateKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactResellerSales" ADD 
	CONSTRAINT "FK_FactResellerSales_DimDate1" FOREIGN KEY("DueDateKey")
			REFERENCES ADVENTUREWORKSDW2014."DimDate" ("DateKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactResellerSales" ADD 
	CONSTRAINT "FK_FactResellerSales_DimDate2" FOREIGN KEY("ShipDateKey")
			REFERENCES ADVENTUREWORKSDW2014."DimDate" ("DateKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactResellerSales" ADD 
	CONSTRAINT "FK_FactResellerSales_DimEmployee" FOREIGN KEY("EmployeeKey")
			REFERENCES ADVENTUREWORKSDW2014."DimEmployee" ("EmployeeKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactResellerSales" ADD 
	CONSTRAINT "FK_FactResellerSales_DimProduct" FOREIGN KEY("ProductKey")
			REFERENCES ADVENTUREWORKSDW2014."DimProduct" ("ProductKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactResellerSales" ADD 
	CONSTRAINT "FK_FactResellerSales_DimPromotion" FOREIGN KEY("PromotionKey")
			REFERENCES ADVENTUREWORKSDW2014."DimPromotion" ("PromotionKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactResellerSales" ADD 
	CONSTRAINT "FK_FactResellerSales_DimReseller" FOREIGN KEY("ResellerKey")
			REFERENCES ADVENTUREWORKSDW2014."DimReseller" ("ResellerKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactResellerSales" ADD 
	CONSTRAINT "FK_FactResellerSales_DimSalesTerritory" FOREIGN KEY("SalesTerritoryKey")
			REFERENCES ADVENTUREWORKSDW2014."DimSalesTerritory" ("SalesTerritoryKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactResellerSales" ADD 
    CONSTRAINT "PK_FactResellerSales_SalesOrderNumber_SalesOrderLineNumber" PRIMARY KEY  
    (
        "SalesOrderNumber", "SalesOrderLineNumber"
    ) ;


ALTER TABLE ADVENTUREWORKSDW2014."FactSalesQuota" ADD 
    CONSTRAINT "PK_FactSalesQuota_SalesQuotaKey" PRIMARY KEY  
    (
       "SalesQuotaKey"
    )  ;

ALTER TABLE ADVENTUREWORKSDW2014."FactSurveyResponse"  ADD 
    CONSTRAINT "FK_FactSurveyResponse_DateKey" FOREIGN KEY("DateKey")
			REFERENCES ADVENTUREWORKSDW2014."DimDate" ("DateKey");

ALTER TABLE ADVENTUREWORKSDW2014."FactSurveyResponse"  ADD 
	CONSTRAINT "FK_FactSurveyResponse_CustomerKey" FOREIGN KEY("CustomerKey")
			REFERENCES ADVENTUREWORKSDW2014."DimCustomer" ("CustomerKey");


ALTER TABLE ADVENTUREWORKSDW2014."FactSurveyResponse" ADD 
    CONSTRAINT "PK_FactSurveyResponse_SurveyResponseKey" PRIMARY KEY  
    (
        "SurveyResponseKey"
    );
ALTER TABLE ADVENTUREWORKSDW2014."ProspectiveBuyer" ADD 
    CONSTRAINT "PK_ProspectiveBuyer_ProspectiveBuyerKey" PRIMARY KEY  
    (
        "ProspectiveBuyerKey"
    ) ;

ALTER TABLE ADVENTUREWORKSDW2014."FactInternetSales" DISTRIBUTE BY "ProductKey";

ALTER TABLE ADVENTUREWORKSDW2014."FactProductInventory" DISTRIBUTE BY "ProductKey";

ALTER TABLE ADVENTUREWORKSDW2014."FactResellerSales" DISTRIBUTE BY "ProductKey";

ALTER TABLE ADVENTUREWORKSDW2014."FactSurveyResponse" DISTRIBUTE BY "CustomerKey";

ALTER TABLE ADVENTUREWORKSDW2014."FactFinance" DISTRIBUTE BY "OrganizationKey","DepartmentGroupKey";

commit;

set autocommit on;