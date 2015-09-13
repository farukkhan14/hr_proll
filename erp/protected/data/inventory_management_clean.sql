/*
SQLyog Enterprise - MySQL GUI v7.1 
MySQL - 5.5.34 : Database - inventory_management_clean
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`inventory_management_clean` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `inventory_management_clean`;

/*Table structure for table `authassignment` */

DROP TABLE IF EXISTS `authassignment`;

CREATE TABLE `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authassignment` */

insert  into `authassignment`(`itemname`,`userid`,`bizrule`,`data`) values ('POS User','2',NULL,'N;'),('SuperAdmin','1',NULL,'N;');

/*Table structure for table `authitem` */

DROP TABLE IF EXISTS `authitem`;

CREATE TABLE `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authitem` */

insert  into `authitem`(`name`,`type`,`description`,`bizrule`,`data`) values ('Countries.*',1,NULL,NULL,'N;'),('Countries.Admin',0,NULL,NULL,'N;'),('Countries.Create',0,NULL,NULL,'N;'),('Countries.CreateCountryFromOutSide',0,NULL,NULL,'N;'),('Countries.Delete',0,NULL,NULL,'N;'),('Countries.Index',0,NULL,NULL,'N;'),('Countries.Update',0,NULL,NULL,'N;'),('Countries.View',0,NULL,NULL,'N;'),('CreditLimit.*',1,NULL,NULL,'N;'),('CreditLimit.AddCreditLimit',0,NULL,NULL,'N;'),('CreditLimit.Admin',0,NULL,NULL,'N;'),('CreditLimit.Create',0,NULL,NULL,'N;'),('CreditLimit.CreditLimitHistory',0,NULL,NULL,'N;'),('CreditLimit.Delete',0,NULL,NULL,'N;'),('CreditLimit.Index',0,NULL,NULL,'N;'),('CreditLimit.Update',0,NULL,NULL,'N;'),('CreditLimit.View',0,NULL,NULL,'N;'),('CriteriaValues.*',1,NULL,NULL,'N;'),('CriteriaValues.Admin',0,NULL,NULL,'N;'),('CriteriaValues.Create',0,NULL,NULL,'N;'),('CriteriaValues.CreateColorFromOutSide',0,NULL,NULL,'N;'),('CriteriaValues.CreateSizeFromOutSide',0,NULL,NULL,'N;'),('CriteriaValues.Delete',0,NULL,NULL,'N;'),('CriteriaValues.Index',0,NULL,NULL,'N;'),('CriteriaValues.Update',0,NULL,NULL,'N;'),('CriteriaValues.View',0,NULL,NULL,'N;'),('CustomerAbValidation.*',1,NULL,NULL,'N;'),('CustomerAbValidation.Admin',0,NULL,NULL,'N;'),('CustomerAbValidation.Admin2',0,NULL,NULL,'N;'),('CustomerAbValidation.ChangeStatus',0,NULL,NULL,'N;'),('CustomerAbValidation.Create',0,NULL,NULL,'N;'),('CustomerAbValidation.Delete',0,NULL,NULL,'N;'),('CustomerAbValidation.Index',0,NULL,NULL,'N;'),('CustomerAbValidation.Update',0,NULL,NULL,'N;'),('CustomerAbValidation.View',0,NULL,NULL,'N;'),('CustomerContactPersons.*',1,NULL,NULL,'N;'),('CustomerContactPersons.AddContactPerson',0,NULL,NULL,'N;'),('CustomerContactPersons.Admin',0,NULL,NULL,'N;'),('CustomerContactPersons.Contacts',0,NULL,NULL,'N;'),('CustomerContactPersons.Create',0,NULL,NULL,'N;'),('CustomerContactPersons.Delete',0,NULL,NULL,'N;'),('CustomerContactPersons.Index',0,NULL,NULL,'N;'),('CustomerContactPersons.Update',0,NULL,NULL,'N;'),('CustomerContactPersons.View',0,NULL,NULL,'N;'),('Customers.*',1,NULL,NULL,'N;'),('Customers.Admin',0,NULL,NULL,'N;'),('Customers.AdminCreditLimit',0,NULL,NULL,'N;'),('Customers.AdminMoneyReceipt',0,NULL,NULL,'N;'),('Customers.AvailableBalance',0,NULL,NULL,'N;'),('Customers.Create',0,NULL,NULL,'N;'),('Customers.CreateCustomerFromOutSide',0,NULL,NULL,'N;'),('Customers.Delete',0,NULL,NULL,'N;'),('Customers.Index',0,NULL,NULL,'N;'),('Customers.PartyLedgerDateWise',0,NULL,NULL,'N;'),('Customers.PartyLedgerViewDateWise',0,NULL,NULL,'N;'),('Customers.Update',0,NULL,NULL,'N;'),('Customers.View',0,NULL,NULL,'N;'),('Departments.*',1,NULL,NULL,'N;'),('Departments.Admin',0,NULL,NULL,'N;'),('Departments.Create',0,NULL,NULL,'N;'),('Departments.CreateDepartmentFromOutSide',0,NULL,NULL,'N;'),('Departments.Delete',0,NULL,NULL,'N;'),('Departments.Index',0,NULL,NULL,'N;'),('Departments.Update',0,NULL,NULL,'N;'),('Departments.View',0,NULL,NULL,'N;'),('Depot.*',1,NULL,NULL,'N;'),('Depot.Admin',0,NULL,NULL,'N;'),('Depot.Create',0,NULL,NULL,'N;'),('Depot.CreateDepotFromOutSide',0,NULL,NULL,'N;'),('Depot.Delete',0,NULL,NULL,'N;'),('Depot.Index',0,NULL,NULL,'N;'),('Depot.Update',0,NULL,NULL,'N;'),('Depot.View',0,NULL,NULL,'N;'),('Designations.*',1,NULL,NULL,'N;'),('Designations.Admin',0,NULL,NULL,'N;'),('Designations.Create',0,NULL,NULL,'N;'),('Designations.CreateMain',0,NULL,NULL,'N;'),('Designations.Delete',0,NULL,NULL,'N;'),('Designations.Index',0,NULL,NULL,'N;'),('Designations.Update',0,NULL,NULL,'N;'),('Designations.View',0,NULL,NULL,'N;'),('DiscountType.*',1,NULL,NULL,'N;'),('DiscountType.Admin',0,NULL,NULL,'N;'),('DiscountType.ChangeStatus',0,NULL,NULL,'N;'),('DiscountType.Create',0,NULL,NULL,'N;'),('DiscountType.Delete',0,NULL,NULL,'N;'),('DiscountType.Index',0,NULL,NULL,'N;'),('DiscountType.Update',0,NULL,NULL,'N;'),('DiscountType.View',0,NULL,NULL,'N;'),('Employees.*',1,NULL,NULL,'N;'),('Employees.Admin',0,NULL,NULL,'N;'),('Employees.Create',0,NULL,NULL,'N;'),('Employees.CreateEmployeeFromOutSide',0,NULL,NULL,'N;'),('Employees.Delete',0,NULL,NULL,'N;'),('Employees.Index',0,NULL,NULL,'N;'),('Employees.Update',0,NULL,NULL,'N;'),('Employees.View',0,NULL,NULL,'N;'),('Inventory.*',1,NULL,NULL,'N;'),('Inventory.Admin',0,NULL,NULL,'N;'),('Inventory.CostingPriceList',0,NULL,NULL,'N;'),('Inventory.CostingPriceListView',0,NULL,NULL,'N;'),('Inventory.Create',0,NULL,NULL,'N;'),('Inventory.Delete',0,NULL,NULL,'N;'),('Inventory.Index',0,NULL,NULL,'N;'),('Inventory.ProfitLoss',0,NULL,NULL,'N;'),('Inventory.ProfitLossView',0,NULL,NULL,'N;'),('Inventory.PurchaseSellCombinedReport',0,NULL,NULL,'N;'),('Inventory.PurchaseSellCombinedView',0,NULL,NULL,'N;'),('Inventory.StockQtyOfThisStore',0,NULL,NULL,'N;'),('Inventory.StockReportDateWise',0,NULL,NULL,'N;'),('Inventory.StockReportInAmount',0,NULL,NULL,'N;'),('Inventory.StockReportViewDateWise',0,NULL,NULL,'N;'),('Inventory.StockReportViewInAmount',0,NULL,NULL,'N;'),('Inventory.StockTransfer',0,NULL,NULL,'N;'),('Inventory.StockTransferView',0,NULL,NULL,'N;'),('Inventory.Update',0,NULL,NULL,'N;'),('Inventory.View',0,NULL,NULL,'N;'),('Manual.*',1,NULL,NULL,'N;'),('Manual.Admin',0,NULL,NULL,'N;'),('Manual.Create',0,NULL,NULL,'N;'),('Manual.Delete',0,NULL,NULL,'N;'),('Manual.Index',0,NULL,NULL,'N;'),('Manual.Update',0,NULL,NULL,'N;'),('Manual.View',0,NULL,NULL,'N;'),('Manufacturers.*',1,NULL,NULL,'N;'),('Manufacturers.Admin',0,NULL,NULL,'N;'),('Manufacturers.CodeOfThis',0,NULL,NULL,'N;'),('Manufacturers.CodeOfThisUpdate',0,NULL,NULL,'N;'),('Manufacturers.Create',0,NULL,NULL,'N;'),('Manufacturers.CreateManufacturerFromOutSide',0,NULL,NULL,'N;'),('Manufacturers.Delete',0,NULL,NULL,'N;'),('Manufacturers.Index',0,NULL,NULL,'N;'),('Manufacturers.Update',0,NULL,NULL,'N;'),('Manufacturers.View',0,NULL,NULL,'N;'),('MoneyReceipt.*',1,NULL,NULL,'N;'),('MoneyReceipt.AddMoneyReceipt',0,NULL,NULL,'N;'),('MoneyReceipt.AddMoneyReceiptFromOutside',0,NULL,NULL,'N;'),('MoneyReceipt.Admin',0,NULL,NULL,'N;'),('MoneyReceipt.AmountOfThisOrder',0,NULL,NULL,'N;'),('MoneyReceipt.Create',0,NULL,NULL,'N;'),('MoneyReceipt.Delete',0,NULL,NULL,'N;'),('MoneyReceipt.Index',0,NULL,NULL,'N;'),('MoneyReceipt.MoneyReceiptHistory',0,NULL,NULL,'N;'),('MoneyReceipt.Update',0,NULL,NULL,'N;'),('MoneyReceipt.View',0,NULL,NULL,'N;'),('PaymentReceipt.*',1,NULL,NULL,'N;'),('PaymentReceipt.AccountNoOfThisBranch',0,NULL,NULL,'N;'),('PaymentReceipt.AddPaymentReceipt',0,NULL,NULL,'N;'),('PaymentReceipt.Admin',0,NULL,NULL,'N;'),('PaymentReceipt.AmountOfThisOrder',0,NULL,NULL,'N;'),('PaymentReceipt.BranchesOfThisBank',0,NULL,NULL,'N;'),('PaymentReceipt.Create',0,NULL,NULL,'N;'),('PaymentReceipt.Delete',0,NULL,NULL,'N;'),('PaymentReceipt.Index',0,NULL,NULL,'N;'),('PaymentReceipt.PaymentReceiptHistory',0,NULL,NULL,'N;'),('PaymentReceipt.Update',0,NULL,NULL,'N;'),('PaymentReceipt.View',0,NULL,NULL,'N;'),('PBrand.*',1,NULL,NULL,'N;'),('PBrand.Admin',0,NULL,NULL,'N;'),('PBrand.Create',0,NULL,NULL,'N;'),('PBrand.CreatePBrandFromOutSide',0,NULL,NULL,'N;'),('PBrand.Delete',0,NULL,NULL,'N;'),('PBrand.Index',0,NULL,NULL,'N;'),('PBrand.Update',0,NULL,NULL,'N;'),('PBrand.View',0,NULL,NULL,'N;'),('PModel.*',1,NULL,NULL,'N;'),('PModel.Admin',0,NULL,NULL,'N;'),('PModel.Create',0,NULL,NULL,'N;'),('PModel.CreatePModelFromOutSide',0,NULL,NULL,'N;'),('PModel.Delete',0,NULL,NULL,'N;'),('PModel.Index',0,NULL,NULL,'N;'),('PModel.Update',0,NULL,NULL,'N;'),('PModel.View',0,NULL,NULL,'N;'),('POS User',2,'POS User',NULL,'N;'),('PoStsChngHistory.*',1,NULL,NULL,'N;'),('PoStsChngHistory.Admin',0,NULL,NULL,'N;'),('PoStsChngHistory.Create',0,NULL,NULL,'N;'),('PoStsChngHistory.Delete',0,NULL,NULL,'N;'),('PoStsChngHistory.Index',0,NULL,NULL,'N;'),('PoStsChngHistory.Update',0,NULL,NULL,'N;'),('PoStsChngHistory.View',0,NULL,NULL,'N;'),('PpSelectionType.*',1,NULL,NULL,'N;'),('PpSelectionType.Admin',0,NULL,NULL,'N;'),('PpSelectionType.ChangeStatus',0,NULL,NULL,'N;'),('PpSelectionType.Create',0,NULL,NULL,'N;'),('PpSelectionType.Delete',0,NULL,NULL,'N;'),('PpSelectionType.Index',0,NULL,NULL,'N;'),('PpSelectionType.Update',0,NULL,NULL,'N;'),('PpSelectionType.View',0,NULL,NULL,'N;'),('ProdBrands.*',1,NULL,NULL,'N;'),('ProdBrands.Admin',0,NULL,NULL,'N;'),('ProdBrands.Create',0,NULL,NULL,'N;'),('ProdBrands.CreateProdBrandsFromOutSide',0,NULL,NULL,'N;'),('ProdBrands.Delete',0,NULL,NULL,'N;'),('ProdBrands.Index',0,NULL,NULL,'N;'),('ProdBrands.Update',0,NULL,NULL,'N;'),('ProdBrands.View',0,NULL,NULL,'N;'),('ProdDescChoiceForReport.*',1,NULL,NULL,'N;'),('ProdDescChoiceForReport.Admin',0,NULL,NULL,'N;'),('ProdDescChoiceForReport.Create',0,NULL,NULL,'N;'),('ProdDescChoiceForReport.Delete',0,NULL,NULL,'N;'),('ProdDescChoiceForReport.Index',0,NULL,NULL,'N;'),('ProdDescChoiceForReport.Update',0,NULL,NULL,'N;'),('ProdDescChoiceForReport.View',0,NULL,NULL,'N;'),('ProdItems.*',1,NULL,NULL,'N;'),('ProdItems.Admin',0,NULL,NULL,'N;'),('ProdItems.Create',0,NULL,NULL,'N;'),('ProdItems.CreateProdItemsFromOutSide',0,NULL,NULL,'N;'),('ProdItems.Delete',0,NULL,NULL,'N;'),('ProdItems.Index',0,NULL,NULL,'N;'),('ProdItems.Update',0,NULL,NULL,'N;'),('ProdItems.View',0,NULL,NULL,'N;'),('ProdModels.*',1,NULL,NULL,'N;'),('ProdModels.Admin',0,NULL,NULL,'N;'),('ProdModels.AdminSellPrice',0,NULL,NULL,'N;'),('ProdModels.BrandOfThisItemFromOutside',0,NULL,NULL,'N;'),('ProdModels.CatProdOfThisSubCat',0,NULL,NULL,'N;'),('ProdModels.CatSubCatOfThisProd',0,NULL,NULL,'N;'),('ProdModels.CatSubCatProdOfThisCode',0,NULL,NULL,'N;'),('ProdModels.Create',0,NULL,NULL,'N;'),('ProdModels.CreateProdModelsFromOutSide',0,NULL,NULL,'N;'),('ProdModels.CreateProdModelsFromOutSide2',0,NULL,NULL,'N;'),('ProdModels.Delete',0,NULL,NULL,'N;'),('ProdModels.Index',0,NULL,NULL,'N;'),('ProdModels.ProdCodeAndAdditionalInfo',0,NULL,NULL,'N;'),('ProdModels.ProdInfoOfThisAdditionalOp',0,NULL,NULL,'N;'),('ProdModels.ProdInfoOfThisPmodel',0,NULL,NULL,'N;'),('ProdModels.Reset',0,NULL,NULL,'N;'),('ProdModels.SubCatOfThisCat',0,NULL,NULL,'N;'),('ProdModels.Update',0,NULL,NULL,'N;'),('ProdModels.View',0,NULL,NULL,'N;'),('ProdProposal.*',1,NULL,NULL,'N;'),('ProdProposal.Admin',0,NULL,NULL,'N;'),('ProdProposal.Create',0,NULL,NULL,'N;'),('ProdProposal.Delete',0,NULL,NULL,'N;'),('ProdProposal.Index',0,NULL,NULL,'N;'),('ProdProposal.PreviewCreate',0,NULL,NULL,'N;'),('ProdProposal.PreviewUpdate',0,NULL,NULL,'N;'),('ProdProposal.Update',0,NULL,NULL,'N;'),('ProdProposal.View',0,NULL,NULL,'N;'),('PurchaseItems.*',1,NULL,NULL,'N;'),('PurchaseItems.Admin',0,NULL,NULL,'N;'),('PurchaseItems.AdminCancel',0,NULL,NULL,'N;'),('PurchaseItems.AdminReceiveReturnHistory',0,NULL,NULL,'N;'),('PurchaseItems.AdminUndo',0,NULL,NULL,'N;'),('PurchaseItems.AllPurchaseReportDateWise',0,NULL,NULL,'N;'),('PurchaseItems.AllPurchaseReportMonthWise',0,NULL,NULL,'N;'),('PurchaseItems.AllPurchaseReportPartyWise',0,NULL,NULL,'N;'),('PurchaseItems.AllPurchaseReportViewDateWise',0,NULL,NULL,'N;'),('PurchaseItems.AllPurchaseReportViewMonthWise',0,NULL,NULL,'N;'),('PurchaseItems.AllPurchaseReportViewPartyWise',0,NULL,NULL,'N;'),('PurchaseItems.CancellOrder',0,NULL,NULL,'N;'),('PurchaseItems.Create',0,NULL,NULL,'N;'),('PurchaseItems.Delete',0,NULL,NULL,'N;'),('PurchaseItems.Index',0,NULL,NULL,'N;'),('PurchaseItems.PoReportOfThis',0,NULL,NULL,'N;'),('PurchaseItems.PurchaseReport',0,NULL,NULL,'N;'),('PurchaseItems.PurchaseReportView',0,NULL,NULL,'N;'),('PurchaseItems.PurchaseSellReportMonthWise',0,NULL,NULL,'N;'),('PurchaseItems.PurchaseSellReportViewMonthWise',0,NULL,NULL,'N;'),('PurchaseItems.UndoCancell',0,NULL,NULL,'N;'),('PurchaseItems.Update',0,NULL,NULL,'N;'),('PurchaseItems.ValueOfThisCurr',0,NULL,NULL,'N;'),('PurchaseItems.View',0,NULL,NULL,'N;'),('QuickSell.*',1,NULL,NULL,'N;'),('QuickSell.Admin',0,NULL,NULL,'N;'),('QuickSell.AdminReturn',0,NULL,NULL,'N;'),('QuickSell.AllQuickSellsReportDateWise',0,NULL,NULL,'N;'),('QuickSell.AllQuickSellsReportMonthWise',0,NULL,NULL,'N;'),('QuickSell.AllQuickSellsReportViewDateWise',0,NULL,NULL,'N;'),('QuickSell.AllQuickSellsReportViewMonthWise',0,NULL,NULL,'N;'),('QuickSell.BrandOfThisItemLayoutTwo',0,NULL,NULL,'N;'),('QuickSell.CatAutoComplete',0,NULL,NULL,'N;'),('QuickSell.ChangeStatusTouchPad',0,NULL,NULL,'N;'),('QuickSell.CodeOfThisModelLayoutTwo',0,NULL,NULL,'N;'),('QuickSell.Create',0,NULL,NULL,'N;'),('QuickSell.Delete',0,NULL,NULL,'N;'),('QuickSell.Dynamicpackage',0,NULL,NULL,'N;'),('QuickSell.Index',0,NULL,NULL,'N;'),('QuickSell.ModelOfThisBrandLayoutTwo',0,NULL,NULL,'N;'),('QuickSell.ProdListOfThisStorePOS',0,NULL,NULL,'N;'),('QuickSell.SellReport',0,NULL,NULL,'N;'),('QuickSell.SellReportView',0,NULL,NULL,'N;'),('QuickSell.SoReportOfThis',0,NULL,NULL,'N;'),('QuickSell.TouchPadSettings',0,NULL,NULL,'N;'),('QuickSell.Update',0,NULL,NULL,'N;'),('QuickSell.View',0,NULL,NULL,'N;'),('QuickSellReturn.*',1,NULL,NULL,'N;'),('QuickSellReturn.Admin',0,NULL,NULL,'N;'),('QuickSellReturn.Create',0,NULL,NULL,'N;'),('QuickSellReturn.Delete',0,NULL,NULL,'N;'),('QuickSellReturn.Index',0,NULL,NULL,'N;'),('QuickSellReturn.Return',0,NULL,NULL,'N;'),('QuickSellReturn.Update',0,NULL,NULL,'N;'),('QuickSellReturn.View',0,NULL,NULL,'N;'),('ReceivedPurchase.*',1,NULL,NULL,'N;'),('ReceivedPurchase.AddingToTheInventory',0,NULL,NULL,'N;'),('ReceivedPurchase.Admin',0,NULL,NULL,'N;'),('ReceivedPurchase.AdminAddToInventory',0,NULL,NULL,'N;'),('ReceivedPurchase.AdminApproved',0,NULL,NULL,'N;'),('ReceivedPurchase.AdminPending',0,NULL,NULL,'N;'),('ReceivedPurchase.AdminReceive',0,NULL,NULL,'N;'),('ReceivedPurchase.AdminReceiveReturnHistory',0,NULL,NULL,'N;'),('ReceivedPurchase.AdminReturned',0,NULL,NULL,'N;'),('ReceivedPurchase.AllReceive',0,NULL,NULL,'N;'),('ReceivedPurchase.Approve',0,NULL,NULL,'N;'),('ReceivedPurchase.Create',0,NULL,NULL,'N;'),('ReceivedPurchase.Delete',0,NULL,NULL,'N;'),('ReceivedPurchase.Index',0,NULL,NULL,'N;'),('ReceivedPurchase.Pending',0,NULL,NULL,'N;'),('ReceivedPurchase.Receive',0,NULL,NULL,'N;'),('ReceivedPurchase.ReceivedVoucher',0,NULL,NULL,'N;'),('ReceivedPurchase.ReceiveHistory',0,NULL,NULL,'N;'),('ReceivedPurchase.Return',0,NULL,NULL,'N;'),('ReceivedPurchase.Update',0,NULL,NULL,'N;'),('ReceivedPurchase.View',0,NULL,NULL,'N;'),('SellDelivery.*',1,NULL,NULL,'N;'),('SellDelivery.Admin',0,NULL,NULL,'N;'),('SellDelivery.AdminDelivery',0,NULL,NULL,'N;'),('SellDelivery.AdminDeliveryReturnHistory',0,NULL,NULL,'N;'),('SellDelivery.AdminReturned',0,NULL,NULL,'N;'),('SellDelivery.AllDelivery',0,NULL,NULL,'N;'),('SellDelivery.Create',0,NULL,NULL,'N;'),('SellDelivery.Delete',0,NULL,NULL,'N;'),('SellDelivery.Delivery',0,NULL,NULL,'N;'),('SellDelivery.DeliveryHistory',0,NULL,NULL,'N;'),('SellDelivery.DeliveryVoucher',0,NULL,NULL,'N;'),('SellDelivery.Index',0,NULL,NULL,'N;'),('SellDelivery.Return',0,NULL,NULL,'N;'),('SellDelivery.Update',0,NULL,NULL,'N;'),('SellDelivery.View',0,NULL,NULL,'N;'),('SellItems.*',1,NULL,NULL,'N;'),('SellItems.Admin',0,NULL,NULL,'N;'),('SellItems.AllSellsReportDateWise',0,NULL,NULL,'N;'),('SellItems.AllSellsReportMonthWise',0,NULL,NULL,'N;'),('SellItems.AllSellsReportPartyWise',0,NULL,NULL,'N;'),('SellItems.AllSellsReportViewDateWise',0,NULL,NULL,'N;'),('SellItems.AllSellsReportViewMonthWise',0,NULL,NULL,'N;'),('SellItems.AllSellsReportViewPartyWise',0,NULL,NULL,'N;'),('SellItems.Create',0,NULL,NULL,'N;'),('SellItems.CustomerOfThisDepot',0,NULL,NULL,'N;'),('SellItems.Delete',0,NULL,NULL,'N;'),('SellItems.Index',0,NULL,NULL,'N;'),('SellItems.ProdInfoOfThisCode',0,NULL,NULL,'N;'),('SellItems.SellReport',0,NULL,NULL,'N;'),('SellItems.SellReportView',0,NULL,NULL,'N;'),('SellItems.SoReportOfThis',0,NULL,NULL,'N;'),('SellItems.SuggestProdItems',0,NULL,NULL,'N;'),('SellItems.Update',0,NULL,NULL,'N;'),('SellItems.View',0,NULL,NULL,'N;'),('SellPrice.*',1,NULL,NULL,'N;'),('SellPrice.AddSellPrice',0,NULL,NULL,'N;'),('SellPrice.AddSellPriceFromOutside',0,NULL,NULL,'N;'),('SellPrice.Admin',0,NULL,NULL,'N;'),('SellPrice.Create',0,NULL,NULL,'N;'),('SellPrice.Delete',0,NULL,NULL,'N;'),('SellPrice.Index',0,NULL,NULL,'N;'),('SellPrice.PriceHistory',0,NULL,NULL,'N;'),('SellPrice.Update',0,NULL,NULL,'N;'),('SellPrice.View',0,NULL,NULL,'N;'),('ShipBy.*',1,NULL,NULL,'N;'),('ShipBy.Admin',0,NULL,NULL,'N;'),('ShipBy.Create',0,NULL,NULL,'N;'),('ShipBy.CreateShipByFromOutSide',0,NULL,NULL,'N;'),('ShipBy.Delete',0,NULL,NULL,'N;'),('ShipBy.Index',0,NULL,NULL,'N;'),('ShipBy.Update',0,NULL,NULL,'N;'),('ShipBy.View',0,NULL,NULL,'N;'),('Site.*',1,NULL,NULL,'N;'),('Site.Contact',0,NULL,NULL,'N;'),('Site.DashBoard',0,NULL,NULL,'N;'),('Site.Error',0,NULL,NULL,'N;'),('Site.Event',0,NULL,NULL,'N;'),('Site.Help',0,NULL,NULL,'N;'),('Site.Index',0,NULL,NULL,'N;'),('Site.Login',0,NULL,NULL,'N;'),('Site.Logout',0,NULL,NULL,'N;'),('Site.ProfitLossChart',0,NULL,NULL,'N;'),('StockTransferHistory.*',1,NULL,NULL,'N;'),('StockTransferHistory.Admin',0,NULL,NULL,'N;'),('StockTransferHistory.AdminReqReceive',0,NULL,NULL,'N;'),('StockTransferHistory.Create',0,NULL,NULL,'N;'),('StockTransferHistory.Delete',0,NULL,NULL,'N;'),('StockTransferHistory.Index',0,NULL,NULL,'N;'),('StockTransferHistory.StockTransferReqReceive',0,NULL,NULL,'N;'),('StockTransferHistory.StockTransferReqSent',0,NULL,NULL,'N;'),('StockTransferHistory.Update',0,NULL,NULL,'N;'),('StockTransferHistory.View',0,NULL,NULL,'N;'),('Stores.*',1,NULL,NULL,'N;'),('Stores.Admin',0,NULL,NULL,'N;'),('Stores.Create',0,NULL,NULL,'N;'),('Stores.CreateStoreFromOutSide',0,NULL,NULL,'N;'),('Stores.Delete',0,NULL,NULL,'N;'),('Stores.Index',0,NULL,NULL,'N;'),('Stores.Update',0,NULL,NULL,'N;'),('Stores.View',0,NULL,NULL,'N;'),('SuperAdmin',2,'Super User',NULL,'N;'),('SupplierContactPersons.*',1,NULL,NULL,'N;'),('SupplierContactPersons.AddContactPerson',0,NULL,NULL,'N;'),('SupplierContactPersons.Admin',0,NULL,NULL,'N;'),('SupplierContactPersons.Contacts',0,NULL,NULL,'N;'),('SupplierContactPersons.Create',0,NULL,NULL,'N;'),('SupplierContactPersons.Delete',0,NULL,NULL,'N;'),('SupplierContactPersons.Index',0,NULL,NULL,'N;'),('SupplierContactPersons.Update',0,NULL,NULL,'N;'),('SupplierContactPersons.View',0,NULL,NULL,'N;'),('Suppliers.*',1,NULL,NULL,'N;'),('Suppliers.Admin',0,NULL,NULL,'N;'),('Suppliers.AdminPaymentReceipt',0,NULL,NULL,'N;'),('Suppliers.Create',0,NULL,NULL,'N;'),('Suppliers.CreateSupplierFromOutSide',0,NULL,NULL,'N;'),('Suppliers.Delete',0,NULL,NULL,'N;'),('Suppliers.Index',0,NULL,NULL,'N;'),('Suppliers.PartyLedgerDateWise',0,NULL,NULL,'N;'),('Suppliers.PartyLedgerViewDateWise',0,NULL,NULL,'N;'),('Suppliers.Update',0,NULL,NULL,'N;'),('Suppliers.View',0,NULL,NULL,'N;'),('Test.*',1,NULL,NULL,'N;'),('Test.Admin',0,NULL,NULL,'N;'),('Test.Create',0,NULL,NULL,'N;'),('Test.Delete',0,NULL,NULL,'N;'),('Test.Index',0,NULL,NULL,'N;'),('Test.Update',0,NULL,NULL,'N;'),('Test.View',0,NULL,NULL,'N;'),('Units.*',1,NULL,NULL,'N;'),('Units.Admin',0,NULL,NULL,'N;'),('Units.Create',0,NULL,NULL,'N;'),('Units.CreateCurrUnitFromOutSide',0,NULL,NULL,'N;'),('Units.CreateMeasurementUnitFromOutSide',0,NULL,NULL,'N;'),('Units.CreateQtyUnitFromOutSide',0,NULL,NULL,'N;'),('Units.CreateWeightUnitFromOutSide',0,NULL,NULL,'N;'),('Units.Delete',0,NULL,NULL,'N;'),('Units.Index',0,NULL,NULL,'N;'),('Units.Update',0,NULL,NULL,'N;'),('Units.View',0,NULL,NULL,'N;'),('UpdateDeleteTime.*',1,NULL,NULL,'N;'),('UpdateDeleteTime.Admin',0,NULL,NULL,'N;'),('UpdateDeleteTime.Create',0,NULL,NULL,'N;'),('UpdateDeleteTime.Delete',0,NULL,NULL,'N;'),('UpdateDeleteTime.Index',0,NULL,NULL,'N;'),('UpdateDeleteTime.Update',0,NULL,NULL,'N;'),('UpdateDeleteTime.View',0,NULL,NULL,'N;'),('Users.*',1,NULL,NULL,'N;'),('Users.Admin',0,NULL,NULL,'N;'),('Users.AdminAssignStore',0,NULL,NULL,'N;'),('Users.Create',0,NULL,NULL,'N;'),('Users.Delete',0,NULL,NULL,'N;'),('Users.Index',0,NULL,NULL,'N;'),('Users.Update',0,NULL,NULL,'N;'),('Users.View',0,NULL,NULL,'N;'),('UserStore.*',1,NULL,NULL,'N;'),('UserStore.Admin',0,NULL,NULL,'N;'),('UserStore.AssignStoreToThisUser',0,NULL,NULL,'N;'),('UserStore.ChangeStatus',0,NULL,NULL,'N;'),('UserStore.Create',0,NULL,NULL,'N;'),('UserStore.Delete',0,NULL,NULL,'N;'),('UserStore.Index',0,NULL,NULL,'N;'),('UserStore.Update',0,NULL,NULL,'N;'),('UserStore.View',0,NULL,NULL,'N;'),('VoucherNoFormate.*',1,NULL,NULL,'N;'),('VoucherNoFormate.Admin',0,NULL,NULL,'N;'),('VoucherNoFormate.Create',0,NULL,NULL,'N;'),('VoucherNoFormate.Delete',0,NULL,NULL,'N;'),('VoucherNoFormate.Index',0,NULL,NULL,'N;'),('VoucherNoFormate.Update',0,NULL,NULL,'N;'),('VoucherNoFormate.View',0,NULL,NULL,'N;'),('YourCompany.*',1,NULL,NULL,'N;'),('YourCompany.Admin',0,NULL,NULL,'N;'),('YourCompany.Create',0,NULL,NULL,'N;'),('YourCompany.Delete',0,NULL,NULL,'N;'),('YourCompany.Index',0,NULL,NULL,'N;'),('YourCompany.Update',0,NULL,NULL,'N;'),('YourCompany.View',0,NULL,NULL,'N;');

/*Table structure for table `authitemchild` */

DROP TABLE IF EXISTS `authitemchild`;

CREATE TABLE `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authitemchild` */

insert  into `authitemchild`(`parent`,`child`) values ('POS User','QuickSell.*'),('POS User','QuickSellReturn.*'),('POS User','Site.*');

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso2` char(2) DEFAULT NULL,
  `iso3` char(3) DEFAULT NULL,
  `country` varchar(62) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8;

/*Data for the table `countries` */

insert  into `countries`(`id`,`iso2`,`iso3`,`country`) values (1,'AF','AFG','Afghanistan'),(2,'AX','ALA','Åland Islands'),(3,'AL','ALB','Albania'),(4,'DZ','DZA','Algeria (El Djazaïr)'),(5,'AS','ASM','American Samoa'),(6,'AD','AND','Andorra'),(7,'AO','AGO','Angola'),(8,'AI','AIA','Anguilla'),(9,'AQ','ATA','Antarctica'),(10,'AG','ATG','Antigua and Barbuda'),(11,'AR','ARG','Argentina'),(12,'AM','ARM','Armenia'),(13,'AW','ABW','Aruba'),(14,'AU','AUS','Australia'),(15,'AT','AUT','Austria'),(16,'AZ','AZE','Azerbaijan'),(17,'BS','BHS','Bahamas'),(18,'BH','BHR','Bahrain'),(19,'BD','BGD','Bangladesh'),(20,'BB','BRB','Barbados'),(21,'BY','BLR','Belarus'),(22,'BE','BEL','Belgium'),(23,'BZ','BLZ','Belize'),(24,'BJ','BEN','Benin'),(25,'BM','BMU','Bermuda'),(26,'BT','BTN','Bhutan'),(27,'BO','BOL','Bolivia'),(28,'BA','BIH','Bosnia and Herzegovina'),(29,'BW','BWA','Botswana'),(30,'BV','BVT','Bouvet Island'),(31,'BR','BRA','Brazil'),(32,'IO','IOT','British Indian Ocean Territory'),(33,'BN','BRN','Brunei Darussalam'),(34,'BG','BGR','Bulgaria'),(35,'BF','BFA','Burkina Faso'),(36,'BI','BDI','Burundi'),(37,'KH','KHM','Cambodia'),(38,'CM','CMR','Cameroon'),(39,'CA','CAN','Canada'),(40,'CV','CPV','Cape Verde'),(41,'KY','CYM','Cayman Islands'),(42,'CF','CAF','Central African Republic'),(43,'TD','TCD','Chad (T\'Chad)'),(44,'CL','CHL','Chile'),(45,'CN','CHN','China'),(46,'CX','CXR','Christmas Island'),(47,'CC','CCK','Cocos (Keeling) Islands'),(48,'CO','COL','Colombia'),(49,'KM','COM','Comoros'),(50,'CG','COG','Congo, Republic Of'),(51,'CD','COD','Congo, The Democratic Republic of the (formerly Zaire)'),(52,'CK','COK','Cook Islands'),(53,'CR','CRI','Costa Rica'),(54,'CI','CIV','CÔte D\'Ivoire (Ivory Coast)'),(55,'HR','HRV','Croatia (hrvatska)'),(56,'CU','CUB','Cuba'),(57,'CY','CYP','Cyprus'),(58,'CZ','CZE','Czech Republic'),(59,'DK','DNK','Denmark'),(60,'DJ','DJI','Djibouti'),(61,'DM','DMA','Dominica'),(62,'DO','DOM','Dominican Republic'),(63,'EC','ECU','Ecuador'),(64,'EG','EGY','Egypt'),(65,'SV','SLV','El Salvador'),(66,'GQ','GNQ','Equatorial Guinea'),(67,'ER','ERI','Eritrea'),(68,'EE','EST','Estonia'),(69,'ET','ETH','Ethiopia'),(70,'FO','FRO','Faeroe Islands'),(71,'FK','FLK','Falkland Islands (Malvinas)'),(72,'FJ','FJI','Fiji'),(73,'FI','FIN','Finland'),(74,'FR','FRA','France'),(75,'GF','GUF','French Guiana'),(76,'PF','PYF','French Polynesia'),(77,'TF','ATF','French Southern Territories'),(78,'GA','GAB','Gabon'),(79,'GM','GMB','Gambia, The'),(80,'GE','GEO','Georgia'),(81,'DE','DEU','Germany (Deutschland)'),(82,'GH','GHA','Ghana'),(83,'GI','GIB','Gibraltar'),(84,'GB','GBR','Great Britain'),(85,'GR','GRC','Greece'),(86,'GL','GRL','Greenland'),(87,'GD','GRD','Grenada'),(88,'GP','GLP','Guadeloupe'),(89,'GU','GUM','Guam'),(90,'GT','GTM','Guatemala'),(91,'GN','GIN','Guinea'),(92,'GW','GNB','Guinea-bissau'),(93,'GY','GUY','Guyana'),(94,'HT','HTI','Haiti'),(95,'HM','HMD','Heard Island and Mcdonald Islands'),(96,'HN','HND','Honduras'),(97,'HK','HKG','Hong Kong (Special Administrative Region of China)'),(98,'HU','HUN','Hungary'),(99,'IS','ISL','Iceland'),(100,'IN','IND','India'),(101,'ID','IDN','Indonesia'),(102,'IR','IRN','Iran (Islamic Republic of Iran)'),(103,'IQ','IRQ','Iraq'),(104,'IE','IRL','Ireland'),(105,'IL','ISR','Israel'),(106,'IT','ITA','Italy'),(107,'JM','JAM','Jamaica'),(108,'JP','JPN','Japan'),(109,'JO','JOR','Jordan (Hashemite Kingdom of Jordan)'),(110,'KZ','KAZ','Kazakhstan'),(111,'KE','KEN','Kenya'),(112,'KI','KIR','Kiribati'),(113,'KP','PRK','Korea (Democratic Peoples Republic pf [North] Korea)'),(114,'KR','KOR','Korea (Republic of [South] Korea)'),(115,'KW','KWT','Kuwait'),(116,'KG','KGZ','Kyrgyzstan'),(117,'LA','LAO','Lao People\'s Democratic Republic'),(118,'LV','LVA','Latvia'),(119,'LB','LBN','Lebanon'),(120,'LS','LSO','Lesotho'),(121,'LR','LBR','Liberia'),(122,'LY','LBY','Libya (Libyan Arab Jamahirya)'),(123,'LI','LIE','Liechtenstein (Fürstentum Liechtenstein)'),(124,'LT','LTU','Lithuania'),(125,'LU','LUX','Luxembourg'),(126,'MO','MAC','Macao (Special Administrative Region of China)'),(127,'MK','MKD','Macedonia (Former Yugoslav Republic of Macedonia)'),(128,'MG','MDG','Madagascar'),(129,'MW','MWI','Malawi'),(130,'MY','MYS','Malaysia'),(131,'MV','MDV','Maldives'),(132,'ML','MLI','Mali'),(133,'MT','MLT','Malta'),(134,'MH','MHL','Marshall Islands'),(135,'MQ','MTQ','Martinique'),(136,'MR','MRT','Mauritania'),(137,'MU','MUS','Mauritius'),(138,'YT','MYT','Mayotte'),(139,'MX','MEX','Mexico'),(140,'FM','FSM','Micronesia (Federated States of Micronesia)'),(141,'MD','MDA','Moldova'),(142,'MC','MCO','Monaco'),(143,'MN','MNG','Mongolia'),(144,'MS','MSR','Montserrat'),(145,'MA','MAR','Morocco'),(146,'MZ','MOZ','Mozambique (Moçambique)'),(147,'MM','MMR','Myanmar (formerly Burma)'),(148,'NA','NAM','Namibia'),(149,'NR','NRU','Nauru'),(150,'NP','NPL','Nepal'),(151,'NL','NLD','Netherlands'),(152,'AN','ANT','Netherlands Antilles'),(153,'NC','NCL','New Caledonia'),(154,'NZ','NZL','New Zealand'),(155,'NI','NIC','Nicaragua'),(156,'NE','NER','Niger'),(157,'NG','NGA','Nigeria'),(158,'NU','NIU','Niue'),(159,'NF','NFK','Norfolk Island'),(160,'MP','MNP','Northern Mariana Islands'),(161,'NO','NOR','Norway'),(162,'OM','OMN','Oman'),(163,'PK','PAK','Pakistan'),(164,'PW','PLW','Palau'),(165,'PS','PSE','Palestinian Territories'),(166,'PA','PAN','Panama'),(167,'PG','PNG','Papua New Guinea'),(168,'PY','PRY','Paraguay'),(169,'PE','PER','Peru'),(170,'PH','PHL','Philippines'),(171,'PN','PCN','Pitcairn'),(172,'PL','POL','Poland'),(173,'PT','PRT','Portugal'),(174,'PR','PRI','Puerto Rico'),(175,'QA','QAT','Qatar'),(176,'RE','REU','RÉunion'),(177,'RO','ROU','Romania'),(178,'RU','RUS','Russian Federation'),(179,'RW','RWA','Rwanda'),(180,'SH','SHN','Saint Helena'),(181,'KN','KNA','Saint Kitts and Nevis'),(182,'LC','LCA','Saint Lucia'),(183,'PM','SPM','Saint Pierre and Miquelon'),(184,'VC','VCT','Saint Vincent and the Grenadines'),(185,'WS','WSM','Samoa (formerly Western Samoa)'),(186,'SM','SMR','San Marino (Republic of)'),(187,'ST','STP','Sao Tome and Principe'),(188,'SA','SAU','Saudi Arabia (Kingdom of Saudi Arabia)'),(189,'SN','SEN','Senegal'),(190,'CS','SCG','Serbia and Montenegro (formerly Yugoslavia)'),(191,'SC','SYC','Seychelles'),(192,'SL','SLE','Sierra Leone'),(193,'SG','SGP','Singapore'),(194,'SK','SVK','Slovakia (Slovak Republic)'),(195,'SI','SVN','Slovenia'),(196,'SB','SLB','Solomon Islands'),(197,'SO','SOM','Somalia'),(198,'ZA','ZAF','South Africa (zuid Afrika)'),(199,'GS','SGS','South Georgia and the South Sandwich Islands'),(200,'ES','ESP','Spain (españa)'),(201,'LK','LKA','Sri Lanka'),(202,'SD','SDN','Sudan'),(203,'SR','SUR','Suriname'),(204,'SJ','SJM','Svalbard and Jan Mayen'),(205,'SZ','SWZ','Swaziland'),(206,'SE','SWE','Sweden'),(207,'CH','CHE','Switzerland (Confederation of Helvetia)'),(208,'SY','SYR','Syrian Arab Republic'),(209,'TW','TWN','Taiwan (\"Chinese Taipei\" for IOC)'),(210,'TJ','TJK','Tajikistan'),(211,'TZ','TZA','Tanzania'),(212,'TH','THA','Thailand'),(213,'TL','TLS','Timor-Leste (formerly East Timor)'),(214,'TG','TGO','Togo'),(215,'TK','TKL','Tokelau'),(216,'TO','TON','Tonga'),(217,'TT','TTO','Trinidad and Tobago'),(218,'TN','TUN','Tunisia'),(219,'TR','TUR','Turkey'),(220,'TM','TKM','Turkmenistan'),(221,'TC','TCA','Turks and Caicos Islands'),(222,'TV','TUV','Tuvalu'),(223,'UG','UGA','Uganda'),(224,'UA','UKR','Ukraine'),(225,'AE','ARE','United Arab Emirates'),(226,'GB','GBR','United Kingdom (Great Britain)'),(227,'US','USA','United States'),(228,'UM','UMI','United States Minor Outlying Islands'),(229,'UY','URY','Uruguay'),(230,'UZ','UZB','Uzbekistan'),(231,'VU','VUT','Vanuatu'),(232,'VA','VAT','Vatican City (Holy See)'),(233,'VE','VEN','Venezuela'),(234,'VN','VNM','Viet Nam'),(235,'VG','VGB','Virgin Islands, British'),(236,'VI','VIR','Virgin Islands, U.S.'),(237,'WF','WLF','Wallis and Futuna'),(238,'EH','ESH','Western Sahara (formerly Spanish Sahara)'),(239,'YE','YEM','Yemen (Arab Republic)'),(240,'ZM','ZMB','Zambia'),(241,'ZW','ZWE','Zimbabwe');

/*Table structure for table `credit_limit` */

DROP TABLE IF EXISTS `credit_limit`;

CREATE TABLE `credit_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_credit_limit` (`customer_id`),
  CONSTRAINT `FK_credit_limit` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `credit_limit` */

/*Table structure for table `criteria_values` */

DROP TABLE IF EXISTS `criteria_values`;

CREATE TABLE `criteria_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color_or_size` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`id`),
  KEY `FK_criteria_values` (`color_or_size`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `criteria_values` */

insert  into `criteria_values`(`id`,`color_or_size`,`value`,`remarks`) values (1,16,'XXL',''),(2,15,'DARK BLUE',''),(3,16,'XL',''),(4,15,'BLACK',''),(5,15,'MILD BLUE',''),(6,15,'WHITE',''),(7,15,'GREEN',''),(8,15,'GRAY',''),(9,15,'RED',''),(10,15,'PURPLE',''),(11,16,'16','Inch'),(12,16,'16.5','Inch'),(13,16,'LARGE',''),(14,16,'SMALL',''),(15,15,'PRINTED','');

/*Table structure for table `customer_ab_validation` */

DROP TABLE IF EXISTS `customer_ab_validation`;

CREATE TABLE `customer_ab_validation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `validation_field` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `customer_ab_validation` */

insert  into `customer_ab_validation`(`id`,`validation_field`,`is_active`) values (1,'Customer Available Balance Validation On Sale Orders',2),(2,'Price Editable On Sale Orders & POS',2);

/*Table structure for table `customer_contact_persons` */

DROP TABLE IF EXISTS `customer_contact_persons`;

CREATE TABLE `customer_contact_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `contact_number1` varchar(20) DEFAULT NULL,
  `contact_number2` varchar(20) DEFAULT NULL,
  `contact_number3` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_contact_persons2` (`company_id`),
  KEY `FK_contact_persons_designation` (`designation_id`),
  CONSTRAINT `FK_contact_persons` FOREIGN KEY (`company_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer_contact_persons` */

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depot_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` text,
  `company_contact_no` varchar(20) DEFAULT NULL,
  `company_fax` varchar(20) DEFAULT NULL,
  `company_email` varchar(50) DEFAULT NULL,
  `company_web` varchar(50) DEFAULT NULL,
  `opening_amount` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `customers` */

insert  into `customers`(`id`,`depot_id`,`company_name`,`company_address`,`company_contact_no`,`company_fax`,`company_email`,`company_web`,`opening_amount`) values (2,NULL,'Customer One','Customer One Address','334444443343','','','',0);

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `departments` */

insert  into `departments`(`id`,`department_name`) values (9,'Support'),(10,'Marketing'),(11,'inventory'),(14,'Admin'),(15,'Account & Finance'),(17,'Sales'),(18,'Purchase');

/*Table structure for table `depot` */

DROP TABLE IF EXISTS `depot`;

CREATE TABLE `depot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` text,
  `contact_num` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `gureenty_money` double DEFAULT '0',
  `trade_licence` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `depot` */

insert  into `depot`(`id`,`name`,`address`,`contact_num`,`email`,`web`,`gureenty_money`,`trade_licence`) values (1,'Test Depot','','','','',0,'');

/*Table structure for table `designations` */

DROP TABLE IF EXISTS `designations`;

CREATE TABLE `designations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `designations` */

insert  into `designations`(`id`,`designation`) values (9,'Marketing Executive'),(11,'Executive Sales'),(12,'Technician'),(16,'Accounts Officer'),(17,'C.E.O');

/*Table structure for table `discount_tab` */

DROP TABLE IF EXISTS `discount_tab`;

CREATE TABLE `discount_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT '0',
  `no_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `discount_tab` */

insert  into `discount_tab`(`id`,`no`,`discount`,`no_type`) values (29,'1',NULL,40);

/*Table structure for table `discount_type` */

DROP TABLE IF EXISTS `discount_type`;

CREATE TABLE `discount_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `discount_type` */

insert  into `discount_type`(`id`,`title`,`is_active`) values (1,'PERCENTAGE',2),(2,'AMOUNT',1);

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `id_no` varchar(255) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `employees` */

insert  into `employees`(`id`,`full_name`,`designation_id`,`department_id`,`id_no`,`contact_no`,`email`,`address`) values (1,'Employee One',17,14,'','0000000000000','',''),(2,'Employee Two',11,17,'','0000000000000','','');

/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `stock_in` double DEFAULT '0',
  `stock_out` double DEFAULT '0',
  `sell_price` double DEFAULT '0',
  `transaction_date` date DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `is_agree` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

/*Data for the table `inventory` */

insert  into `inventory`(`id`,`store_id`,`item_id`,`brand_id`,`model_id`,`code`,`stock_in`,`stock_out`,`sell_price`,`transaction_date`,`month`,`year`,`is_agree`) values (48,2,4,8,24,'8337710000242',4,0,0,'2014-07-10',07,2014,0),(49,2,4,8,23,'8337700100235',3,0,0,'2014-07-10',07,2014,0),(50,2,4,7,22,'8337701000228',4,0,0,'2014-07-10',07,2014,0),(51,2,4,7,21,'8337700010211',5,0,0,'2014-07-10',07,2014,0),(52,2,8,20,20,'8337700100204',2,0,0,'2014-07-10',07,2014,0),(53,2,8,20,19,'8337700001198',6,0,0,'2014-07-10',07,2014,0),(54,2,8,19,18,'8337700001812',5,0,0,'2014-07-10',07,2014,0),(55,2,8,18,17,'8337700001714',2,0,0,'2014-07-10',07,2014,0),(56,2,9,21,16,'8337700001671',5,0,0,'2014-07-10',07,2014,0),(57,2,9,22,15,'8337700001501',4,0,0,'2014-07-10',07,2014,0),(58,2,4,8,24,'8337710000242',0,2,4000,'2014-07-10',07,2014,0),(59,2,4,8,23,'8337700100235',0,2,5000,'2014-07-10',07,2014,0),(60,2,4,7,22,'8337701000228',0,1,5000,'2014-07-10',07,2014,0);

/*Table structure for table `lookup` */

DROP TABLE IF EXISTS `lookup`;

CREATE TABLE `lookup` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` int(10) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `lookup` */

insert  into `lookup`(`id`,`name`,`code`,`type`) values (1,'ACTIVE',1,'is_active'),(2,'INACTIVE',2,'is_active'),(3,'NOT RECEIVED',5,'is_received'),(4,'RECEIVED',6,'is_received'),(5,'CURRENCY',7,'unit_type'),(6,'QUANTITY',8,'unit_type'),(7,'PENDING',9,'approved_status'),(8,'APPROVED',10,'approved_status'),(9,'COLOR',15,'color_or_size'),(10,'SIZE',16,'color_or_size'),(11,'MEASUREMENT',17,'unit_type'),(12,'WEIGHT',18,'unit_type'),(13,'NOT ADDED',21,'isAddedToInventory'),(14,'ADDED',22,'isAddedToInventory'),(15,'ALL NOT DELIVERED',23,'is_all_delivered'),(16,'ALL DELIVERED',24,'is_all_delivered'),(17,'PO',27,'report_type'),(18,'SO',28,'report_type'),(19,'POS',29,'report_type'),(20,'STOCK',30,'report_type'),(21,'DELIVERY VOUCHER',31,'report_type'),(22,'RECEIVE VOUCHER',32,'report_type'),(23,'PO',33,'operation_type'),(24,'SO',34,'operation_type'),(25,'POS',35,'operation_type'),(26,'ALL NOT RECEIVED',36,'is_all_received'),(27,'ALL RECEIVED',37,'is_all_received'),(30,'SO',40,'no_type'),(31,'POS',41,'no_type'),(32,'Dr',42,'amount_type'),(33,'Cr',43,'amount_type'),(34,'ESTABLISHED',44,'order_status'),(36,'CANCELED',45,'order_status');

/*Table structure for table `manual` */

DROP TABLE IF EXISTS `manual`;

CREATE TABLE `manual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `manual` */

insert  into `manual`(`id`,`name`,`desc`) values (1,'Product Information','Configure -> Products\r\n\r\nThen\r\n\r\nAdd Category, Sub-Category, Code, Model, Brand, Color, Size ETC\r\n\r\n<i>\r\nyou can add product code manually OR automatic by selecting \"Manufacturer\"\r\n</i>\r\n'),(2,'Sale Price','Configure -> Add sale price\r\n\r\n<u>OR</u>\r\n\r\nYou can add sale price while adding Products, check carefully,\r\n\r\nthere is a BLUE BUTTON named \"Add Sale Price\", after adding that product info.\r\n\r\nALSO,\r\n\r\nyou can add sale price from sale order window'),(3,'Add Products To The Inventory','There are two ways for adding the product to your inventory stock,\r\n\r\n<ol>\r\n<li>Adding through by purchasing products and approving then by <font =\'red\'><b><i>add to inventory option</i></b></font> (exist in the menu-> purchase)</li>\r\n<li>And Adding through manual</li>\r\n</ol>\r\n\r\n<b>1</b>. If products are purchased, then by approving process and add to inventory option, they will be automatically added to the inventory stock.\r\n\r\n<b>2</b>. If you want to add products into the inventory stock by manual, go through manu-> inventory -> manual stock entry'),(4,'Sale the products','Sale through \"Credit Sale (Sale Order) then Deliver\"\r\n\r\n<u>OR</u>\r\n\r\nSale through \"Quick Sale (POS)\" if you want to sale products through the retail process.'),(5,'Reports','All reports will be available in Manu -> Reports \r\n\r\nHere you can find these options-\r\n\r\n<ol>\r\n<li>Date Wise, Party Wise, Store Wise, Product Wise (For, Purchase, Credit Sales (Sale Order) AND Quick Sale (POS))</li>\r\n<li>Purchase-Sales Combined Report</li>\r\n<li>Stock Report (Product Quantity In Hand)</li>\r\n<li>Stock Report (Amount($) Of Product In Hand)</li>\r\n<li>Product Cost-Revenue Report</li>\r\n<li>Party Ledger (Customer AND Supplier)</li>\r\n<li>Costing Price (Product Wise)</li>\r\n<li>Make A Product Proposal For Your Company (Extra)</li>\r\n</ol>'),(6,'Sale Price Editable','If you want to edit sale prices while sales, you can turn this option <b><i>ON</i></b> from configure->sale price editable Option'),(7,'Customer Available Balance Validation','If you want that, the software will check the customer\'s available balance in your company, and if his/her available balance is zero, you want that software will stop the sale process and notify you that his/her available balance is zero, can not sale to him.\r\n\r\n\r\nIf you want above type of scenario in you software, simply turn this option <b></i>ON</i></b> from configure -> customer AB'),(8,'Discount Type','You can set the Discount Type to AMOUNT/ PERCENTAGE, from\r\nconfigure -> Discount Type (If one is activate, the other will be automatically inactivated)'),(9,'Costing Method','You can choose your product costing price methods ( LIFO / FIFO / AVERAGE ), you can active you desired method from\r\n\r\nconfigure -> costing method'),(10,'Touch Pad','If you use touch screen for POS, simply turn ON touch pad from\r\n\r\nConfigure -> Touch Pad ON/OFF'),(11,'Number Format','Set your Purchase Order , Sale Order , POS , Delivery/Challan Voucher AND Purchase Receive Voucher Number Formats from\r\n\r\nConfigure -> Number Format'),(12,'Time Range For Edit / Delete','You can set the time range for update/edit and delete your transaction data (Purchase Order, Sale Order, Quick Sale) from\r\n\r\nConfigure -> Time Range EDIT / DELETE'),(13,'Product Description For Vouchers','You can choose which product options will be shown in you vouchers ( Brand, Model, Additional Features, Color, Sizes ETC ) \r\n\r\nfrom Configure -> Prod Desc For Report'),(14,'Software Basic Setup','<u>If you are not understanding the process, do the following</u>\r\n\r\n<i>All the options will brief here, will found in menu -> configure (Check Carefully)</i>\r\n\r\n<b>First Of All</b>\r\n\r\n<ol>\r\n<li>Configure Your Company Information</li>\r\n<li>Configure Your Supplier AND Customer</li>\r\n<li>Create Your Stores</li>\r\n<li>Assign Your Stores To A User <b><i>( If You are a super admin, no need to assign, you have all the access of all process that means, you can have the access to all stores )</i></b></li>\r\n<li>Setup Your Products</li>\r\n<li>Set Your Product Sale Prices</li>\r\n<li>Add Product To Your Inventory Through Purchase -> Receive -> Approve -> Add To Inventory <b><i>OR</i></b> By Manual Stock Entry ( From Menu, Inventory - > Manual Stock Entry )</li>\r\n<li>Sale Through Sale Order (Credit Sale) -> Delivery <b><i>OR</i></b> By Quick Sale (POS) </li>\r\n<li>Generate Report (From menu, Reports)</li>\r\n</ol>\r\n\r\n\r\nWow.. you just ran the software as it should be. Thanks for being patient.  :) ');

/*Table structure for table `manufacturers` */

DROP TABLE IF EXISTS `manufacturers`;

CREATE TABLE `manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(255) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `manufacturers` */

insert  into `manufacturers`(`id`,`manufacturer`,`code`) values (2,'Manufacturer One','20649');

/*Table structure for table `money_receipt` */

DROP TABLE IF EXISTS `money_receipt`;

CREATE TABLE `money_receipt` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_money_receipt` (`customer_id`),
  CONSTRAINT `FK_money_receipt` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `money_receipt` */

insert  into `money_receipt`(`id`,`customer_id`,`order_no`,`amount`,`date`,`month`,`year`) values (00000000009,2,'1',23000,'2014-07-10',07,2014);

/*Table structure for table `months` */

DROP TABLE IF EXISTS `months`;

CREATE TABLE `months` (
  `id` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `month_name` varchar(8) DEFAULT NULL,
  `days` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `months` */

insert  into `months`(`id`,`month_name`,`days`) values (01,'JANUARY',31),(02,'FEBRUARY',30),(03,'MARCH',31),(04,'APRIL',30),(05,'MAY',31),(06,'JUNE',30),(07,'JULY',31),(08,'AUGUST',31),(09,'SEPTEMBE',30),(10,'OCTOBER',31),(11,'NOVEMBER',30),(12,'DECEMBER',31);

/*Table structure for table `p_brand` */

DROP TABLE IF EXISTS `p_brand`;

CREATE TABLE `p_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `p_brand` */

/*Table structure for table `p_model` */

DROP TABLE IF EXISTS `p_model`;

CREATE TABLE `p_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `p_model` */

insert  into `p_model`(`id`,`name`) values (1,'TX-6610'),(2,'TX-VG1530'),(3,'TD-W8980 /TD-W8980B'),(4,'TD-8817'),(5,'TD-VG3631'),(6,'TD-VG3511'),(7,'Archer C7'),(8,'Archer C5'),(9,'TL-WR843ND'),(10,'TL-WA7110ND');

/*Table structure for table `payment_receipt` */

DROP TABLE IF EXISTS `payment_receipt`;

CREATE TABLE `payment_receipt` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payment_receipt` (`supplier_id`),
  CONSTRAINT `FK_payment_receipt` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `payment_receipt` */

insert  into `payment_receipt`(`id`,`supplier_id`,`order_no`,`amount`,`date`,`month`,`year`) values (00000000001,2,'1',8530,'2014-07-10',07,2014);

/*Table structure for table `po_sts_chng_history` */

DROP TABLE IF EXISTS `po_sts_chng_history`;

CREATE TABLE `po_sts_chng_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_no` varchar(255) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `status_changed_by` int(11) DEFAULT NULL,
  `status_changed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `po_sts_chng_history` */

/*Table structure for table `pp_selection_type` */

DROP TABLE IF EXISTS `pp_selection_type`;

CREATE TABLE `pp_selection_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `pp_selection_type` */

insert  into `pp_selection_type`(`id`,`title`,`is_active`) values (1,'FIFO (First In First Out)',1),(2,'LIFO (Last In First Out)',2),(3,'AVERAGE',2);

/*Table structure for table `prod_brands` */

DROP TABLE IF EXISTS `prod_brands`;

CREATE TABLE `prod_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_prod_brands` (`item_id`),
  CONSTRAINT `FK_prod_brands` FOREIGN KEY (`item_id`) REFERENCES `prod_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `prod_brands` */

insert  into `prod_brands`(`id`,`item_id`,`brand_name`) values (7,4,'Wireless Routers'),(8,4,'Wireless AP Client Routers (WISP CPEs) & Access Points'),(9,4,'Wireless Access Points'),(10,4,'Outdoor'),(11,4,'Range Extenders'),(12,4,'WiFi Entertainment Adapter'),(13,4,'Wireless USB Adapters'),(14,4,'High Power Wireless USB Adapters'),(15,4,'High Gain Wireless USB Adapters'),(16,4,'Wireless PCI/PCI Express Adapters'),(17,4,'Antennas'),(18,8,'Wireless xDSL Modem Routers'),(19,8,'ADSL2+ Modem Routers & ADSL2+ Modem'),(20,8,'Wireless Voip ADSL2+ Modem Routers'),(21,9,'Wireless Voip GPON Router'),(22,9,'GPON Terminal'),(24,13,'T-Shirt'),(25,6,'abc');

/*Table structure for table `prod_desc_choice_for_report` */

DROP TABLE IF EXISTS `prod_desc_choice_for_report`;

CREATE TABLE `prod_desc_choice_for_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` int(11) DEFAULT NULL,
  `option1` int(11) DEFAULT '0',
  `option2` int(11) DEFAULT '0',
  `option3` int(11) DEFAULT '0',
  `option4` int(11) DEFAULT '0',
  `option5` int(11) DEFAULT '0',
  `option6` int(11) DEFAULT '0',
  `option7` int(11) DEFAULT '0',
  `option8` int(11) DEFAULT '0',
  `option9` int(11) DEFAULT '0',
  `option10` int(11) DEFAULT '0',
  `option11` int(11) DEFAULT '0',
  `option12` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `prod_desc_choice_for_report` */

insert  into `prod_desc_choice_for_report`(`id`,`report_type`,`option1`,`option2`,`option3`,`option4`,`option5`,`option6`,`option7`,`option8`,`option9`,`option10`,`option11`,`option12`) values (1,27,0,0,3,0,0,0,0,0,0,0,0,0),(2,28,1,0,0,0,0,0,0,0,0,0,0,0),(3,29,0,0,3,0,0,0,7,8,9,10,0,0),(4,30,1,0,0,0,0,0,0,0,0,0,0,0),(5,31,1,0,0,0,0,0,0,0,0,0,0,0),(6,32,1,0,0,0,0,0,0,0,0,0,0,0);

/*Table structure for table `prod_items` */

DROP TABLE IF EXISTS `prod_items`;

CREATE TABLE `prod_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `prod_items` */

insert  into `prod_items`(`id`,`item_name`) values (4,'Wireless'),(5,'3G Mobile WiFi'),(6,'3G /4G Routers'),(7,'3G USB Adapters'),(8,'xDSL'),(9,'GPON'),(10,'Hybrid WiFi Solutn'),(11,'Powerline'),(13,'Boys');

/*Table structure for table `prod_models` */

DROP TABLE IF EXISTS `prod_models`;

CREATE TABLE `prod_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `measurement` varchar(255) DEFAULT NULL,
  `measurement_unit_id` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `weight_unit_id` int(11) DEFAULT NULL,
  `features` text,
  `pmodel` int(11) DEFAULT NULL,
  `pbrand` int(11) DEFAULT NULL,
  `warranty` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_prod_models` (`brand_id`),
  KEY `FK_prod_models_2` (`item_id`),
  CONSTRAINT `FK_prod_models` FOREIGN KEY (`brand_id`) REFERENCES `prod_brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prod_models_2` FOREIGN KEY (`item_id`) REFERENCES `prod_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `prod_models` */

insert  into `prod_models`(`id`,`item_id`,`brand_id`,`model_name`,`code`,`manufacturer_id`,`country_id`,`size_id`,`color_id`,`measurement`,`measurement_unit_id`,`weight`,`weight_unit_id`,`features`,`pmodel`,`pbrand`,`warranty`) values (15,9,22,'1-Port Gigabit GPON Terminal','8337700001501',1,NULL,NULL,NULL,'',NULL,NULL,NULL,'',1,NULL,NULL),(16,9,21,'N3000 Wireless VoIP GPON Router','8337700001671',1,NULL,NULL,NULL,'',NULL,NULL,NULL,'',2,NULL,NULL),(17,8,18,'N600 Wireless Dual Band Gigabit ADSL2+ Modem Router','8337700001714',1,NULL,NULL,NULL,'',NULL,NULL,NULL,'',3,NULL,NULL),(18,8,19,'ADSL2+ Ethernet/USB Modem Router','8337700001812',1,NULL,NULL,NULL,'',NULL,NULL,NULL,'',4,NULL,NULL),(19,8,20,'300 Mbps Wireless N VoIP ADSL2+ Modem Router','8337700001198',1,NULL,NULL,NULL,'',NULL,NULL,NULL,'',5,NULL,NULL),(20,8,20,'150 Mbps Wireless N VoIP ADSL2+ Modem Router','8337700100204',1,NULL,NULL,NULL,'',NULL,NULL,NULL,'',6,NULL,NULL),(21,4,7,'AC1750 Wireless Dual Band Gigabit Router','8337700010211',1,NULL,NULL,NULL,'',NULL,NULL,NULL,'',7,NULL,NULL),(22,4,7,'AC1350 Wireless Dual Band Gigabit Router','8337701000228',1,NULL,NULL,NULL,'',NULL,NULL,NULL,'',8,NULL,NULL),(23,4,8,'300 Mbps Wireless AP/Client Router','8337700100235',1,NULL,NULL,NULL,'',NULL,NULL,NULL,'',9,NULL,NULL),(24,4,8,'150 Mbps High Power Wireless Access Point','8337710000242',1,NULL,NULL,NULL,'',NULL,NULL,NULL,'',10,NULL,NULL),(25,13,24,'Red- XXL','8206490100250',2,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL),(26,6,25,'UPS400va','8206490010267',2,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL);

/*Table structure for table `prod_proposal` */

DROP TABLE IF EXISTS `prod_proposal`;

CREATE TABLE `prod_proposal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `to_whom` text,
  `why_writing` text,
  `prev_discusion` text,
  `before_product_list` text,
  `product_list` text,
  `after_product_list` text,
  `make_deal` text,
  `from` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `prod_proposal` */

/*Table structure for table `purchase_items` */

DROP TABLE IF EXISTS `purchase_items`;

CREATE TABLE `purchase_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subj` varchar(255) DEFAULT NULL,
  `ref_no` varchar(255) DEFAULT NULL,
  `po_no` int(11) DEFAULT NULL,
  `order_by_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expected_receive_date` date DEFAULT NULL,
  `delivery_expired_day` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `order_qty` double DEFAULT NULL,
  `initiated_by` int(11) DEFAULT NULL,
  `is_received` int(11) DEFAULT '5',
  `is_all_received` int(11) DEFAULT '36',
  `bill_to` text,
  `ship_to` text,
  `ship_by` int(11) DEFAULT NULL,
  `sell_month` int(2) unsigned zerofill DEFAULT NULL,
  `sell_year` int(4) DEFAULT NULL,
  `order_status` int(11) DEFAULT '44',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `purchase_items` */

insert  into `purchase_items`(`id`,`subj`,`ref_no`,`po_no`,`order_by_id`,`supplier_id`,`issue_date`,`expected_receive_date`,`delivery_expired_day`,`item_id`,`brand_id`,`model_id`,`code`,`purchase_price`,`order_qty`,`initiated_by`,`is_received`,`is_all_received`,`bill_to`,`ship_to`,`ship_by`,`sell_month`,`sell_year`,`order_status`) values (25,NULL,'Ref#123',1,1,2,'2014-07-10','2014-07-10',7,9,22,15,'8337700001501',100,4,1,6,37,'','EXCEL TECHNOLOGIES LTD, ROAD-02, HOUSE - 02, DHANMONDI, DHAKA-1205, BANGLADESH',NULL,07,2014,44),(26,NULL,'Ref#123',1,1,2,'2014-07-10','2014-07-10',7,9,21,16,'8337700001671',200,5,1,6,37,'','EXCEL TECHNOLOGIES LTD, ROAD-02, HOUSE - 02, DHANMONDI, DHAKA-1205, BANGLADESH',NULL,07,2014,44),(27,NULL,'Ref#123',1,1,2,'2014-07-10','2014-07-10',7,8,18,17,'8337700001714',333,2,1,6,37,'','EXCEL TECHNOLOGIES LTD, ROAD-02, HOUSE - 02, DHANMONDI, DHAKA-1205, BANGLADESH',NULL,07,2014,44),(28,NULL,'Ref#123',1,1,2,'2014-07-10','2014-07-10',7,8,19,18,'8337700001812',232,5,1,6,37,'','EXCEL TECHNOLOGIES LTD, ROAD-02, HOUSE - 02, DHANMONDI, DHAKA-1205, BANGLADESH',NULL,07,2014,44),(29,NULL,'Ref#123',1,1,2,'2014-07-10','2014-07-10',7,8,20,19,'8337700001198',233,6,1,6,37,'','EXCEL TECHNOLOGIES LTD, ROAD-02, HOUSE - 02, DHANMONDI, DHAKA-1205, BANGLADESH',NULL,07,2014,44),(30,NULL,'Ref#123',1,1,2,'2014-07-10','2014-07-10',7,8,20,20,'8337700100204',333,2,1,6,37,'','EXCEL TECHNOLOGIES LTD, ROAD-02, HOUSE - 02, DHANMONDI, DHAKA-1205, BANGLADESH',NULL,07,2014,44),(31,NULL,'Ref#123',1,1,2,'2014-07-10','2014-07-10',7,4,7,21,'8337700010211',231,5,1,6,37,'','EXCEL TECHNOLOGIES LTD, ROAD-02, HOUSE - 02, DHANMONDI, DHAKA-1205, BANGLADESH',NULL,07,2014,44),(32,NULL,'Ref#123',1,1,2,'2014-07-10','2014-07-10',7,4,7,22,'8337701000228',122,4,1,6,37,'','EXCEL TECHNOLOGIES LTD, ROAD-02, HOUSE - 02, DHANMONDI, DHAKA-1205, BANGLADESH',NULL,07,2014,44),(33,NULL,'Ref#123',1,1,2,'2014-07-10','2014-07-10',7,4,8,23,'8337700100235',223,3,1,6,37,'','EXCEL TECHNOLOGIES LTD, ROAD-02, HOUSE - 02, DHANMONDI, DHAKA-1205, BANGLADESH',NULL,07,2014,44),(34,NULL,'Ref#123',1,1,2,'2014-07-10','2014-07-10',7,4,8,24,'8337710000242',232,4,1,6,37,'','EXCEL TECHNOLOGIES LTD, ROAD-02, HOUSE - 02, DHANMONDI, DHAKA-1205, BANGLADESH',NULL,07,2014,44);

/*Table structure for table `purchase_prices` */

DROP TABLE IF EXISTS `purchase_prices`;

CREATE TABLE `purchase_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_no` varchar(255) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `purchase_prices` */

insert  into `purchase_prices`(`id`,`po_no`,`model_id`,`purchase_price`,`qty`,`month`,`year`,`date`) values (15,'48',24,232,4,07,2014,'2014-07-10'),(16,'49',23,223,3,07,2014,'2014-07-10'),(17,'50',22,122,4,07,2014,'2014-07-10'),(18,'51',21,231,5,07,2014,'2014-07-10'),(19,'52',20,333,2,07,2014,'2014-07-10'),(20,'53',19,233,6,07,2014,'2014-07-10'),(21,'54',18,232,5,07,2014,'2014-07-10'),(22,'55',17,333,2,07,2014,'2014-07-10'),(23,'56',16,200,5,07,2014,'2014-07-10'),(24,'57',15,100,4,07,2014,'2014-07-10');

/*Table structure for table `quick_sell` */

DROP TABLE IF EXISTS `quick_sell`;

CREATE TABLE `quick_sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quick_sell_no` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `date_of_sell` date DEFAULT NULL,
  `initiated_by` int(11) DEFAULT NULL,
  `stockQty` double DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `sell_month` int(2) unsigned zerofill DEFAULT NULL,
  `sell_year` int(4) DEFAULT NULL,
  `given_amount` double DEFAULT NULL,
  `change_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `quick_sell` */

/*Table structure for table `quick_sell_return` */

DROP TABLE IF EXISTS `quick_sell_return`;

CREATE TABLE `quick_sell_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quick_sell_id` int(11) DEFAULT NULL,
  `quick_sell_no` varchar(255) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `return_qty` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `remarks` text,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_quick_sell_return` (`quick_sell_id`),
  CONSTRAINT `FK_quick_sell_return` FOREIGN KEY (`quick_sell_id`) REFERENCES `quick_sell` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `quick_sell_return` */

/*Table structure for table `received_purchase` */

DROP TABLE IF EXISTS `received_purchase`;

CREATE TABLE `received_purchase` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `receive_no` int(11) DEFAULT NULL,
  `purchase_id` int(11) unsigned DEFAULT NULL,
  `po_no` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `received_qty` double DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `return_qty` double DEFAULT '0',
  `remarks` varchar(255) DEFAULT NULL,
  `isAddedToInventory` int(11) DEFAULT '21',
  `received_by_id` int(11) DEFAULT NULL,
  `approved_status` int(11) DEFAULT '9',
  `approved_by_id` int(11) DEFAULT NULL,
  `sell_month` int(2) unsigned zerofill DEFAULT NULL,
  `sell_year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_received_purchase` (`purchase_id`),
  CONSTRAINT `FK_received_purchase` FOREIGN KEY (`purchase_id`) REFERENCES `purchase_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `received_purchase` */

insert  into `received_purchase`(`id`,`receive_no`,`purchase_id`,`po_no`,`supplier_id`,`store_id`,`item_id`,`brand_id`,`model_id`,`code`,`received_qty`,`received_date`,`return_qty`,`remarks`,`isAddedToInventory`,`received_by_id`,`approved_status`,`approved_by_id`,`sell_month`,`sell_year`) values (13,1,25,'1',2,2,9,22,15,'8337700001501',4,'2014-07-10',0,NULL,22,1,10,1,07,2014),(14,1,26,'1',2,2,9,21,16,'8337700001671',5,'2014-07-10',0,NULL,22,1,10,1,07,2014),(15,1,27,'1',2,2,8,18,17,'8337700001714',2,'2014-07-10',0,NULL,22,1,10,1,07,2014),(16,1,28,'1',2,2,8,19,18,'8337700001812',5,'2014-07-10',0,NULL,22,1,10,1,07,2014),(17,1,29,'1',2,2,8,20,19,'8337700001198',6,'2014-07-10',0,NULL,22,1,10,1,07,2014),(18,1,30,'1',2,2,8,20,20,'8337700100204',2,'2014-07-10',0,NULL,22,1,10,1,07,2014),(19,1,31,'1',2,2,4,7,21,'8337700010211',5,'2014-07-10',0,NULL,22,1,10,1,07,2014),(20,1,32,'1',2,2,4,7,22,'8337701000228',4,'2014-07-10',0,NULL,22,1,10,1,07,2014),(21,1,33,'1',2,2,4,8,23,'8337700100235',3,'2014-07-10',0,NULL,22,1,10,1,07,2014),(22,1,34,'1',2,2,4,8,24,'8337710000242',4,'2014-07-10',0,NULL,22,1,10,1,07,2014);

/*Table structure for table `rights` */

DROP TABLE IF EXISTS `rights`;

CREATE TABLE `rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`itemname`),
  CONSTRAINT `rights_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rights` */

/*Table structure for table `sell_delivery` */

DROP TABLE IF EXISTS `sell_delivery`;

CREATE TABLE `sell_delivery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_no` int(11) DEFAULT NULL,
  `sell_items_id` int(11) unsigned DEFAULT NULL,
  `so_no` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `delivery_qty` double DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `return_qty` double DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sell_delivery` (`sell_items_id`),
  CONSTRAINT `FK_sell_delivery` FOREIGN KEY (`sell_items_id`) REFERENCES `sell_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `sell_delivery` */

insert  into `sell_delivery`(`id`,`delivery_no`,`sell_items_id`,`so_no`,`customer_id`,`item_id`,`brand_id`,`model_id`,`code`,`delivery_qty`,`delivery_date`,`return_qty`,`remarks`,`store_id`) values (12,1,28,'1',2,4,8,24,'8337710000242',2,'2014-07-10',NULL,NULL,2),(13,1,29,'1',2,4,8,23,'8337700100235',2,'2014-07-10',NULL,NULL,2),(14,1,30,'1',2,4,7,22,'8337701000228',1,'2014-07-10',NULL,NULL,2);

/*Table structure for table `sell_items` */

DROP TABLE IF EXISTS `sell_items`;

CREATE TABLE `sell_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `so_no` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `date_of_sell` date DEFAULT NULL,
  `expected_delivery_date` date DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sell_qty` double DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `discount` double DEFAULT '0',
  `initiated_by` int(11) DEFAULT NULL,
  `is_all_delivered` int(11) DEFAULT '23',
  `sell_month` int(2) unsigned zerofill DEFAULT NULL,
  `sell_year` int(4) DEFAULT NULL,
  `authorized_by` int(11) DEFAULT NULL,
  `order_status` int(11) NOT NULL DEFAULT '44',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `sell_items` */

insert  into `sell_items`(`id`,`so_no`,`customer_id`,`date_of_sell`,`expected_delivery_date`,`item_id`,`brand_id`,`model_id`,`code`,`sell_qty`,`sell_price`,`discount`,`initiated_by`,`is_all_delivered`,`sell_month`,`sell_year`,`authorized_by`,`order_status`) values (28,1,2,'2014-07-10','2014-07-10',4,8,24,'8337710000242',2,4000,0,1,24,07,2014,1,44),(29,1,2,'2014-07-10','2014-07-10',4,8,23,'8337700100235',2,5000,0,1,24,07,2014,1,44),(30,1,2,'2014-07-10','2014-07-10',4,7,22,'8337701000228',1,5000,0,1,24,07,2014,1,44);

/*Table structure for table `sell_price` */

DROP TABLE IF EXISTS `sell_price`;

CREATE TABLE `sell_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `discount` double DEFAULT '0',
  `ideal_qty` int(11) DEFAULT NULL,
  `warn_qty` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_sell_price` (`model_id`),
  CONSTRAINT `FK_sell_price` FOREIGN KEY (`model_id`) REFERENCES `prod_models` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `sell_price` */

insert  into `sell_price`(`id`,`model_id`,`sell_price`,`discount`,`ideal_qty`,`warn_qty`,`start_date`,`end_date`,`is_active`,`add_by`,`add_time`,`update_by`,`update_time`) values (4,22,5000,0,NULL,NULL,'2014-05-15','2015-12-31',1,NULL,NULL,NULL,NULL),(5,21,6000,0,NULL,NULL,'2014-05-15','2015-12-31',1,NULL,NULL,NULL,NULL),(6,24,4000,0,NULL,NULL,'2014-05-15','2015-12-31',1,NULL,NULL,NULL,NULL),(7,23,5000,0,NULL,NULL,'2014-05-15','2015-12-31',1,NULL,NULL,NULL,NULL),(8,17,7000,0,NULL,NULL,'2014-05-15','2015-12-31',1,NULL,NULL,NULL,NULL),(9,18,6000,0,NULL,NULL,'2014-05-15','2015-12-31',1,NULL,NULL,NULL,NULL),(10,20,3000,0,NULL,NULL,'2014-05-15','2015-12-31',1,NULL,NULL,NULL,NULL),(11,19,4000,0,NULL,NULL,'2014-05-15','2015-12-31',1,NULL,NULL,NULL,NULL),(12,16,8000,0,NULL,NULL,'2014-05-15','2015-12-31',1,NULL,NULL,NULL,NULL),(13,15,3000,0,NULL,NULL,'2014-05-15','2015-12-31',1,NULL,NULL,NULL,NULL),(14,26,2000,0,NULL,NULL,'2014-05-29','2015-08-30',1,NULL,NULL,NULL,NULL);

/*Table structure for table `ship_by` */

DROP TABLE IF EXISTS `ship_by`;

CREATE TABLE `ship_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ship_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ship_by` */

/*Table structure for table `so_sts_chng_history` */

DROP TABLE IF EXISTS `so_sts_chng_history`;

CREATE TABLE `so_sts_chng_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `so_no` varchar(255) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `status_changed_by` int(11) DEFAULT NULL,
  `status_changed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `so_sts_chng_history` */

insert  into `so_sts_chng_history`(`id`,`so_no`,`order_status`,`status_changed_by`,`status_changed_time`) values (1,'1',45,1,'2014-07-10 17:24:12'),(2,'1',44,1,'2014-07-10 17:24:21');

/*Table structure for table `stock_transfer_history` */

DROP TABLE IF EXISTS `stock_transfer_history`;

CREATE TABLE `stock_transfer_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent_from_store_id` int(11) DEFAULT NULL,
  `sent_qty` double DEFAULT NULL,
  `sent_date` date DEFAULT NULL,
  `received_to_store_id` int(11) DEFAULT NULL,
  `received_qty` double DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `is_received` int(11) DEFAULT '5',
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sent_by_id` int(11) DEFAULT NULL,
  `received_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stock_transfer_history` */

/*Table structure for table `stores` */

DROP TABLE IF EXISTS `stores`;

CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) NOT NULL,
  `location` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `stores` */

insert  into `stores`(`id`,`store_name`,`location`) values (2,'Store One','Store Location');

/*Table structure for table `supplier_contact_persons` */

DROP TABLE IF EXISTS `supplier_contact_persons`;

CREATE TABLE `supplier_contact_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `contact_number1` varchar(20) DEFAULT NULL,
  `contact_number2` varchar(20) DEFAULT NULL,
  `contact_number3` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_supplier_contact_persons` (`company_id`),
  CONSTRAINT `FK_supplier_contact_persons` FOREIGN KEY (`company_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier_contact_persons` */

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` text,
  `company_contact_no` varchar(20) DEFAULT NULL,
  `company_fax` varchar(20) DEFAULT NULL,
  `company_email` varchar(50) DEFAULT NULL,
  `company_web` varchar(50) DEFAULT NULL,
  `opening_amount` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `suppliers` */

insert  into `suppliers`(`id`,`company_name`,`company_address`,`company_contact_no`,`company_fax`,`company_email`,`company_web`,`opening_amount`) values (2,'Supplier One','Supplier One Address','+88012121212','','supplierOne@email.com','',0);

/*Table structure for table `touch_pad` */

DROP TABLE IF EXISTS `touch_pad`;

CREATE TABLE `touch_pad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `touch_pad` */

insert  into `touch_pad`(`id`,`title`,`is_active`) values (1,'TOUCH PAD',2);

/*Table structure for table `units` */

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_type` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `value` double DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `units` */

insert  into `units`(`id`,`unit_type`,`label`,`value`,`remarks`) values (1,7,'USD',77.58,'1 USD = 77.58 TK'),(2,7,'AUS',71.56,'1 AUS = 71.56 TK'),(5,8,'Pcs',NULL,''),(6,8,'Packages',NULL,''),(14,17,'CM',NULL,''),(16,17,'INCH',NULL,''),(17,18,'KGs',NULL,''),(18,18,'GM',NULL,''),(20,18,'Pound',NULL,''),(21,17,'Feet',NULL,''),(22,7,'TK',1,'1 TK = 1 TK'),(25,8,'BOX',NULL,NULL),(26,7,'RUPEE',1.32,'1 RUPEE = 1.32 TK'),(27,7,'EURO',105.45,'1 EURO = 105.45 TK'),(28,7,'RINGGIT',24.04,'1 RINGGIT = 24.04 TK');

/*Table structure for table `update_delete_time` */

DROP TABLE IF EXISTS `update_delete_time`;

CREATE TABLE `update_delete_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_type` int(11) NOT NULL,
  `updatable_day` int(11) NOT NULL DEFAULT '0',
  `deletable_day` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `update_delete_time` */

insert  into `update_delete_time`(`id`,`operation_type`,`updatable_day`,`deletable_day`) values (1,33,7,7),(2,34,7,7),(3,35,3,3);

/*Table structure for table `user_store` */

DROP TABLE IF EXISTS `user_store`;

CREATE TABLE `user_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_store` (`user_id`),
  CONSTRAINT `FK_user_store` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_store` */

insert  into `user_store`(`id`,`user_id`,`store_id`,`is_active`) values (3,2,2,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`employee_id`,`username`,`password`,`create_by`,`create_time`,`update_by`,`update_time`) values (1,1,'superadmin','17c4520f6cfd1ab53d8745e84681eb49',NULL,NULL,'superadmin','2014-05-28 23:20:30'),(2,2,'pos_ops','4c3e11d885ebd69c44d8705c6c8a3e74','pruser.36437','2014-05-20 22:13:08','pruser.36437','2014-05-23 15:00:59');

/*Table structure for table `voucher_no_formate` */

DROP TABLE IF EXISTS `voucher_no_formate`;

CREATE TABLE `voucher_no_formate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `type_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `voucher_no_formate` */

insert  into `voucher_no_formate`(`id`,`type`,`type_format`) values (1,27,'PO'),(2,28,'SO'),(3,29,'INV'),(4,31,'CHALLAN'),(5,32,'RV');

/*Table structure for table `years` */

DROP TABLE IF EXISTS `years`;

CREATE TABLE `years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_name` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `years` */

insert  into `years`(`id`,`year_name`) values (1,2013),(2,2014),(3,2015),(4,2016),(5,2017),(6,2018),(7,2019),(8,2020);

/*Table structure for table `your_company` */

DROP TABLE IF EXISTS `your_company`;

CREATE TABLE `your_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `road` varchar(20) DEFAULT NULL,
  `house` varchar(50) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `is_active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `your_company` */

insert  into `your_company`(`id`,`company_name`,`location`,`road`,`house`,`contact`,`email`,`web`,`is_active`) values (1,'EXCEL TECHNOLOGIES LTD','DHANMONDI, DHAKA-1205, BANGLADESH','ROAD-02','HOUSE - 02','+880 2966385,9664385','email@email.com','http://www.web.com',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
