<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<%
    var isIndex = DtmContext.PageCode == "Index";
    var isFAQ = DtmContext.PageCode == "FAQ";
%>

<% if (isIndex) { %>
    <script defer src="/js/slide/js/slide.js"></script>
    <script defer src="/js/slide/js/components/slide.a11y.js"></script>
    <script defer src="/js/index.js"></script>
<% } %>

<% if (isFAQ) { %>
    <script defer src="/shared/customers/575/js/card.js"></script>    
<% } %>