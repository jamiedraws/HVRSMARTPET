<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="HVRSMARTPET.Models" %>

<%
    var modifier = ViewData["modifier"] as string ?? "product__list";
    bool? applyButtons = ViewData["applyButtons"] as bool? ?? false;
    bool? applyId = ViewData["applyId"] as bool? ?? true;

    bool useButtons = applyButtons.HasValue ? applyButtons.Value : false;
    bool useId = applyId.HasValue ? applyId.Value : false;

    Tuple<string, string>[] features =
    {
        new Tuple<string, string>(
            Products.SPOTCHASER,
            "Detaches easily from the machine for pretreating set-in stains. Equipped with its own tank of Oxy Pet solution for instant cleaning action."
        ),
        new Tuple<string, string>(
            "Triggerless, Automatic Design",
            "Simply push forward to wash, and pull back to dry. It's as easy as vacuuming."
        ),
        new Tuple<string, string>(
            "Separate Tanks",
            "Keep clean water and dirty water separate for an effective clean - and easy clean-up."
        ),
        new Tuple<string, string>(
            String.Format("Dry Only with {0}", Products.HEATFORCE),
            String.Format("The Auto Dry button delivers powerful extraction to get back to your carpets sooner with {0} for faster drying", Products.HEATFORCE)
        ),
        new Tuple<string, string>(
            "Hose Access",
            "Go beyond your carpets to your stairs and upholstery with specifically engineered tools and accessories"
        ),
        new Tuple<string, string>(
            String.Format("{0} Pet Power Brushes", Products.FLEXFORCE),
            "Powerful antimicrobial brushrolls deep clean while resisting pet odor"
        ),
    };

    if (features != null && features.Any())
    {

        if (useButtons)
        {
            int buttonId = features.Length;
            for (int i = 1; i <= buttonId; i++)
            { %>
            <button id="feature-button-<%= i %>" title="<%= i %>" aria-labelledby="feature-<%= i %>"></button>
            <% if (i == 3) { %>
                <button id="feature-button-<%= i %>-2" title="<%= i %>" aria-labelledby="feature-<%= i %>"></button>
            <% }
            }
        } 
        else
        {
            int featureId = 1;
            %>
            <ul class="<%= modifier %>">
            <%
                foreach (Tuple<string, string> feature in features)
                {
                    if (useId)
                    {
                    %>
                <li id="feature-<%= featureId %>">
                    <span><strong><%= feature.Item1 %>:</strong> <%= feature.Item2 %></span>
                </li>
                    <%
                    } 
                    else
                    {
                    %>
                <li>
                    <span><strong><%= feature.Item1 %>:</strong> <%= feature.Item2 %></span>
                </li>
                    <%
                    }
                    featureId++;
                } 
                %>
            </ul>
            <%
        }
    }
%>