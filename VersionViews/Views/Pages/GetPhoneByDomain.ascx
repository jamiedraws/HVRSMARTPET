<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    /* this renders out a phone number based on the current domain name
        this can be expressed as a partial token
        ex: [#Partial.GetOrderByPhone.{ "Domain" : "BuySmartWash.com|SmartWashTV.com, TrySmartWash.com|SmartWashOffer.com", "Phone" : "888-860-2106, 888-860-2149" }#]
    */
    // let's get our domains
    var Domain = ViewData["Domain"] as string ?? String.Empty;
    // and let's get our phone numbers
    var Phone = ViewData["Phone"] as string ?? String.Empty;
    // get the page type to change the styling based on location
    var PageType = ViewData["PageType"] as string ?? String.Empty;
    // the id for the link for tracking purposes
    var CallID = ViewData["CallID"] as string ?? String.Empty;
    // now, let's see what the current domain name is
    var CurrentDomain = DtmContext.Domain.Domain;
    // and finally, let's get our campaign name
    var CampaignName = SettingsManager.ContextSettings["Label.ProductName"];

    // for testing purposes, see if we're on stage and the "testdomain" paramater is available and contains a url
    if ( DtmContext.CampaignDomains.Any(d => d.DomainId == DtmContext.DomainId && d.Domain.ToLower().Contains("stage")) && !String.IsNullOrEmpty(Request["testdomain"]) ) {
        CurrentDomain = Request["testdomain"] ?? String.Empty;
    }

    // now let's make sure we actually have a domain and a phone number
    if ( !String.IsNullOrEmpty(Domain) && !String.IsNullOrEmpty(Phone) ) {
        // just in case we have multiple domains, split it out
        string[] domainGroup = Domain
            .Split(new [] {","}, StringSplitOptions.RemoveEmptyEntries)
            .Select(s => s.Trim())
			.Where(s => !String.IsNullOrWhiteSpace(s))
            .ToArray();
        // and just in case we have multiple phone numbers, split this out too
        string[] phoneGroup = Phone
            .Split(new [] {","}, StringSplitOptions.RemoveEmptyEntries)
            .Select(s => s.Trim())
			.Where(s => !String.IsNullOrWhiteSpace(s))
            .ToArray();

        // if we have at least one domain and at least one phone number
        if ( domainGroup.Length > 0 && phoneGroup.Length > 0 ) {
            // let's check each domain and see if it matches up with the current domain
            for ( var i = 0; i < domainGroup.Length; i++ ) {
                var domain = domainGroup.ElementAt(i).ToLower();

                if (domain.Contains(CurrentDomain.ToLower()) ) {
                    var phone = phoneGroup.Length > i ? phoneGroup.ElementAt(i) : string.Empty;
                    // okay, now just display the phone number markup with a little bit of semantic luv
                    if (PageType != "Sub") { %>
                    <div class="call-in-phone"><span class="icon icon-phone"></span>&nbsp;&nbsp;<% } %>To Order By Phone: <a id="<%= CallID %>" href="tel:<%= phone %>" title="Call in to order <%= CampaignName %> now!"><%= phone %></a><% if (PageType != "Sub") { %></div><% } %>
                    <%
                }
            }
        }
    }
%>

