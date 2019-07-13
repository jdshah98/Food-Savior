using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace FoodSavor
{
	public partial class NgoPage : System.Web.UI.Page
	{
		SqlConnection con;
		SqlCommand cmd;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.Cookies["user"] != null)
			{
				if (Request.Cookies["user"]["usertype"].Equals("customer"))
				{
					Response.Redirect("UserPage.aspx");
				}
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
		}

		protected void request_Click(object sender, EventArgs e)
		{
			Response.Redirect("request.aspx");
		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			string name, email, comment;
			name = nametext.Text.Trim();
			email = emailtext.Text.Trim();
			comment = commenttext.Text.Trim();
			if (name.Length!=0 && email.Length!=0 && comment.Length != 0)
			{
				cmd = new SqlCommand();
				cmd.Connection = con;
				cmd.CommandType = CommandType.Text;
				cmd.CommandText = "insert into feedback(name,email,comment) values('" +
					name + "','" + email + "','" + comment + "')";
				if (cmd.ExecuteNonQuery() > 0)
				{
					Response.Write("<script>alert('Feedback Recorded Successfully')</script>");
				}
				else
				{
					Response.Write("<script>alert('Feedback Failed to Submit')</script>");
				}
			}
			else
			{
				Response.Write("<script>alert('Fill Details')</script>");
			}
			con.Close();
		}
	}
}