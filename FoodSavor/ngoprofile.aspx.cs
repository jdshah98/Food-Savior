using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodSavor
{
	public partial class ngoprofile : System.Web.UI.Page
	{
		SqlConnection con;
		SqlCommand cmd;
		SqlDataAdapter sda;
		
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.Cookies["user"] != null)
			{
				if (Request.Cookies["user"]["usertype"].Equals("customer"))
					Response.Redirect("UserPage.aspx");
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
			if (!IsPostBack)
			{
				loaddata();
			}
		}

		private void loaddata()
		{
			sda = new SqlDataAdapter("select * from donation where status like 'true' and display like 'true' and ngoemail like '" + Request.Cookies["user"]["email"] + "'", con);
			DataSet ds = new DataSet();
			sda.Fill(ds);
			request_layout.DataSource = ds.Tables[0];
			request_layout.DataBind();
		}

		protected void request_layout_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			if(e.CommandName == "reject")
			{
				String email = ((Label)e.Item.FindControl("email")).Text.Substring(7);
				String dt = ((Label)e.Item.FindControl("date_time")).Text;
				cmd = new SqlCommand();
				cmd.Connection = con;
				cmd.CommandType = CommandType.Text;
				String query = "update donation set status = 'false', ngoemail = '', ngoname = '',ngocontact = '',acceptTime = '' where email like '" + email + "' and datetime like '" + dt + "'";
				cmd.CommandText = query;
				if (cmd.ExecuteNonQuery() > 0)
				{
					Response.Redirect("NgoPage.aspx");
				}
				else
				{
					Response.Write("<script>console.log(" + "\"" + query + "\"" + ")</script>");
					Response.Write("<script>alert('Request Failed to Submit')</script>");
				}
			}
		}

		protected void request_layout_ItemCreated(object sender, RepeaterItemEventArgs e)
		{

		}
	}
}