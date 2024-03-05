using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models;

namespace HVRSMARTPET.PageHandlers
{
    public class ProcessPaymentPageHandler : CommonPageHandler
    {
        #region " Overrides... "


        public override void PostValidate(ModelStateDictionary modelState)
        {
            ValidateCardConnect(modelState);

            if (Request.HttpMethod == "GET" && !modelState.IsValid && DtmContext.Version >= 20)
            {
                Order.OrderStatusId = 9;
                Context.SubmitChanges();
            }
        }

        #endregion
    }
}
