<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<% 
	var productName = SettingsManager.ContextSettings["Label.ProductName"];
	var ext = DtmContext.ApplicationExtension;
%>

<div id="warranty" class="hide">
	<div id="policyContent" class="policy-body">
			<h1 class="h5 bold">
				5 YEAR LIMITED WARRANTY
			</h1> 
			<p class="u-mar--vert">
				Every <%= productName %>, Model FH53000TV1, purchased through the exclusive TV-only offer is backed by Hoover<sup>&reg;</sup>'s Five-Year Limited Warranty, so you know you'll be taken care of every step of the way.
			</p> 
			<p>
				The exclusive benefits include:
			</p>
			<ul class="left-margin @x2-mar">
				<li>Free shipping and returns on covered warranty replacements</li>
				<li>Immediate item replacement</li>
				<li>Five full years of coverage from the original purchase date</li>
			</ul>
			<p class="u-mar--vert">
				The full terms and conditions of the 5-Year Preferred Limited Warranty are <a href="Warranty<%= ext %>" id="popup-warranty-full">available here.</a>
			</p>
	</div>
</div>