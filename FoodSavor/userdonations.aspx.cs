using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodSavor
{
	public partial class userdonations : System.Web.UI.Page
	{
		SqlConnection con;
		SqlDataAdapter sda;
		SqlCommand cmd;

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
			if (!IsPostBack)
			{
				loaddata();
			}
		}

		private void loaddata()
		{
			sda = new SqlDataAdapter("select * from donation where email like '" + Request.Cookies["user"]["email"] + "'", con);
			DataSet ds = new DataSet();
			sda.Fill(ds);
			request_layout.DataSource = ds.Tables[0];
			request_layout.DataBind();
		}

		protected void request_layout_ItemCreated(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
		{
			//Response.Write("<script>console.log('Created')</script>");
		}

		protected void request_layout_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
		{
			if (e.CommandName == "delete")
			{
				//String name = ((Label)e.Item.FindControl("username")).Text;
				//Response.Write("<script>console.log('" + name + "')</script>");
				String email = ((Label)e.Item.FindControl("email")).Text.Substring(7);
				String dt = ((Label)e.Item.FindControl("date_time")).Text;
				cmd = new SqlCommand();
				cmd.Connection = con;
				cmd.CommandType = CommandType.Text;
				String query = "delete from donation where email like '" + email + "' and datetime like '" + dt + "'";
				cmd.CommandText = query;
				if (cmd.ExecuteNonQuery() > 0)
				{
					Response.Redirect("UserPage.aspx");
				}
				else
				{
					Response.Write("<script>console.log(" + "\"" + query + "\"" + ")</script>");
					Response.Write("<script>alert('Request Failed to Submit')</script>");
				}
			}
		}
	}
}