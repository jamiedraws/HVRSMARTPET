<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<%
	var modifier = (String)ViewData["modifier"] ?? String.Empty;
	var id = (String)ViewData["id"] ?? String.Empty;
%>

<div class="deal <%= modifier %>">
	<div class="deal__banner banner banner--ribbon">
		<span>Limited Time Offer!</span>
	</div>
	<%
        var disclaimerMultiPay = "a month with 12 payments";

        if (id == "nav")
        {
            disclaimerMultiPay = "/mo";
        }

        var offerMultiPay = new ViewDataDictionary
        {
            { "label", "For as low as $24.99 a month with 12 payments" },
            { "standfirst", "For as low as" },
            { "dollar", "24" },
            { "cent", "99" },
            { "cssClasses", "offer--multi-pay" },
            { "disclaimer", disclaimerMultiPay }
        };

        var offerSinglePay = new ViewDataDictionary
        {
            { "label", "1 payment of $299.88" },
            { "standfirst", "1 payment of" },
            { "dollar", "299" },
            { "cent", "88" },
            { "cssClasses", "offer--single-pay" }
        };
	%>

	<div class="deal__group">
		<div class="deal__item">
			<div class="deal__offer">
				<%= Html.Partial("Offer", offerMultiPay) %>
				<%= Html.Partial("AffirmVerbiage", new ViewDataDictionary { { "optionId", 0 }, { "modifier", "deal__affirm" } }) %>
			</div>
			<div class="deal__order">
				<a id="<%= id %>-multi-pay" href="javascript:void(0);" data-code="MAIN1" class="button button--order">
					<span>Order Now</span>
				</a>
			</div>
		</div>
		<div class="deal__item">
			<div class="deal__offer">
				<%= Html.Partial("Offer", offerSinglePay) %>
			</div>
			<div class="deal__order">
				<a id="<%= id %>-single-pay" href="javascript:void(0);" data-code="MAIN1" class="button button--order">
					<span>Order Now</span>
				</a>
			</div>
		</div>
	</div>
</div>