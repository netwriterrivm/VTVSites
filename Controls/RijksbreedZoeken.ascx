<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RijksbreedZoeken.ascx.cs"
    Inherits="VTVSites.Controls.RijksbreedZoeken" %>
<div class="form_nw_app">
    <fieldset>
        <legend class="hide">Zoeken</legend>
        <ol>
            <li>
                <asp:Label AssociatedControlID="txtSearch" ID="lblLabel" runat="server" Text="Zoekterm"></asp:Label>
                <asp:TextBox CssClass="text" ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button CssClass="submit" ID="btnSubmit" runat="server" Text="Zoek" OnClick="btnSubmit_Click" />
            </li>
            <li>
                <asp:Label ID="lblFreeSearchEqual" runat="server" AssociatedControlID="chbFreeSearchEqual">Op hele woorden zoeken</asp:Label>
                <asp:CheckBox ID="chbFreeSearchEqual" runat="server" />
            </li>
           
        </ol>
    </fieldset>
</div>
<div>
<p><strong><asp:label ID="txtMessage" runat="server"></asp:label></strong></p>
    <asp:GridView CssClass="nw_zgg_add_table_sorter" ID="grvResult" runat="server" AutoGenerateColumns="false" Caption="Zoekresultaten" UseAccessibleHeader="true" AllowPaging="true" AllowSorting="false" CellSpacing="-1" GridLines="None" 
    OnPageIndexChanging="grvResult_PageIndexChanging" OnSorting="grvResult_Sorting" PageSize="15" OnPreRender="grvResult_PreRender">    
    <PagerSettings FirstPageText="eerste" LastPageText="laatste" Mode="NumericFirstLast" NextPageText="volgende" PreviousPageText="vorige" />
    <Columns>    
        <asp:HyperLinkField DataTextField="naam" DataNavigateUrlFields="content_url" Target="_self" HeaderText="Zoekresultaten"></asp:HyperLinkField>

    </Columns>
    </asp:GridView>
</div>