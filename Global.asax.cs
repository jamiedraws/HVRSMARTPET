using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models.Ecommerce.Repositories;
using HVRSMARTPET.Models;

namespace HVRSMARTPET
{
    public class MvcApplication : ClientSiteApplication
    {
        protected override void OnAppStart()
        {
            base.OnAppStart();
            var clientTaxRateRepository = new ClientTaxRateRepository();
            TaxRateRuleRespository.OverrideTaxRateRule = (campaignCode, countryCode, stateCode, postalCode, taxRateRule) =>
            {
                taxRateRule.TaxRate = clientTaxRateRepository.GetTaxRate(postalCode, stateCode, countryCode);
                return taxRateRule;
            };
        }
    }
}