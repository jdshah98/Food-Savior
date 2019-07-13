using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;

namespace FoodSavor
{
	public partial class signup : System.Web.UI.Page
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
				if(Request.Cookies["user"]["usertype"].Equals("customer"))
					Response.Redirect("~/UserPage.aspx");
				else
					Response.Redirect("~/NgoPage.aspx");
			}
			con = new SqlConnection();
			con.ConnectionString = WebConfigurationManager.ConnectionStrings["foodcon"].ConnectionString;
			if (con.State != ConnectionState.Open)
			{
				con.Open();
			}
			if (!IsPostBack)
			{
				reg_fname_text.Focus();
				BindCity();
				BindState();
			}
		}

		private void BindCity()
		{
			sda = new SqlDataAdapter("select * from citydata", con);
			ds = new DataSet();
			sda.Fill(ds);
			reg_city_list.DataSource = ds.Tables[0];
			reg_city_list.DataTextField = ds.Tables[0].Columns[1].ToString();
			reg_city_list.DataValueField = ds.Tables[0].Columns[1].ToString();
			reg_city_list.DataBind();
			ds.Clear();
		}

		private void BindState()
		{
			sda = new SqlDataAdapter("select * from statedata", con);
			ds = new DataSet();
			sda.Fill(ds);
			reg_state_list.DataSource = ds.Tables[0];
			reg_state_list.DataTextField = ds.Tables[0].Columns[1].ToString();
			reg_state_list.DataValueField = ds.Tables[0].Columns[1].ToString();
			reg_state_list.DataBind();
			ds.Clear();
		}

		protected void signupBtn_Click(object sender, EventArgs e)
		{
			string fname, lname, rname, email, mobile, password, address, city, state;
			fname = reg_fname_text.Text.Trim();
			lname = reg_lname_text.Text.Trim();
			rname = reg_rname_text.Text.Trim();
			email = reg_email_text.Text.Trim();
			mobile = reg_mobile_text.Text.Trim();
			password = reg_pass_text.Text.Trim();
			address = reg_address_text.Text.Trim();
			if (rname.Length != 0)
			{
				city = reg_city_list.Text;
				state = reg_state_list.Text;
			}
			else
			{
				city = "";
				state = "";
			}

			reg_email_exist.Visible = false;
			reg_mobile_exist.Visible = false;

			cmd = new SqlCommand();
			cmd.Connection = con;
			cmd.CommandType = CommandType.Text;
			cmd.CommandText = "select * from customer where email like '" + email + "' or mobile like '" + mobile + "'";
			sdr = cmd.ExecuteReader();

			if (sdr.HasRows)
			{
				while (sdr.Read())
				{
					if (sdr.GetValue(4).Equals(email))
					{
						reg_email_exist.Visible = true;
					}
					if (sdr.GetValue(5).Equals(mobile))
					{
						reg_mobile_exist.Visible = true;
					}
				}
			}
			else
			{
				sdr.Close();
				cmd = new SqlCommand();
				cmd.Connection = con;
				cmd.CommandType = CommandType.Text;
				cmd.CommandText = "insert into customer(fname,lname,rname,email,mobile,password,address,city,state) " +
					"values('" + fname + "','" + lname + "','" + rname + "','" + email + "','" + mobile + "','" + password + "','" + address + "','" + city + "','" + state + "')";
				if (cmd.ExecuteNonQuery() > 0)
				{
					HttpCookie cookie = new HttpCookie("user");
					cookie["usertype"] = "customer";
					if (rname.Equals(""))
						cookie["username"] = lname + " " + fname;
					else
						cookie["username"] = rname;
					cookie["email"] = email;
					cookie["mobile"] = mobile;
					cookie.Expires = DateTime.Now.AddDays(30);
					Response.Cookies.Add(cookie);
					Response.Redirect("UserPage.aspx");
				}
				else
				{
					Response.Write("<script>alert('Registeration Failed')</script>");
				}
			}
			con.Close();
		}
	}
}