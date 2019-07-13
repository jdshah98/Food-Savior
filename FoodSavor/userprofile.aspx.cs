using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace FoodSavor
{
	public partial class userprofile : System.Web.UI.Page
	{
		SqlConnection con;
		SqlDataAdapter sda;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.Cookies["user"] != null)
			{
				if (Request.Cookies["user"]["usertype"].Equals("ngo"))
					Response.Redirect("NgoPage.aspx");
			}
			else
			{
				Response.Redirect("Default.aspx");
			}
			con = new SqlConnection();
			con.ConnectionString = WebConfigurationManager.ConnectionStrings["foodcon"].ConnectionString;
			if (con.State != ConnectionState.Open)
			{
				con.Open();
			}
			sda = new SqlDataAdapter("select * from donation where status like 'true' and display like 'true' and email like '" + Request.Cookies["user"]["email"] + "'", con);
			DataSet ds = new DataSet();
			sda.Fill(ds);
			request_layout.DataSource = ds.Tables[0];
			request_layout.DataBind();
		}
	}
}