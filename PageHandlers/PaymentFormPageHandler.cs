using Dtm.Framework.ClientSites.Web;
using System.Diagnostics;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace HVRSMARTPET.PageHandlers
{
    public class PaymentFormPageHandler : CommonPageHandler
    {
        #region " Overrides... "
        public override void BeginRequest(HttpRequestBase request, HttpResponseBase response, ref string pageCode)
        {
            base.BeginRequest(request, response, ref pageCode);

            if (DtmContext.Order == null || DtmContext.Order.OrderID == 0)
            {
                var url = string.Format("Index{0}", DtmContext.ApplicationExtension);
                if(request.Url != null)
                {
                    var query = request.Url.Query == null ? string.Empty : request.Url.Query.ToString();

                    url = url + query;
                }
                
                response.Redirect(url);
            }

            var isAffirmCancel = Request.QueryString["Cancelled"] ?? string.Empty;

            if(isAffirmCancel == "true" && Form["acceptOffer"] == null)
            {
                AddModelStateError("error", "Your Affirm transaction has been cancelled. To complete your order, please choose a payment method below. NOTE: Credit Card and PayPal are only available for one-time payments. Affirm offers up to 12 payments on your order.");
            }
        }

        public override void PostValidate(ModelStateDictionary modelState)
        {
            ValidateCardConnect(modelState);
        }

        public override void PostSetOrderStatus()
        {
            base.PostSetOrderStatus();
            Order.OrderStatusId = 1;
        }
        #endregion
    }
}
