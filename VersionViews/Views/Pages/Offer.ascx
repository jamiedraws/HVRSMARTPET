<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%
    var label = (String)ViewData["label"] ?? "This will be announced by screen readers.";
    var standfirst = (String)ViewData["standfirst"] ?? "For The Value Of";
    var dollar = (String)ViewData["dollar"] ?? "XX";
    var cent = (String)ViewData["cent"] ?? "XX";
    var disclaimer = (String)ViewData["disclaimer"] ?? String.Empty;
    var cssClasses = (String)ViewData["cssClasses"] ?? String.Empty;
    var hasCrossout = (String)ViewData["hasCrossout"] ?? String.Empty;
%>

<div aria-label="<%= label %>" class="offer offer--product <%= cssClasses %>">
    <div aria-hidden="true" class="offer__txt <%= hasCrossout %>"><%= standfirst %></div>
    <div aria-hidden="true" class="offer__price">
        <span class="offer__currency">$</span>
        <span class="offer__amt"><%= dollar %></span>
        <span class="offer__follow">
            <span class="offer__cent"><%= cent %></span>
            <% if (!String.IsNullOrEmpty(disclaimer)) { %>
                <span class="offer__disclaimer"><%= disclaimer %></span>
            <% } %>
        </span>
    </div>
</div>