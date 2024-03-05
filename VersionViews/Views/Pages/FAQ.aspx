<%@ Page Language="C#" MasterPageFile="~/Shared/Customers/575/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="HVRSMARTPET.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
    var csNumber = SettingsManager.ContextSettings["CustomerService.PhoneNumber", "800-406-2005"];
%>

<main aria-labelledby="main-title" class="view">
    <div id="main" class="view__anchor"></div>
    <div class="view__in">
        <div class="copy copy--article">
			<h2 id="main-title">Frequenty Asked Questions</h2>

			<p>Product related questions?<br>
				Call Customer Service at <a id="faq-cs-phone-number" href="tel:<%= csNumber %>"><%= csNumber %></a><br>
				<%= Html.Partial("GetPhoneByDomain", new ViewDataDictionary {
					{ "Domain", "www.buysmartwashpet.com|www.buysmartwash.com" },
					{ "Phone", "1-800-697-4880" },
					{ "PageType", "Sub" },
					{ "CallID", "faq-call-in-number" }
				}) %>
			</p>
			
			<ul class="copy__cards" aria-label="FAQ" itemscope itemtype="https://schema.org/FAQPage">
				<li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<button id="FAQ1" class="card__item card__tab">
						<div class="card__title">
							<span itemprop="name">Is the <%= Brand.PRODUCTNAME %> and <%= Brand.HVR %> cleaning solutions safe for use on all carpets and rugs?</span>
							<span class="card__corner">
								<span class="card__icon"></span>
							</span>
						</div>
					</button>
					<div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
						<div itemprop="text" class="card__copy">
							<p>They are safe to use on the following carpet and area rug types:</p>
							<ul>
								<li>Nylon</li>
								<li>Polyolefin</li>
								<li>Polyester</li>
								<li>Acrylic (composition of many small area and throw rugs)</li>
							</ul>
							<p>Always check manufacturer's label before cleaning for any specific instructions. Before you clean, test a small hidden area of carpet for color fastness. If color changes, do not use.</p>
						</div>
					</div>
				</li>

				<li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<button id="FAQ2" class="card__item card__tab">
						<div class="card__title">
							<span itemprop="name">How often should I deep clean my carpets with the <%= Brand.PRODUCTNAME %>?</span>
							<span class="card__corner">
								<span class="card__icon"></span>
							</span>
						</div>
					</button>
					<div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
						<div itemprop="text" class="card__copy">
							<p>We recommend deep cleaning 2-4 times per year. In addition to routine spring cleaning and holiday cleaning, <%= Brand.PRODUCTNAME %> is great for cleaning high-traffic areas, stairs, upholstery and those inevitable spots and spills.</p>
						</div>
					</div>
				</li>

				<li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<button id="FAQ3" class="card__item card__tab">
						<div class="card__title">
							<span itemprop="name">Can the <%= Brand.PRODUCTNAME %> clean furniture?</span>
							<span class="card__corner">
								<span class="card__icon"></span>
							</span>
						</div>
					</button>
					<div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
						<div itemprop="text" class="card__copy">
							<p>Yes! Your <%= Brand.PRODUCTNAME %> comes with an 8-foot hose and various tools to clean stains and spills on upholstered furniture.  Always check manufacturer's label before cleaning for any specific instructions.  Before you clean, test a small hidden area of carpet for color fastness.  If color changes, do not use.</p>
						</div>
					</div>
				</li>

				<li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<button id="FAQ4" class="card__item card__tab">
						<div class="card__title">
							<span itemprop="name">Does the <%= Brand.PRODUCTNAME %> have a rinse-only mode?</span>
							<span class="card__corner">
								<span class="card__icon"></span>
							</span>
						</div>
					</button>
					<div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
						<div itemprop="text" class="card__copy">
							<p>It's easy to rinse your carpets with the <%= Brand.PRODUCTNAME %>! Simply remove the solution tank from the unit, fill the Clean Water Tank, then push forward to rinse, pull back to dry.  We recommend rinsing your carpets after cleaning to remove any solution residue.</p>
						</div>
					</div>
				</li>

				<li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<button id="FAQ5" class="card__item card__tab">
						<div class="card__title">
							<span itemprop="name">How much cleaning solution do I need when using my <%= Brand.PRODUCTNAME %>?</span>
							<span class="card__corner">
								<span class="card__icon"></span>
							</span>
						</div>
					</button>
					<div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
						<div itemprop="text" class="card__copy">
							<p>The great thing about the <%= Brand.PRODUCTNAME %> is there is NO measuring to do! Simply fill the Solution Tank with <%= Brand.HVR %> cleaning solution and the <%= Brand.PRODUCTNAME %> takes care of all the mixing and measuring, it's that easy!</p>
						</div>
					</div>
				</li>

				<li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<button id="FAQ6" class="card__item card__tab">
						<div class="card__title">
							<span itemprop="name">What attachments are included with the <%= Brand.PRODUCTNAME %> carpet cleaner?</span>
							<span class="card__corner">
								<span class="card__icon"></span>
							</span>
						</div>
					</button>
					<div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
						<div itemprop="text" class="card__copy">
							<p>The <%= Brand.PRODUCTNAME %> includes the 2-in-1 <%= Products.PETTOOL %> - great for pet messes and prevents bacteria, mold and mildew build up on the tool.</p>
						</div>
					</div>
				</li>

				<li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<button id="FAQ7" class="card__item card__tab">
						<div class="card__title">
							<span itemprop="name">Can the <%= Brand.PRODUCTNAME %> be used on tile, hardwood or other hard floor surfaces?</span>
							<span class="card__corner">
								<span class="card__icon"></span>
							</span>
						</div>
					</button>
					<div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
						<div itemprop="text" class="card__copy">
							<p>We designed the <%= Brand.PRODUCTNAME %> specifically for deep carpet cleaning. We do not recommend using <%= Brand.PRODUCTNAME %> on bare floor surfaces.</p>
						</div>
					</div>
				</li>

				<li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<button id="FAQ8" class="card__item card__tab">
						<div class="card__title">
							<span itemprop="name">How easy it to clean the brush roll on the <%= Brand.PRODUCTNAME %>?</span>
							<span class="card__corner">
								<span class="card__icon"></span>
							</span>
						</div>
					</button>
					<div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
						<div itemprop="text" class="card__copy">
							<p><%= Brand.PRODUCTNAME %> has a one-step removable nozzle that makes it easy to remove and clean the brushes. No screwdrivers needed.</p>
						</div>
					</div>
				</li>

				<li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<button id="FAQ9" class="card__item card__tab">
						<div class="card__title">
							<span itemprop="name">How much does the <%= Brand.PRODUCTNAME %> weigh?</span>
							<span class="card__corner">
								<span class="card__icon"></span>
							</span>
						</div>
					</button>
					<div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
						<div itemprop="text" class="card__copy">
							<p>The <%= Brand.PRODUCTNAME %> weighs less than 19 pounds.</p>
						</div>
					</div>
				</li>

				<li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<button id="FAQ10" class="card__item card__tab">
						<div class="card__title">
							<span itemprop="name">What is the warranty for the <%= Brand.PRODUCTNAME %> Carpet Cleaner?</span>
							<span class="card__corner">
								<span class="card__icon"></span>
							</span>
						</div>
					</button>
					<div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
						<div itemprop="text" class="card__copy">
							<p>The <%= Brand.PRODUCTNAME %> carpet cleaner comes with a 5 year warranty.</p>
						</div>
					</div>
				</li>

				<li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<button id="FAQ11" class="card__item card__tab">
						<div class="card__title">
							<span itemprop="name">What is the benefit of <%= Brand.HVR %>'s <%= Products.HEATFORCE %> Technology?</span>
							<span class="card__corner">
								<span class="card__icon"></span>
							</span>
						</div>
					</button>
					<div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
						<div itemprop="text" class="card__copy">
							<p><%= Brand.HVR %>'s exclusive <%= Products.HEATFORCE %> Technology blows hot air onto the carpet while the Dry Only Mode extracts all that extra water so you can get back to your carpets in no time!</p>
						</div>
					</div>
				</li>

			</ul>
        </div>
        <div class="view__disclaimer">
            <% Html.RenderSnippet("OFFERDETAILS"); %>
        </div>
    </div>
</main>

</asp:Content>