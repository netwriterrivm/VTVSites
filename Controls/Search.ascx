<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="RIVM.NetWriter.NetWriterSiteComponents.Controls.Search" %>
<script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //Verberg totaalresultaat
        $(".Result_total").hide();
        $(".Minder").hide();
        $(".Meer").click(function () {
            $(this).next(".Result_total").show();
            $(".Minder").show();
            $(".Meer").hide();
        });
        $(".Minder").click(function () {
            $(this).next(".Meer").show();
            $(".Result_total").hide();
            $(".Minder").hide();
            $(".Meer").show();

        });
    });
</script>

    <asp:Panel CssClass="form_nw_app nw_search_component" ID="pnlSearch" DefaultButton="btnSubmit" runat="server">

    
    <fieldset>
        <legend class="hide">
            <asp:Literal ID="litControlTitle" runat="server">Zoeken</asp:Literal></legend>
        <ol>
            <li>
                <asp:Label AssociatedControlID="txtSearch" ID="lblLabel" runat="server" Text="Zoekterm"></asp:Label>
                <asp:TextBox CssClass="text" ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button CssClass="submit" ID="btnSubmit" runat="server" Text="Zoek" OnClick="btnSubmit_Click" />
            </li>
            <li>
                <asp:Panel ID="pnlWordMode" CssClass="nw_search_component_container" runat="server">
                    <asp:Label ID="lblFreeSearchEqual" runat="server" AssociatedControlID="chbFreeSearchEqual">Op hele woorden zoeken</asp:Label>
                    <asp:CheckBox ID="chbFreeSearchEqual" runat="server" />
                </asp:Panel>
                <asp:Panel ID="pnlSearchMode" CssClass="nw_search_component_container" runat="server">
                    <asp:Label ID="lblSearchMode" runat="server">Zoek mode</asp:Label>
                    <asp:RadioButton GroupName="SearchMode" ID="rbShowSearchModeAnd" Checked="true"  runat="server" />
                    <asp:Label ID="lblSearchModeAnd"  runat="server">En</asp:Label>
                    <asp:RadioButton GroupName="SearchMode" ID="rbShowSearchModeOr" runat="server" />
                    <asp:Label ID="lblSearchModeOr" runat="server">Of</asp:Label>
                </asp:Panel>
                <asp:Panel ID="pnlSearchMethod" CssClass="nw_search_component_container" runat="server">
                    <asp:Label ID="lblSearchMethod" runat="server">Zoek methode</asp:Label>
                    <asp:RadioButton GroupName="SearchMethod"  Checked="true" ID="rbSearchMethodFree" runat="server" />
                    <asp:Label ID="lblSearchMethodFree" runat="server">Vrij zoeken</asp:Label>
                    <asp:RadioButton GroupName="SearchMethod" ID="rbSearchMethodKeyWord" runat="server" />
                    <asp:Label ID="lblSearchMethodKeyWord" runat="server">Zoeken op trefwoord</asp:Label>
                </asp:Panel>
                <asp:Panel ID="pnlSearchDomain" CssClass="nw_search_component_container" runat="server" Visible="false">
                    <asp:Label ID="lblSearchDomain" Visible="false" runat="server">Zoekdomein</asp:Label>                    
                    <asp:RadioButton GroupName="SearchDomain" Checked="true" ID="rbSearchdomainCurrent" runat="server" />
                    <asp:Label ID="lblSearchDomainCurrent"  runat="server">Deze site</asp:Label>
                    <asp:RadioButton GroupName="SearchDomain" ID="rbSearchdomainAll" runat="server" />
                    <asp:Label ID="lblSearchDomainAll" runat="server">Alle gerelateerde sites</asp:Label>
                </asp:Panel>
            </li>
             <asp:Literal ID="LitResult" runat="server"></asp:Literal>
        </ol>
    </fieldset>
   </asp:Panel>

<div>
    <p>
        <strong>
            <asp:Label ID="txtMessage" runat="server"></asp:Label></strong></p>
    <asp:GridView CssClass="nw_zgg_add_table_sorter" ID="grvResult" runat="server" Caption="Zoekresultaten"
        AllowPaging="True" CellSpacing="-1" GridLines="None" OnPageIndexChanging="grvResult_PageIndexChanging"
        OnSorting="grvResult_Sorting" OnRowDataBound="grvResult_RowDataBound" OnPreRender="grvResult_PreRender"
        EnableModelValidation="True" AutoGenerateColumns="False">
        <PagerSettings FirstPageText="eerste" LastPageText="laatste" Mode="NumericFirstLast"
            NextPageText="volgende" PreviousPageText="vorige" />
        <Columns>
            <asp:HyperLinkField DataTextField="naam" DataNavigateUrlFields="content_url" Target="_self"
                HeaderText="Zoekresultaten"></asp:HyperLinkField>
        </Columns>
    </asp:GridView>
    <asp:PlaceHolder ID="plcPaging" runat="server" />
</div>

