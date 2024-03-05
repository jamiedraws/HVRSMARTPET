using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Extensions;
using Dtm.Framework.Models.Ecommerce.Repositories;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace HVRSMARTPET.Models
{
    /// <summary>
    /// This repository should load on app start, for this reason it is Static
    /// </summary>
    public class ClientTaxRateRepository
    {
        private static SortedList<string, decimal> _data = null;
        /// <summary>
        /// Static constructor ensures it is only run once
        /// </summary>
        static ClientTaxRateRepository()
        {
            var clientTaxes = File.ReadAllLines(Path.Combine(DtmContext.ProjectPath, "docs", "ClientTaxes.txt"))
            .Skip(1)
            .Select(line =>
            {
                // Expected Format
                // 0 	   | 1 	  | 2  | 3		   | 4 		 | 5 		| 6		| 7				| 8
                // tax_rate|county|city|from_postal|to_postal|state_prov|country|state_prov_desc|create_date
                var parts = line.Split('|');
                decimal tempDec;
                //DateTime tempDate;
                return new
                {
                    // save tax rate as percentage value of 100, 4.5 % would equal .045
                    tax_rate = decimal.TryParse(parts[0], out tempDec) ? (tempDec / 100) : 0M,
                    //county = parts[1],
                    //city = parts[2],
                    from_postal = parts[3],
                    to_postal = parts[4],
                    state_prov = parts[5],
                    country = parts[6],
                    //state_prov_desc = parts[7],
                    //create_date = DateTime.TryParse(parts[8], out tempDate) ? tempDate : new DateTime()
                };
            })
            .ToList();

            var rangeTaxes = clientTaxes
                .Where(ct => ct.from_postal != ct.to_postal && ct.country == "US")
                .ToList();

            var uniqueTaxes = clientTaxes
                .Except(rangeTaxes)
                .ToList();
            int tempInt;
            foreach (var rangeTax in rangeTaxes)
            {
                int fromPostal = int.TryParse(rangeTax.from_postal, out tempInt) ? tempInt : 0,
                    toPostal = int.TryParse(rangeTax.to_postal, out tempInt) ? tempInt : 0;
                for (int i = fromPostal; i <= toPostal; i++)
                {
                    uniqueTaxes.Add(new
                    {
                        tax_rate = rangeTax.tax_rate,
                        //county = rangeTax.county,
                        //city = rangeTax.city,
                        from_postal = i.ToString(),
                        to_postal = i.ToString(),
                        state_prov = rangeTax.state_prov,
                        country = rangeTax.country,
                        //state_prov_desc = rangeTax.state_prov_desc,
                        //create_date = rangeTax.create_date
                    });
                }
            }

            uniqueTaxes = uniqueTaxes.Distinct().ToList();

            var taxRateDictionary = uniqueTaxes
                .GroupBy(u => new { u.from_postal, u.state_prov, u.country })
                .Select(g => new
                {
                    Key = (g.Key.from_postal + g.Key.state_prov + g.Key.country).ToUpper(),
                    TaxRate = g.Max(u => u.tax_rate)
                })
                .OrderBy(k => k.Key)
                .ToList()
                .ToDictionary(k => k.Key, v => v.TaxRate);

            _data = new SortedList<string, decimal>(taxRateDictionary);
        }

        public decimal GetTaxRate(string postalCode, string stateCode, string countryCode)
        {
            decimal value;
            bool isMissingPostalCode = string.IsNullOrWhiteSpace(postalCode),
                isMissingStateCode = string.IsNullOrWhiteSpace(stateCode),
                isMissingCountryCode = string.IsNullOrWhiteSpace(countryCode);


            if ((isMissingStateCode || isMissingCountryCode) && !isMissingPostalCode)
            {
                var searchPostalCode = postalCode;
                var dbContext = EcommerceDataContextManager.Current;
                var numberCount = postalCode.NumbersOnly().Length;
                if (numberCount >= 5)
                {
                    searchPostalCode = searchPostalCode.Substring(0, 5);
                    var taxRate = dbContext.TaxRates
                        .Where(tr => tr.ZipCode == searchPostalCode)
                        .Select(tr => new { tr.State, CountryCode = tr.Country.TwoDigitCode })
                        .FirstOrDefault();
                    if (taxRate != null)
                    {
                        stateCode = taxRate.State;
                        countryCode = taxRate.CountryCode ?? countryCode;
                        isMissingStateCode = string.IsNullOrWhiteSpace(stateCode);
                        isMissingCountryCode = string.IsNullOrWhiteSpace(countryCode);
                    }
                }
            }

            if (isMissingPostalCode || isMissingStateCode || isMissingCountryCode)
            {
                throw new Exception(string.Format("Unable to get tax rate for: PostalCode={0} | StateCode={1} | CountryCode={2}", postalCode, stateCode, countryCode));
            }

            if (countryCode.Length > 2)
            {
                var twoDigitCountryCode = DtmContext.CampaignCountries
                    .Where(c => c.CountryCode == countryCode)
                    .Select(c => c.TwoDigitCode)
                    .FirstOrDefault();
                if (twoDigitCountryCode == null)
                {
                    throw new Exception("Unable to find two digit country code for: " + countryCode);
                }
                else
                {
                    countryCode = twoDigitCountryCode;
                }
            }
            if (countryCode == "US" && postalCode.Length > 5)
            {
                postalCode = postalCode.Substring(0, 5);
            }
            if (countryCode == "CA" && postalCode.Length > 3)
            {
                // Source data only uses first 3 letters of CAN postal code
                postalCode = postalCode.Substring(0, 3);
            }
            var lookupKey = postalCode + stateCode + countryCode;
            _data.TryGetValue(lookupKey.ToUpper(), out value);
            return value;
        }
    }
}