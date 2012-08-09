using System;
using System.Collections;
using System.Configuration;
using System.Data;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
//using System.Xml.Linq;

namespace VTVSites
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            // Fires when the application is started
            if (this.Context.Cache["oUlrsHash"] == null)
                this.Context.Cache.Insert("oUlrsHash", new Hashtable());
            else if (Request["ClearoUrlsCache"] == "true")
                this.Context.Cache["oUlrsHash"] = new Hashtable();

            Hashtable oHash = this.Context.Cache["oUlrsHash"] as Hashtable;
            System.Web.Hosting.HostingEnvironment.RegisterVirtualPathProvider(new RIVM.NetWriter.NetWriterSiteComponents.NWVirtualPathProvider(ref oHash));
           // System.Web.Hosting.HostingEnvironment.RegisterVirtualPathProvider(new VTVVirtualPathProvider());
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            //Fires upon attempting to authenticate the use
            //Wordt aangeroepen (afgevuurd) op het moment dat een poging gedaan wordt de gebruiker te authenticeren
            RIVM.NetWriter.NetWriterSiteComponents.GlobalHandler oHandler = new RIVM.NetWriter.NetWriterSiteComponents.GlobalHandler();
            oHandler.Application_AuthenticateRequest(HttpContext.Current.User, Request.ServerVariables["REMOTE_HOST"]);
            Context.User = oHandler.User;
            System.Threading.Thread.CurrentPrincipal = oHandler.User;
        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}