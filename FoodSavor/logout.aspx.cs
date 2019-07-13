using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodSavor
{
	public partial class logout : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.Cookies["user"] != null)
			{
				HttpCookie cookie = Request.Cookies["user"];
				cookie.Expires = DateTime.Now.AddDays(-30);
				Response.Cookies.Add(cookie);
				Response.Redirect("Default.aspx");
			}
			else
			{
				Response.Redirect("Default.aspx");
			}
		}
	}
}