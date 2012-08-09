<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchRelatedKeys.ascx.cs" Inherits="RIVM.NetWriter.Controls.SearchRelatedKeys" %>
<strong><asp:label ID="txtMessage" runat="server"></asp:label></strong></p>
<asp:GridView CssClass="nw_zgg_add_table_sorter" ID="grvResult" runat="server" AutoGenerateColumns="false" Caption="Zoekresultaten" UseAccessibleHeader="true" AllowPaging="true" AllowSorting="false" CellSpacing="-1" GridLines="None" 
    OnPageIndexChanging="grvResult_PageIndexChanging" OnSorting="grvResult_Sorting" PageSize="15" OnPreRender="grvResult_PreRender">    
    <Columns>    
        <asp:HyperLinkField DataTextField="naam" DataNavigateUrlFields="nw_published_content_search_index_value" Target="_self" HeaderText="Zoekresultaten"></asp:HyperLinkField>

    </Columns>
    </asp:GridView>