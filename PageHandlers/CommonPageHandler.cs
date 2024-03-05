using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models;

namespace HVRSMARTPET.PageHandlers
{
    public class CommonPageHandler : PageHandler
    {

        public void ValidateCardConnect(ModelStateDictionary modelState)
        {
            if (DtmContext.Page.IsStartPageType || DtmContext.Page.PageCode == "ProcessPayment")
            {
                var orderType = Form["OrderType"] ?? string.Empty;

                if (orderType.Contains("cardconnect"))
                {
                    var token = Form["Token"];

                    if (string.IsNullOrWhiteSpace(token))
                    {
                        modelState.AddModelError("Form", "Please ensure all card information has been entered");
                    }
                }
            }
        }

    }
}
