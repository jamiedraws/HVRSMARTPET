<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<% 
    var isPaymentPage = DtmContext.PageCode == "PaymentForm" || DtmContext.PageCode == "ProcessPayment";
    var isFrontPage = DtmContext.Page.IsStartPageType && !isPaymentPage;
    var isIndex = DtmContext.PageCode == "Index";
    var isReviewPage = DtmContext.PageCode == "ReviewPage";
    var isUpsell = DtmContext.Page.PageType.Equals("Upsell", StringComparison.InvariantCultureIgnoreCase) || isReviewPage;
    var isConfirmation = DtmContext.Page.PageType == "Confirmation";
    var isFAQ = DtmContext.PageCode == "FAQ";
    var isCCPA = DtmContext.PageCode == "CCPA";

    var version = String.Format("?v={0}", 12);
%>

<link rel="preload" href="/images/logo.png" as="image" type="image/png">

<!-- roboto/900 -->
<link rel="preload" href="https://use.typekit.net/af/602e61/00000000000000003b9ad063/27/l?primer=7cdcb44be4a7db8877ffa5c0007b8dd865b3bbc383831fe2ea177f62257a9191&fvd=n9&v=3" as="font" type="font/woff2" crossorigin="anonymous">

<!-- urw-din cond -->
<link rel="preload" href="https://use.typekit.net/af/d3af1d/00000000000000003b9b0ef9/27/l?primer=7cdcb44be4a7db8877ffa5c0007b8dd865b3bbc383831fe2ea177f62257a9191&fvd=n7&v=3" as="font" type="font/woff2" crossorigin="anonymous">

<!-- urw-din -->
<link rel="preload" href="https://use.typekit.net/af/cbadfd/00000000000000003b9b0eec/27/l?primer=7cdcb44be4a7db8877ffa5c0007b8dd865b3bbc383831fe2ea177f62257a9191&fvd=n9&v=3" as="font" type="font/woff2" crossorigin="anonymous">

<!-- roboto/700 -->
<link rel="preload" href="https://use.typekit.net/af/5e9c68/00000000000000003b9ad05f/27/l?primer=7cdcb44be4a7db8877ffa5c0007b8dd865b3bbc383831fe2ea177f62257a9191&fvd=n7&v=3" as="font" type="font/woff2" crossorigin="anonymous">

<% if (isIndex) { %>
    <link rel="preload" href="/images/hoover-smart-wash-pet-1.jpg" as="image" type="image/jpeg">
    <link rel="preload" href="/images/hoover-smart-wash-pet-2.jpg" as="image" type="image/jpeg">
<% } %>

<link rel="stylesheet" href="https://use.typekit.net/ism7oul.css">
<link rel="stylesheet" href="/css/1.0000/header.css<%= version %>">

<% if (isIndex) { %>
    <link rel="stylesheet" href="/css/slide/slide.css">
    <link rel="stylesheet" href="/css/1.0000/index.css<%= version %>">
<% } %>

<% if (isFrontPage && !isIndex) { %>
    <link rel="stylesheet" href="/css/1.0000/style.css<%= version %>">
<% } %>

<% if (isFAQ) { %>
    <link rel="stylesheet" href="/css/1.0000/faq.css<%= version %>">
<% } %>

<% if (isUpsell) { %>
    <link rel="stylesheet" href="/css/1.0000/upsell.css<%= version %>">
<% } %>

<% if (isPaymentPage) { %>
    <link rel="stylesheet" href="/css/1.0000/payment.css<%= version %>">
<% } %>

<% if (isConfirmation) { %>
    <link rel="stylesheet" href="/css/1.0000/confirmation.css<%= version %>">    
<% } %>

<% if (isCCPA) { %>
    <link rel="stylesheet" href="/Shared/Customers/575/css/1.0000/ccpa.css">
<% } %>

<style>
.addons__bonus {
    margin-top: 1em;
}
.bonus__group {
    flex-wrap: wrap;
}
.bonus__clean-complements {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-direction: row-reverse;
    padding: 2.5em 8em 0.5em 3em;
    margin: 0.5em 0 -2em 0;
    flex: 0 1 100%;
}
@media all and (max-width:740px) and (orientation:portrait) {
 .dtm__in--mv .bonus__item {
  margin-top: 3em;
  margin-bottom: -5em;
 }
}
</style>