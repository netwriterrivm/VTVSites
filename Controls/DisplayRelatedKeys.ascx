<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DisplayRelatedKeys.ascx.cs" Inherits="RIVM.NetWriter.NetWriterSiteComponents.Controls.DisplayRelatedKeys" %>
<strong><asp:label ID="txtMessage" runat="server"></asp:label></strong></p>
<asp:GridView CssClass="nw_zgg_add_table_sorter" ID="grvResult" runat="server" AutoGenerateColumns="false" Caption="Zoekresultaten" UseAccessibleHeader="true" AllowPaging="false" AllowSorting="false" CellSpacing="-1" GridLines="None" 
    >    
    <Columns>    
        <asp:HyperLinkField DataTextField="naam" DataNavigateUrlFields="nw_published_content_search_index_value" Target="_self" HeaderText="Zoekresultaten"></asp:HyperLinkField>

    </Columns>

    </asp:GridView>
<asp:Literal ID="litResult" runat="server"></asp:Literal>