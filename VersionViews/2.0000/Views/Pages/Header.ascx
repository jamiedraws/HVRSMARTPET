<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<% 
	var isIndex = DtmContext.PageCode == "Index";
	var isMobile = DtmContext.IsMobile;
	var isDesktop = !isMobile;
    var isStartPage = DtmContext.Page.IsStartPageType && DtmContext.PageCode != "PaymentForm";
	var productName = SettingsManager.ContextSettings["Label.ProductName"];

	var hashIndex = "#main";
	var hashReviews = "#reviews";
	var hashFAQ = "#faq";

	var linkIndex = isIndex ? hashIndex : String.Format("Index{0}{1}", DtmContext.ApplicationExtension, hashIndex);
	var linkReviews = isIndex ? hashReviews : String.Format("Index{0}{1}", DtmContext.ApplicationExtension, hashReviews);
	var linkFAQ = isIndex  ? hashFAQ : String.Format("Index{0}{1}", DtmContext.ApplicationExtension, hashFAQ);

	if (!isStartPage) {
		linkIndex = "#";
	}
%>

<% if (isDesktop) { %>
<header aria-labelledby="header-title" class="view header view--header">
	<div class="view__in">
		<div class="header__group">
			<a href="<%= linkIndex %>" id="header-logo" class="header__logo">
				<picture class="arp arp--logo" style="--arp: 353/103; max-width: 353px">
					<img src="/images/logo.png" alt="<%= productName %>">
				</picture>	
			</a>
			<h1 id="header-title" class="header__title title">
				<strong>Deep cleaning as easy as vacuuming</strong>
				<span>now enhanced for homes with pets</span>
			</h1>
		</div>
	</div>
</header>
<% } %>


<nav aria-label="Website pages links" class="view nav">
	<% if (isMobile) { %>
	<a href="<%= linkIndex %>" id="nav-logo" class="nav__logo" style="--arp: 353/103; max-width: 353px">
		<img src="/images/logo.png" alt="<%= productName %>">
	</a>
	<% if (isStartPage) { %>
	<input class="nav__toggle" type="checkbox" id="nav__toggle">
	<label class="nav__label" for="nav__toggle" aria-label="Toggle Menu">
		<span></span>
	</label>
	<div class="nav__underlay" for="nav__toggle" role="presentation" aria-label="Hide Menu"></div>
	<% } %>
	<% } %>
	<% if (isStartPage) { %>
	<div class="nav__pane">
		<div class="nav__group">
			<div class="deal nav__promo">
				<div class="deal__banner banner">
					<span>Online Only 10% Off Today!</span>
				</div>
			</div>
			<div class="nav__list">
				<a href="<%= linkIndex %>" id="nav-logo" class="nav__logo" style="--arp: 353/103; max-width: 353px">
					<img src="/images/logo.png" alt="<%= productName %>">
				</a>
				<% if (isMobile) { %>
				<h1 class="nav__title title">
					<strong>Deep cleaning as easy as vacuuming</strong>
					<span>now enhanced for homes with pets</span>
				</h1>
				<% } %>
				<a class="nav__link" href="<%= linkIndex %>" id="nav-home">
					<span>Home</span>
				</a>
				<a class="nav__link" href="<%= linkFAQ %>" id="nav-faq">
					<span>Frequently Asked Questions</span>
				</a>
				<a class="nav__link" href="<%= linkReviews %>" id="nav-reviews">
					<span>Reviews</span>
				</a>
				<div class="nav__deal">
					<%= Html.Partial("OfferGroup", new ViewDataDictionary {
						{ "modifier", "deal--nav" },
						{ "id", "nav" }
                    }) %>
				</div>
			</div>
		</div>
	</div>
	<% } %>
</nav>