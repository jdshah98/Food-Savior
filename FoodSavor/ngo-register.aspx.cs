using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Configuration;

namespace FoodSavor
{
    public partial class ngo_register : System.Web.UI.Page
    {
		SqlConnection con;
		SqlDataReader sdr;
		SqlDataAdapter sda;
		SqlCommand cmd;
		DataSet ds;

		protected void Page_Load(object sender, EventArgs e)
        {
			if (Request.Cookies["user"] != null)
			{
				if (Request.Cookies["user"]["usertype"].Equals("customer"))
					Response.Redirect("UserPage.aspx");
				else
					Response.Redirect("NgoPage.aspx");
			}
			con = new SqlConnection();
			con.ConnectionString = WebConfigurationManager.ConnectionStrings["foodcon"].ConnectionString;
			if (con.State != ConnectionState.Open)
			{
				con.Open();
			}
			if (!IsPostBack)
			{
				ngo_name_text.Focus();
				BindCity();
				BindState();
			}
		}

		private void BindCity()
		{
			sda = new SqlDataAdapter("select * from citydata", con);
			ds = new DataSet();
			sda.Fill(ds);
			ngo_city_list.DataSource = ds.Tables[0];
			ngo_city_list.DataTextField = ds.Tables[0].Columns[1].ToString();
			ngo_city_list.DataValueField = ds.Tables[0].Columns[1].ToString();
			ngo_city_list.DataBind();
			ds.Clear();
		}

		private void BindState()
		{
			sda = new SqlDataAdapter("select * from statedata", con);
			ds = new DataSet();
			sda.Fill(ds);
			ngo_state_list.DataSource = ds.Tables[0];
			ngo_state_list.DataTextField = ds.Tables[0].Columns[1].ToString();
			ngo_state_list.DataValueField = ds.Tables[0].Columns[1].ToString();
			ngo_state_list.DataBind();
			ds.Clear();
		}

		protected void ngosignupBtn_Click(object sender, EventArgs e)
		{
			string orgname, mdname, email, mobile, password, address, path, city, state;
			orgname = ngo_name_text.Text;
			mdname = ngo_mdname_text.Text;
			email = ngo_email_text.Text;
			mobile = ngo_mobile_text.Text;
			password = ngo_pass_text.Text;
			address = ngo_address_text.Text;
			city = ngo_city_list.Text;
			state = ngo_state_list.Text;
			path = Path.GetFileName(ngo_ctf_upload.PostedFile.FileName);
			ngo_ctf_upload.SaveAs(Server.MapPath("~/ngo/") + path);

			ngo_email_exist.Visible = false;
			ngo_mobile_exist.Visible = false;

			cmd = new SqlCommand();
			cmd.Connection = con;
			cmd.CommandType = CommandType.Text;
			cmd.CommandText = "select * from ngo where email like '" + email + "' or mobile like '" + mobile + "'";
			sdr = cmd.ExecuteReader();

			if (sdr.HasRows)
			{
				while (sdr.Read())
				{
					if (sdr.GetValue(3).Equals(email))
					{
						ngo_email_exist.Visible = true;
					}
					if (sdr.GetValue(4).Equals(mobile))
					{
						ngo_mobile_exist.Visible = true;
					}
				}
			}
			else
			{
				sdr.Close();
				cmd = new SqlCommand();
				cmd.Connection = con;
				cmd.CommandType = CommandType.Text;
				cmd.CommandText = "insert into ngo(orgname,name,email,mobile,password,address,city,state,path) " +
					"values('" + orgname + "','" + mdname + "','" + email + "','" + mobile + "','" + password + "','" +
					address + "','" + city + "','" + state + "','" + path + "')";
				if (cmd.ExecuteNonQuery() > 0)
				{
					HttpCookie cookie = new HttpCookie("user");
					cookie["username"] = mdname;
					cookie["email"] = email;
					cookie["mobile"] = mobile;
					cookie["usertype"] = "ngo";
					cookie.Expires = DateTime.Now.AddDays(30);
					Response.Cookies.Add(cookie);
					Response.Redirect("NgoPage.aspx");
				}
				else
				{
					Response.Write("<script>alert('ngo registeration Failed')</script>");
				}
			}
			con.Close();
		}
	}
}