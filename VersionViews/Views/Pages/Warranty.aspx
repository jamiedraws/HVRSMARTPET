<%@ Page Language="C#" MasterPageFile="~/Shared/Customers/575/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="HVRSMARTPET.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<main aria-labelledby="main-title" class="view">
	<div id="main" class="view__anchor"></div>
	<div class="view__in">
		<div class="warranty copy copy--article" itemscope itemtype="https://schema.org/warranty">

			<h2 id="main-title">Warranty Information</h2>

			<p><strong>ANY SERVICING SHOULD BE DONE BY AN AUTHORIZED SERVICE REPRESENTATIVE CALL
			<a id="warranty-information-phone" href="tel:1-800-944-9200">1-800-944-9200</a> USA & CANADA</strong><br>
			In the event that further assistance is required, visit an authorized service center. Find one nearest you by visiting our website at <a target="_blank" id="warranty-information-website" href="https://www.hoover.com/">www.hoover.com</a>. Costs of any transportation to and from any place of repair are to be paid by the owner. Always identify your product by the model number and manufacturing code when requesting information or ordering replacement parts.(The model number and manufacturing code are on the back of the product).</p>

			<h3>
				LIMITED FIVE YEAR WARRANTY (DOMESTIC USE) <br>
				WHAT THIS WARRANTY COVERS
			</h3>
			<p>When used and maintained in normal household use and in accordance with the Owner's Manual, your <%= Brand.HVR %> product is warranted against original defects in material and workmanship a full five years from date of purchase (the &ldquo;Warranty Period&rdquo;). During the Warranty Period, <%= Brand.HVR %> will provide labor and parts at no cost to you to correct any such defect in products purchased in the United States, U.S. Military Exchanges and Canada.</p>

			<h3>
				HOW TO MAKE A WARRANTY CLAIM
			</h3>
			<p>If this product is warranted, take or send the product to either a <%= Brand.HVR %> Sales and Service Center or <%= Brand.HVR %> Authorized Warranty Service Dealer along with proof of purchase. For an automated referral to authorized service outlets in the U.S.A., phone: <a id="warranty-claim-phone-1" href="tel:1-800-944-9200">1-800-944-9200</a> OR visit <%= Brand.HVR %> online at <a id="warranty-full-hoover-claim" target="_blank" href="https://www.hoover.com/">www.hoover.com</a>. For additional assistance or information concerning this Warranty or the
			availability of warranty service outlets, call the <%= Brand.HVR %> Consumer Response Center, Phone <a id="warranty-claim-phone-2" href="tel:1-800-944-9200">1-800-944-9200</a>, Mon-Fri 8am-7pm EST. In Canada, contact <%= Brand.HVR %> Canada, Carson Building, 100 Carson St., Etobicoke, Ontario M8W 3R9, Phone: <a id="warranty-claim-phone-3" href="tel:1-800-944-9200">1-800-944-9200</a>, Mon-Fri 8am-7pm EST.</p>

			<h3>
				WHAT THIS WARRANTY DOES NOT COVER
			</h3>
			<p>This warranty does not cover: use of the product in a commercial operation (such as maid,	janitorial and equipment rental services), filter, brushroll and belt, improper maintenance of the product, damage due to misuse, acts of God, nature, vandalism or other acts beyond the control	of <%= Brand.HVR %>, owner's acts or omissions, use outside the country in which the product was initially purchased and resales of the product by the original owner. This warranty does not cover pick up,	delivery, transportation or house calls, however, if you mail your product to a <%= Brand.HVR %> Sales and	Service Center for warranty service, cost of shipping will be paid one way. This warranty does not apply to products purchased outside the United States, including its	territories and possessions, outside a U.S. Military Exchange and outside of Canada. This warranty	does not cover products purchased from a party that is not an authorized retailer, dealer, or
			distributor of <%= Brand.HVR %> products.</p>

			<h3>
				OTHER IMPORTANT TERMS
			</h3>
			<p>This warranty is not transferable and may not be assigned. This Warranty shall be governed and construed under the laws of the state of Ohio. The Warranty Period will not be extended by any replacement or repair performed under this Warranty.</p>

			<p>THIS WARRANTY IS THE EXCLUSIVE WARRANTY AND REMEDY PROVIDED BY <%= Brand.HVR %>. ALL OTHER
			WARRANTIES, EXPRESSED OR IMPLIED, INCLUDING WARRANTIES OF MERCHANTABILITY OR FITNESS
			FOR PARTICULAR PURPOSE, ARE DISCLAIMED. IN NO EVENT WILL <%= Brand.HVR %> BE LIABLE FOR ANY
			SPECIAL, INDIRECT, INCIDENTAL OR CONSEQUENTIAL DAMAGES OF ANY KIND OR NATURE TO OWNER
			OR ANY PARTY CLAIMING THROUGH OWNER, WHETHER BASED IN CONTRACT, NEGLIGENCE, TORT
			OR STRICT PRODUCTS LIABILITY OR ARISING FROM ANY CAUSE WHATSOEVER. Some states do not
			allow the exclusion of consequential damages, so the above exclusion may not apply to you. This warranty gives you specific rights; you may also have others that vary from state to state.</p>


		</div>
        <div class="view__disclaimer">
            <% Html.RenderSnippet("OFFERDETAILS"); %>
        </div>
	</div>
</main>

</asp:Content>