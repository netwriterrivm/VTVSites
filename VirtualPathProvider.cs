using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Hosting;
using System.Web.Caching;
using RIVM.NetWriter.BusinessObjects.Publish.Database;

namespace VTVSites
{
    public class VTVVirtualPathProvider : VirtualPathProvider
    {
        public VTVVirtualPathProvider()
            : base()
        {


        }
        public override string GetFileHash(string virtualPath, System.Collections.IEnumerable virtualPathDependencies)
        {
            // Return a hash value based on the virtualPathDependencies
            // For unhandled dependencies, create a list of these, then defer to the Previous to
            // get it's hash and combine with this hash value
            if (isPathVirtual(virtualPath))
            {
                return Guid.NewGuid().ToString(); //onze files altijd uit de database ophalen. LET OP, cachen is ook mogelijk!!!!
            }
            else
            {
                return base.GetFileHash(virtualPath, virtualPathDependencies);
            }

        }

        public override CacheDependency GetCacheDependency(string virtualPath, IEnumerable virtualPathDependencies, System.DateTime utcStart)
        {
            // If the custom virtual path provider handles the path or dependency and it can
            // create a CahceDependency create on and combine with that from the Previous
            // If the provider cannot create a cacheDependency and it handles one of the
            // dependencies, return null
            if (isPathVirtual(virtualPath))
            {
                return null;  // Dit zorgt ervoor dat er niet gecached wordt.
            }
            else
            {
                return Previous.GetCacheDependency(virtualPath, virtualPathDependencies, utcStart);
            }

        }

        public override bool FileExists(string virtualPath)
        {
            // If the custom virtual path provider handles the virtualPath and 
            // it exists return true, otherwise defer to Previous
            // is de file van ons?
            if (isPathVirtual(virtualPath))
            {
                return true;
            }
            else
            {
                return Previous.FileExists(virtualPath);
            }

            //End If
        }

        public override bool DirectoryExists(string virtualDir)
        {
            // If the custom virtual path provider handles the virtualDir and 
            // it exists return true, otherwise defer to Previous
            // we doen niet aan folders
            return Previous.DirectoryExists(virtualDir);
        }
        private string _XsltName;
        private int _XsltId;
        private int _CssXsltId;
        public int CssXsltId //id waaronder de pagina's opgeslagen worden.
        {
            get
            {
                if (string.IsNullOrEmpty(_XsltName))
                {
                    try
                    {
                        string sCssXsltId = ConfigurationManager.AppSettings["cssxslt"].ToString();
                        NwPublishedXslt oXslt = new NwPublishedXslt("MSSql", this.ConnectionString);
                        oXslt.GetNwPublishedXsltByNwPublishedXsltFilename(sCssXsltId);
                        _CssXsltId = oXslt.NwPublishedXsltId;
                    }
                    catch (Exception ex)
                    {

                    }
                }
                return _CssXsltId;
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
                        NwPublishedXslt oXslt = new NwPublishedXslt("MSSql", this.ConnectionString);
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
        int _MapXsltId = 0;
        public int MapXsltId //id waaronder de pagina's opgeslagen worden.
        {
            get
            {

                if (_MapXsltId == 0)
                {
                    try
                    {
                        string sXSLTName = "/VTVSites/xslttransform/page/zorgatlas.contentplaceholders.xslt";
                        NwPublishedXslt oXslt = new NwPublishedXslt("MSSql", this.ConnectionString);
                        oXslt.GetNwPublishedXsltByNwPublishedXsltFilename(sXSLTName);
                        _MapXsltId = oXslt.NwPublishedXsltId;
                    }
                    catch (Exception ex)
                    {
                        _MapXsltId = -1;
                    }
                }
                return _MapXsltId;
            }
        }
        private string _sConnectionString;
        ///database meuk
        public string ConnectionString
        {
            get
            {
                if (string.IsNullOrEmpty(_sConnectionString))
                {
                    try
                    {
                        _sConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                    }
                    catch (Exception ex)
                    {

                    }
                }
                return _sConnectionString;
            }
        }
        public override VirtualDirectory GetDirectory(string virtualDir)
        {
            // If the custom virtual path provider handles the virtualDir and 
            // it exists return true, otherwise defer to Previous
            //  If Previous.DirectoryExists(virtualDir) Then
            return Previous.GetDirectory(virtualDir);
            //     Else
            //   Return Previous.GetDirectory("/")
            // End If
        }
        Hashtable oUrls = new Hashtable();
        /// <summary>
        /// Geeft aan of het pad Door NetWriter uit de database opgehaald kan worden.
        /// </summary>
        /// <param name="virtualPath"></param>
        /// <returns></returns>
        private bool isPathVirtual(string virtualPath)
        {
            // om de performance te verbeteren wordt maar één keer in de database gekeken of een pad van ons is.
            // statische of andere bestanden belemmeren de performance zo niet.
            bool pathIsVirtual = false; // standaard van iemand anders
            if (oUrls.ContainsKey(virtualPath))
            {
                // al een keertje gecheckt blijkbaar
                pathIsVirtual = (bool)oUrls[virtualPath];
            }
            else
            {
                try
                {
                    //is het een afbeelding uit de binary tabel??
                    string[] sBinFolders = ConfigurationManager.AppSettings["ObjectBinaryFolder"].ToString().Split(',');
                    foreach (string sBinFolder in sBinFolders)
                    {
                        if (virtualPath.Contains(sBinFolder))
                        {
                            //ja, kijken of we hem kunnen vinden, zo ja toevoegen aan hashtable
                            NwPublishedObjectBinary oBinary = new NwPublishedObjectBinary("MSSql", this.ConnectionString);
                            string sBinaryURL = sBinFolder + virtualPath.Substring(virtualPath.IndexOf(sBinFolder) - 1 + sBinFolder.Length + 1);
                            oBinary.GetNwPublishedObjectBinaryByNwPublishedObjectBinaryUrlItemOnline(sBinaryURL, true);
                            oUrls.Add(virtualPath, true);
                            pathIsVirtual = true;
                            break;
                        }
                    }
                    if (pathIsVirtual == false) // nog niet gevonden als binary folder
                    {

                        //is het een gepubliceerde pagina?
                        NwPublishedContent oContent = new NwPublishedContent("MSSql", this.ConnectionString);
                        //string sUrl = virtualPath.Replace(ConfigurationManager.AppSettings["TranslatePathFrom"].ToString(), ConfigurationManager.AppSettings["TranslatePathTo"].ToString());
                        string sUrl = virtualPath.ToLower();
                        if (ConfigurationManager.AppSettings["TranslatePathFrom"].ToString() == "/")
                        {
                            sUrl = ConfigurationManager.AppSettings["TranslatePathTo"].ToString() + sUrl.Replace("/default.aspx", "");
                        }
                        else
                        {
                            sUrl = sUrl.Replace(ConfigurationManager.AppSettings["TranslatePathFrom"].ToString(), ConfigurationManager.AppSettings["TranslatePathTo"].ToString()).Replace("/default.aspx", "");
                        }
                        if (sUrl.Substring(sUrl.Length - 1, 1) == "/")
                        {
                            sUrl = sUrl.Substring(0, sUrl.Length - 1);
                        }
                        if (sUrl.EndsWith("generated_css_site_xml.css"))
                        {
                            sUrl = sUrl.Substring(0, sUrl.LastIndexOf("generated_css_site_xml.css") - 1);
                            // to string mag binnenkort weg
                            oContent.GetNwPublishedContentByNwPublishedContentIsPageNwPublishedContentUrlNwPublishedXsltIdItemOnline(true, sUrl, this.CssXsltId.ToString(), true);
                        }
                        else
                        {
                            if (sUrl.EndsWith("mapindex.aspx"))
                            {
                                sUrl = sUrl.Substring(0, sUrl.LastIndexOf("mapindex.aspx") - 1);
                                // to string mag binnenkort weg
                                oContent.GetNwPublishedContentByNwPublishedContentIsPageNwPublishedContentUrlNwPublishedXsltIdItemOnline(true, sUrl, this.MapXsltId.ToString(), true);
                            }
                            else
                            {
                                // to string mag binnenkort weg
                                oContent.GetNwPublishedContentByNwPublishedContentIsPageNwPublishedContentUrlNwPublishedXsltIdItemOnline(true, sUrl, this.XsltId.ToString(), true);
                            }
                        }

                        oUrls.Add(virtualPath, true);
                        pathIsVirtual = true;
                    }

                }
                catch (Exception ex)
                {
                    //ai, we kennen hem niet, dan snel markeren als zijnde van iemand anders.
                    //dat scheelt weer een aantal maal fouten afvangen....
                    oUrls.Add(virtualPath, false);
                }


            }
            return pathIsVirtual;
        }

        public override VirtualFile GetFile(string virtualPath)
        {
            // If the custom virtual path provider handles the virtualPath and 
            // it exists then create a custom VirtualFile and return, otherwise defer to Previous
            // VirtualFile implements an Open method to return a Stream

            if (isPathVirtual(virtualPath)) //file van ons, dan terug geven uit de database
            {
                if (virtualPath.EndsWith("mapindex.aspx"))
                {
                    return new NetWriterVirtualFile(virtualPath, this.ConnectionString, this.XsltId, this.MapXsltId);
                }
                else
                {
                    return new NetWriterVirtualFile(virtualPath, this.ConnectionString, this.XsltId, 0);
                }

            }
            else
            {
                return Previous.GetFile(virtualPath);
            }
        }
        
        /// <summary>
        /// 
        /// </summary>
        /// <remarks>Geneste class omdat ...</remarks>
        public sealed class NetWriterVirtualFile : VirtualFile
        {

            private string _virtualPath;
            private string _sConn;
            private int _XsltId;
            private int _MapXsltId;
            public NetWriterVirtualFile(string virtualPath, string sConn, int XsltId, int MapXsltId)
                : base(virtualPath)
            {
                _virtualPath = virtualPath;
                _sConn = sConn;
                _XsltId = XsltId;
                _MapXsltId = MapXsltId;
            }
            public override System.IO.Stream Open()
            {

                string sContent = "";
                try
                {
                    
                    string[] sBinFolders = ConfigurationManager.AppSettings["ObjectBinaryFolder"].ToString().Split(',');
                    // binary folders doorlopen
                    foreach (string sBinFolder in sBinFolders)
                    {
                        if (_virtualPath.Contains(sBinFolder))
                        {
                            //binary ophalen en terug geven
                            NwPublishedObjectBinary oBinary = new NwPublishedObjectBinary("MSSql", this._sConn);
                            string sBinaryURL = sBinFolder + _virtualPath.Substring(_virtualPath.IndexOf(sBinFolder) - 1 + sBinFolder.Length + 1); oBinary.GetNwPublishedObjectBinaryByNwPublishedObjectBinaryUrlItemOnline(sBinaryURL, true);

                            return new System.IO.MemoryStream(oBinary.NwPublishedObjectBinary);

                        }
                    }
                    
                    
                        //is het een pagina? Content ophalen en terug geven.
                        NwPublishedContent oContent = new NwPublishedContent("MSSql", _sConn);
                        //string sUrl = _virtualPath.ToLower().Replace(ConfigurationManager.AppSettings["TranslatePathFrom"].ToString(), ConfigurationManager.AppSettings["TranslatePathTo"].ToString()).Replace("/default.aspx", "");
                        string sUrl = _virtualPath.ToLower();
                        if (ConfigurationManager.AppSettings["TranslatePathFrom"].ToString() == "/")
                        {
                            sUrl = ConfigurationManager.AppSettings["TranslatePathTo"].ToString() + sUrl.Replace("/default.aspx", "");
                        }
                        else
                        {
                            sUrl = sUrl.Replace(ConfigurationManager.AppSettings["TranslatePathFrom"].ToString(), ConfigurationManager.AppSettings["TranslatePathTo"].ToString()).Replace("/default.aspx", "");
                        }
                        if (sUrl.Substring(sUrl.Length - 1, 1) == "/")
                        {
                            sUrl = sUrl.Substring(0, sUrl.Length - 1);
                        }
                        // to string mag binnenkort weg
                        if (sUrl.EndsWith("mapindex.aspx"))
                        {
                            sUrl = sUrl.Substring(0, sUrl.LastIndexOf("mapindex.aspx") - 1);
                            // to string mag binnenkort weg
                            oContent.GetNwPublishedContentByNwPublishedContentIsPageNwPublishedContentUrlNwPublishedXsltIdItemOnline(true, sUrl, _MapXsltId.ToString(), true);
                        }
                        else
                        {
                            // to string mag binnenkort weg
                            oContent.GetNwPublishedContentByNwPublishedContentIsPageNwPublishedContentUrlNwPublishedXsltIdItemOnline(true, sUrl, _XsltId.ToString(), true);
                        }
                        sContent = oContent.NwPublishedContent;
                        return new System.IO.MemoryStream(System.Text.Encoding.UTF8.GetBytes(sContent));
                    

                }
                catch (Exception ex)
                {

                    // fout, dan maar fout teruggeven
                    return new System.IO.MemoryStream(System.Text.Encoding.UTF8.GetBytes(ex.Message));
                }
            }
        }
    }
}


