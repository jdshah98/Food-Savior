using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodSavor
{
	public partial class donate : System.Web.UI.Page
	{
		SqlConnection con;
		SqlDataAdapter sda;
		SqlCommand cmd;
		DataSet ds;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.Cookies["user"] != null)
			{
				if (Request.Cookies["user"]["usertype"].Equals("ngo"))
				{
					Response.Redirect("NgoPage.aspx");
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
			if (!IsPostBack)
			{
				donate_weight_text.Focus();
				BindCity();
				BindState();
				cmd = new SqlCommand();
				cmd.Connection = con;
				cmd.CommandType = CommandType.Text;
				cmd.CommandText = "select * from customer where email like '" + Request.Cookies["user"]["email"] + "'";
				SqlDataReader sdr = cmd.ExecuteReader();
				sdr.Read();
				if (sdr.GetString(7).Length!=0)
				{
					donate_address_text.Text = sdr.GetString(7);
					donate_city_list.Text = sdr.GetString(8);
					donate_state_list.Text = sdr.GetString(9);
				}
			}
		}

		private void BindState()
		{
			sda = new SqlDataAdapter("select * from statedata", con);
			ds = new DataSet();
			sda.Fill(ds);
			donate_state_list.DataSource = ds.Tables[0];
			donate_state_list.DataTextField = ds.Tables[0].Columns[1].ToString();
			donate_state_list.DataValueField = ds.Tables[0].Columns[1].ToString();
			donate_state_list.DataBind();
			ds.Clear();
		}

		private void BindCity()
		{
			sda = new SqlDataAdapter("select * from citydata", con);
			ds = new DataSet();
			sda.Fill(ds);
			donate_city_list.DataSource = ds.Tables[0];
			donate_city_list.DataTextField = ds.Tables[0].Columns[1].ToString();
			donate_city_list.DataValueField = ds.Tables[0].Columns[1].ToString();
			donate_city_list.DataBind();
			ds.Clear();
		}

		protected void donateBtn_Click(object sender, EventArgs e)
		{
			string address, city, state, weight, desc, dt,email;
			address = donate_address_text.Text;
			city = donate_city_list.Text;
			state = donate_state_list.Text;
			weight = donate_weight_text.Text;
			desc = donate_desc_text.Text;
			dt = DateTime.Now.ToString();
			//Response.Write("<script>alert('" + dt + "')</script>");
			email = Request.Cookies["user"]["email"];
			cmd = new SqlCommand();
			cmd.Connection = con;
			cmd.CommandType = CommandType.Text;
			cmd.CommandText = "insert into donation(famount,fdesc,address,city,state,datetime,email,mobile,donator,status,display) "+
				"values('" + weight + "','" + desc + "','" + address + "','" + city + "','" + state + 
				"','" + dt + "','" + email + "','" + Request.Cookies["user"]["mobile"] + "','" + Request.Cookies["user"]["username"] + "','false','true')";
			if(cmd.ExecuteNonQuery() > 0)
			{
				Response.Write("<script>alert('Donated Successfully')</script>");
				clearAll();
				Response.Redirect("userdonations.aspx");
			}
			else
			{
				Response.Write("<script>alert('Donation Failed')</script>");
				clearAll();
			}
		}

		private void clearAll()
		{
			donate_weight_text.Text = "";
			donate_desc_text.Text = "";
			donate_address_text.Text = "";
			donate_city_list.SelectedIndex = 0;
			donate_state_list.SelectedIndex = 0;
		}
	}
}
 
 