using System;
using System.Collections;
using System.Configuration;
using System.Data;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Xml.Linq;
using System.Data.SqlClient;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using RIVM.NetWriter.BusinessObjects.Publish.Database;
namespace VTVSites.Controls
{
    public partial class RijksbreedZoeken : System.Web.UI.UserControl
    {
        private string _RootTitle;
        private int _XsltId;
        private string _XsltName;
        private string _SubPath="";
        private bool _ShowSearchWordOnly=false;
        private int _PageSize=0;
        private bool _ShowUrl=false;
        private bool _SearchBinaryContent=false;
        private string _SearchSiteProcedure = "";


        private const string cstrParFreeSearch = "@freesearch";
        private const string cstrParSiteUrl = "@site_url";
        private const string cstrSearchSite = "dpSearchSite";


        //Label
        private string _LabelShowSearchWordOnly="";
        private string _LabelButton = "";
        private string _LabelLenend = "";
        private string _LabelSearchMode = "";


        public string LabelLenend
        {
            get { return _LabelLenend; }
            set { _LabelLenend = value; }
        }

        public string LabelButton
        {
            get { return _LabelButton; }
            set { _LabelButton = value; }
        }

        public string LabelSearchMode
        {
            get { return _LabelSearchMode; }
            set { _LabelSearchMode = value; }
        }

    

        public string LabelShowSearchWordOnly
        {
            get { return _LabelShowSearchWordOnly; }
            set { _LabelShowSearchWordOnly = value; }
        }

        public bool SearchBinaryContent
        {
            get { return _SearchBinaryContent; }
            set { _SearchBinaryContent = value; }
        }

        public bool ShowUrl
        {
            get { return _ShowUrl; }
            set { _ShowUrl = value; }
        }

        public int PageSize
        {
            get { return _PageSize; }
            set { _PageSize = value; }
        }

        public bool ShowSearchWordOnly
        {
            get { return _ShowSearchWordOnly; }
            set { _ShowSearchWordOnly = value; }
        }

       

        public string SubPath
            
        {
            get
            { return _SubPath; }
            set {
                _SubPath = value;
            }
        }
        public string RootTitle //id waaronder de pagina's opgeslagen worden.
        {
            get
            {
                if (string.IsNullOrEmpty(_RootTitle))
                {
                    try
                    {
                        _RootTitle = "Titel onbekend";
                        try
                        {
                            string siteurl = ConfigurationManager.AppSettings["TranslatePathTo"].ToString();
                            if (siteurl.EndsWith("/"))
                            {
                                siteurl = siteurl.Substring(0, siteurl.Length - 1);
                            }
                            if (SubPath != "")
                            {
                                siteurl += "/" + SubPath;
                            }
                            
                            NwPublishedContent oContent = new NwPublishedContent("MSSql", ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

                            oContent.GetNwPublishedContentByNwPublishedContentIsPageNwPublishedContentUrlNwPublishedXsltIdItemOnline(true, siteurl, XsltId.ToString(), true);


                            _RootTitle ="- " + oContent.NwPublishedContent.Substring(oContent.NwPublishedContent.IndexOf("Title=\"") + 7, oContent.NwPublishedContent.IndexOf("\"", oContent.NwPublishedContent.IndexOf("Title=\"") + 9) - oContent.NwPublishedContent.IndexOf("Title=\"") - 7);
                        }
                        catch
                        {


                        }
                    }
                    catch (Exception ex)
                    {

                    }
                }
                return _RootTitle;
            }
        }
        public int XsltId //id waaronder de pagina's opgeslagen worden.
        {
            get
            {
                if (string.IsNullOrEmpty(_XsltName))
                {
                    try
                    {
                        _XsltName = ConfigurationManager.AppSettings["xslt"].ToString();
                        NwPublishedXslt oXslt = new NwPublishedXslt("MSSql", ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);
                        oXslt.GetNwPublishedXsltByNwPublishedXsltFilename(_XsltName);
                        _XsltId = oXslt.NwPublishedXsltId;
                    }
                    catch (Exception ex)
                    {

                    }
                }
                return _XsltId;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //if there was search by the global searchbox generated bij Netwriter
            //then Request["zoek_trefwoord"] has a value

            if (Session["SearchText"] != null & this.IsPostBack == false)
            {
                string searchwordssession = Session["SearchText"].ToString();
                Session["SearchText"] = null;
                if (!string.IsNullOrEmpty(searchwordssession))
                {
                    //set value of the freesearch text with the searchwords from Request["zoek_trefwoord"]
                    txtSearch.Text = searchwordssession;
                    //search
                    BindGrid();
                }
            }
            if (Request["zoekterm"] != null & this.IsPostBack==false)
            {
                string searchwords = Request["zoekterm"];

                if (!string.IsNullOrEmpty(searchwords))
                {
                    //set value of the freesearch text with the searchwords from Request["zoek_trefwoord"]
                    txtSearch.Text = searchwords;
                    //search
                    BindGrid();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            BindGrid();   
        }
        /// <summary>
        /// Handels the sorting event of the grvZoekResultaten
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grvResult_Sorting(object sender, GridViewSortEventArgs e)
        {
            SortGridView(e.SortExpression);
        }
        /// <summary>
        /// Handels the Command event of the sortbutton. This button was added in the onrowcreate event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSort_Command(object sender, CommandEventArgs e)
        {
            SortGridView(e.CommandArgument.ToString());
        }
        /// <summary>
        /// Sorts the grid on one column
        /// </summary>
        /// <param name="sortExpression">sortExpression of the column that has to be sorted</param>
        protected void SortGridView(String sortExpression)
        {
            BindGrid();
            DataTable dat = grvResult.DataSource as DataTable;

            if (dat != null)
            {
                String direction = ConvertSortDirectionToSql(sortExpression);
                //sort the dataview
                dat.DefaultView.Sort = sortExpression + " " + direction;

                grvResult.DataSource = dat;
                grvResult.DataBind();
            }
        }
        /// <summary>
        /// Convert the GridViewSortEventArgs.SortDirection to a SQL sortdirection
        /// </summary>
        /// <param name="sortDirection"></param>
        /// <returns></returns>
        private string ConvertSortDirectionToSql(String column)
        {
            // By default, set the sort direction to ascending.
            string sortDirection = "ASC";

            // Retrieve the last column that was sorted.
            string sortExpression = ViewState["SortExpression"] as string;

            if (sortExpression != null)
            {
                // Check if the same column is being sorted.
                // Otherwise, the default value can be returned.
                if (sortExpression == column)
                {
                    string lastDirection = ViewState["SortDirection"] as string;
                    if ((lastDirection != null) && (lastDirection == "ASC"))
                    {
                        sortDirection = "DESC";
                    }
                }
            }

            // Save new values in ViewState.
            ViewState["SortDirection"] = sortDirection;
            ViewState["SortExpression"] = column;

            return sortDirection;
        }
        protected void grvResult_SelectedIndexChanged(object sender, EventArgs e)
        { }

        protected void grvResult_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            ChangePageIndex(e.NewPageIndex);
        }
        /// <summary>
        /// Deze method zet the pageindex van het gridview en roept de bindGrid() method aan om het grid opnieuw te binden
        /// </summary>
        /// <param name="index"></param>
        protected void ChangePageIndex(int index)
        {
            try
            {
                try
                {
                    grvResult.PageIndex = index;
                }
                catch
                {
                    grvResult.PageIndex = 0;
                }
                BindGrid();
            }
            catch (Exception ex)
            {

            }
        }

        public void BindGrid()
        {
               SearchOption option;
            if (chbFreeSearchEqual.Checked)
            {
                option = new SearchOption(SeachOptionType.FreeSearch, txtSearch.Text, SeachType.Equal);
               
            }
            else
            {
                option = new SearchOption(SeachOptionType.FreeSearch, txtSearch.Text, SeachType.Like);
               
            }
            DataTable dat = SearchSite(option);
            grvResult.Caption = dat.Rows.Count + " gevonden pagina's";

            if (dat.Rows.Count > 0)
            {
                dat = UpdateUrlsAndTitles(dat);

                txtMessage.Text = "";
            }
            else
            {
                txtMessage.Text = "Er zijn geen pagina's gevonden.";
            }
            grvResult.DataSource = dat;
            grvResult.DataBind();
        }


      
        private DataTable UpdateUrlsAndTitles(DataTable dat)
        {

            // dit stuk mag er uit is overbodig er staat gewoon een label in de database!!!!
            foreach (DataRow row in dat.Rows)
            {
                string url = row["content_url"].ToString();
      
                string Label="Titel onbekend";
                try
                {
                    NwPublishedContent oContent = new NwPublishedContent("MSSql", ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

                    oContent.GetNwPublishedContentByNwPublishedContentIsPageNwPublishedContentUrlNwPublishedXsltIdItemOnline(true, url, XsltId.ToString(), true);


                    Label = oContent.NwPublishedContent.Substring(oContent.NwPublishedContent.IndexOf("Title=\"") + 7, oContent.NwPublishedContent.IndexOf("\"", oContent.NwPublishedContent.IndexOf("Title=\"") + 9) - oContent.NwPublishedContent.IndexOf("Title=\"") - 7).Replace(RootTitle, ""); ;
                }
                catch 
                {
                    
                  
                }
                     row["naam"] = Label;
                if (Request.QueryString.ToString().ToLower().IndexOf("netwritergui") > -1)
                {
                    url = String.Format("/NetwriterGui/publication/cms.aspx?ObjectId={0}&ObjectTypeId={1}", 0, 0);
                }
                else
                {
                    //add "/" so the helicon can put default.aspx behind the url
                    if (ConfigurationManager.AppSettings["TranslatePathFrom"].ToString() != "/")
                    {
                        url = url.Replace(ConfigurationManager.AppSettings["TranslatePathTo"].ToString(), ConfigurationManager.AppSettings["TranslatePathFrom"].ToString()) + "/";
                    }
                    else
                    {
                        url = url.Replace(ConfigurationManager.AppSettings["TranslatePathTo"].ToString(), "") + "/";
                    }
                    
                }

                row["content_url"] = url;
                
                row.AcceptChanges();
            }

            return dat;
        }

        protected void grvResult_PreRender(object sender, EventArgs e)
        {
            if (grvResult.Rows.Count > 0)
            {
                grvResult.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
       
        public string SearchSiteProcedure {
            get {
                if (string.IsNullOrEmpty(_SearchSiteProcedure))
                {
                    return cstrSearchSite;
                }
                else
                {
                    return _SearchSiteProcedure;
                }
            }
            set { _SearchSiteProcedure = value; }
        }
        private DataTable SearchSite(SearchOption option)
        {
            string freeSearch =  GetFreeSearch(option);
                            
                      DataSet set = new DataSet();
            try
            {
                
                SqlParameter[] parameters = new SqlParameter[2];
                parameters[0] = new SqlParameter(cstrParFreeSearch, SqlDbType.NVarChar, 250);
                             parameters[0].Value = string.IsNullOrEmpty(freeSearch) ? (object)DBNull.Value : freeSearch;
                             parameters[1] = new SqlParameter(cstrParSiteUrl, SqlDbType.NVarChar, 250);
                             string siteurl = ConfigurationManager.AppSettings["TranslatePathTo"].ToString();
                             if (siteurl.EndsWith("/"))
                             {
                                 siteurl = siteurl.Substring(0, siteurl.Length - 1);
                             }
                if (SubPath!="")
                {
                    siteurl+="/"+SubPath;
                }
                             parameters[1].Value = siteurl;
                             set = SqlHelper.ExecuteQueryProcedure(SearchSiteProcedure, parameters);
            }
            catch (Exception searchException)
            {
            }

            if (set.Tables.Count > 0)
            {
                return set.Tables[0];
            }
            else
            {
                return new DataTable();
            }
        }
      

         /// <summary>
        /// Method to convert the value of the freetext searchoption to a sql searchstring
        /// </summary>
        /// <param name="option">freetext searchoption</param>
        /// <returns>string for freetext search in the database</returns>
        private static string GetFreeSearch(SearchOption option)
        {
            string freesearchstring="";
            if (!string.IsNullOrEmpty(option.value))
            {
                string splitpattern = "(?:\")(.*?)(?:\")|([^\\s,]+)";
                Regex _regex = new Regex(splitpattern);
                // bouw de zoekcriteria
                List<string> criteria = new List<string>();
                Match ma = _regex.Match(option.value);
                while (ma.Success)
                {
                    Group g = ma.Groups[1];
                    try
                    {
                        string sSearchItem = string.Empty;
                        if (g.Success) // een woordcombinatie tussen ""
                        {
                            sSearchItem = g.Value;
                        }
                        g = ma.Groups[2];
                        if (g.Success) // een los woord
                        {
                            sSearchItem = g.Value;
                            if (option.searchtype == SeachType.Like)
                            {
                                sSearchItem += "*";
                            }
                        }

                        if (string.IsNullOrEmpty(freesearchstring))
                        {
                            freesearchstring = sSearchItem;
                        }
                        else
                        {

                            freesearchstring += "\" AND \"" + sSearchItem;
                        }
                    }
                    catch (Exception ee)
                    {
                    }
                    ma = ma.NextMatch();
                }
                freesearchstring = "\"" + freesearchstring + "\"";
            }
            return freesearchstring;
        }
    }
    /// <summary>
    /// SearchOptionType of the search options
    /// </summary>
    public enum SeachOptionType
    {
        Organization,
        Owner,
        Administrator,
        Financier,
        User,
        Years,
        Respondent,
        Sector,
        SubSector,
        UsedInProduct,
        LegalBasis,
        GeoCovering,
        FreeSearch
    }

     /// <summary>
    /// SearchOptionType of the search options
    /// </summary>
    public enum SeachOptionMode
    {
        Or,
        And
    }
    /// <summary>
    /// SearchType of the search options
    /// </summary>
    public enum SeachType
    {
        Equal,
        Like
    }
    /// <summary>
    /// SearchOption
    /// </summary>
    [Serializable()]
    public struct SearchOption
    {
        public SeachOptionType optiontype;
        public string value;
        public SeachType searchtype;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="sot">SeachOptionType</param>
        /// <param name="val">string value</param>
        public SearchOption(SeachOptionType sot, string val)
        {
            optiontype = sot;
            value = val;
            searchtype = SeachType.Equal;
        }

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="sot">SeachOptionType</param>
        /// <param name="val">string value</param>
        /// <param name="st">SeachType of the option</param>
        public SearchOption(SeachOptionType sot, string val, SeachType st)
        {
            optiontype = sot;
            value = val;
            searchtype = st;
        }
    }
}
