using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models;
using Dtm.Framework.Models.Ecommerce;


namespace HVRSMARTPET.PageHandlers
{
    public class GlobalPageHandler : CommonPageHandler
    {

        #region " Overrides... "

        public override void PostValidate(ModelStateDictionary modelState)
        {
            if (!modelState.IsValid && DtmContext.Page.IsStartPageType && !string.Equals(DtmContext.PageCode, "PaymentForm", StringComparison.InvariantCultureIgnoreCase))
            {
                modelState.Clear();
            }

            var email = Form["Email"] ?? string.Empty;

            //Task Id: 91849 - Stopping LiveOps Agents from using a specific email address
            //if (string.Equals(DtmContext.PageCode, "PaymentForm", StringComparison.InvariantCultureIgnoreCase) && email.Contains("ttifloorcare"))
            //{
            //    modelState.AddModelError("Form", "LiveOps agents: Please enter email address in new format as noted in the script.");
            //}
        }

        public override void PageLoaded(HttpRequestBase request, HttpResponseBase response)
        {
            base.PageLoaded(request, response);

            if((string.Equals(DtmContext.Page.PageCode, "ReviewPage", StringComparison.InvariantCultureIgnoreCase) 
                || string.Equals(DtmContext.Page.PageCode, "ProcessPayment", StringComparison.InvariantCultureIgnoreCase)) 
                && Order != null  && Order.OrderStatusId != 3)
            {
                if(string.IsNullOrEmpty(Order.CardType) || string.Equals(Order.CardType, "NONE", StringComparison.InvariantCultureIgnoreCase))
                {
                    var url = string.Format("PaymentForm{0}", DtmContext.ApplicationExtension);
                    if (request.Url != null)
                    {
                        var query = request.Url.Query == null ? string.Empty : request.Url.Query.ToString();

                        url = url + query;
                    }

                    response.Redirect(url);
                }
            }

        }

        public override void PostProcessPageActions()
        {
            //Checking for the pages code based on the main order pages array on line ten.
            if (DtmContext.Page.IsStartPageType)
            {
                Trace.WriteLine("Processing post page actions...");

                //TODO: Update any post page actions here, use the templates from bellow

                //////***************************** WORKING WITH MVC Request Form ************************
                //////***************************************************************************************

                //string cbxChecked;
                //if (((object)(Form["cbxSelectProduct"])) == null)
                //    cbxChecked = "false";
                //else
                //    cbxChecked = "true";

                //if (cbxChecked == "true")
                //{
                //        OrderManager.UpgradeProduct("SKU1", "SKU3");              
                //}

                ////**************** SHIPPING RULES FOR NON CONTIGUOUS STATES AND CANADA ******************
                ////***************************************************************************************

                ////Creating a list of Non Contiguous States. 
                //IList<string> ExtraShippingStates = StateCodes.NonContiguousStates;

                //if (Order.ShippingCountry == "CAN" || ExtraShippingStates.Any(s => s == Order.ShippingState))
                //{
                //    OrderManager.SetProductQuantity("ADDSHIP", 1);
                //}

                ////***************************** SETTING PRODUCT QUANTITY ********************************
                ////***************************************************************************************

                //OrderManager.SetProductQuantity("SKURUSH", 1);
                //OrderManager.SetProductQuantity("SKU", Order.Items["SKUITEM"].Quantity);

                ////*********************************** UPGRADING SKU ************************************
                ////***************************************************************************************

                //OrderManager.UpgradeProduct("SKU1", "SKU2");
                //OrderManager.UpgradeProduct("SKU3", "SKU4");
                //OrderManager.UpgradeProduct("SKU5", "SKU6");

                ////******************************* UPGRADING MULTIPLE SKUS *******************************
                ////***************************************************************************************

                //OrderManager.UpgradeProducts(new string[] { "SKU1", "SKU2" }, "NEWSKU3");
                //OrderManager.UpgradeProducts(new string[] { "SKU4", "SKU5" }, "NEWSKU6");

                ////*********************************** REPLACING SKUS ************************************
                ////***************************************************************************************

                //OrderManager.ReplaceProducts(new string[] { "SKU1", "SKU2" }, "SKU3", 2);
                //OrderManager.ReplaceProducts(new string[] { "SKU4", "SKU5" }, "SKU6", Order.Items["SKUITEM"].Quantity);

                ////********************************** WORKING WITH TEXTBOXES ****************************
                ////***************************************************************************************

                //System.Web.Mvc.FormCollection form = new System.Web.Mvc.FormCollection();

                ////Use the formcollection to get the  value for a checkbox or radio button.            
                //if (form["ActionCode3"].Trim().ToUpper() == "FREEGIFT")
                //    OrderManager.SetProductQuantity("SKUPROMO", 1);

                ////***************************************************************************************

            }
        }

        public override void PostSetOrderStatus()
        {
            base.PostSetOrderStatus();
            if (DtmContext.Page.IsStartPageType)
            {
                Order.OrderStatusId = 1;
            }
        }

        #endregion
    }
}
