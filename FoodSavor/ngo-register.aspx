<%@ Page Title="NGO Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ngo-register.aspx.cs" Inherits="FoodSavor.ngo_register" %>

<asp:Content ID="ngoheader" ContentPlaceHolderID="DefaultHeadContent" runat="server">
	<style>
		body {
			background-color: #f0f0f0;
		}

		.reg-form {
			width: 100%;
			height: auto;
			margin: 50px 0px 70px 0px;
		}

		/* Full-width input fields */
		input[type=text], input[type=password], input[type=email], textarea {
			width: 100%;
			padding: 12px 20px;
			margin: 8px 0;
			display: block;
			border-radius: 5px;
			border: 1px solid #ccc;
			box-sizing: border-box;
		}

		/* Set a style for all buttons */
		.button {
			background-color: green;
			color: white;
			padding: 10px;
			margin: 8px 0;
			border: 1px solid black;
			border-radius: 10px;
			cursor: pointer;
			width: 100%;
			text-shadow: 2px 1px #333;
			letter-spacing: 1.5px;
			font-size: 18px;
			font-weight: bold;
		}

			.button:hover {
				opacity: 0.8;
			}

		span.psw {
			float: right;
		}

		.heading {
			color: #5f5f5f;
			font-size: 24px;
		}

		.error {
			font-size: 14px;
			color: red;
			margin-bottom: 10px;
		}

		img {
			width: 60%;
			height: 60%;
		}

		.dropdown{
			width: 100%;
			height: 30px;
		}
	</style>
</asp:Content>
<asp:Content ID="ngobody" ContentPlaceHolderID="DefaultBodyContent" runat="server">
	<div class="container-fluid reg-form">
		<div class="row">
			<div class="col-sm-6">

				<%--heading--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10"">
						<asp:Label CssClass="heading" ID="ngo_heading" runat="server" 
							Text="NGO Register Here"></asp:Label>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<br />

				<%--org name--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10"">
						<asp:Label ID="ngo_name_label" runat="server"
							Text="Organization Name"></asp:Label>
						<asp:TextBox TextMode="SingleLine" ID="ngo_name_text" runat="server" 
							placeholder="Enter Organization Name"></asp:TextBox>
						<asp:RequiredFieldValidator CssClass="error" ID="ngo_name_val" 
							runat="server" ErrorMessage="Organization Name is Required" 
							ControlToValidate="ngo_name_text"  SetFocusOnError="true"></asp:RequiredFieldValidator>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<%--MD name--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10"">
						<asp:Label ID="ngo_mdname_label" runat="server"
							Text="Director Name"></asp:Label>
						<asp:TextBox TextMode="SingleLine" ID="ngo_mdname_text" runat="server"
							placeholder="Enter Full Name"></asp:TextBox>
						<asp:RequiredFieldValidator CssClass="error" ID="ngo_mdname_val" 
							runat="server" ErrorMessage="Director Name is Required"
							ControlToValidate="ngo_mdname_text" SetFocusOnError="true"></asp:RequiredFieldValidator>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<%--email--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10"">
						<asp:Label ID="ngo_email_label" runat="server"
							Text="Email"></asp:Label>

						<asp:TextBox TextMode="Email" ID="ngo_email_text" 
							runat="server" placeholder="Enter Email"></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="ngo_email_val" 
							runat="server" ErrorMessage="Email is Required" 
							ControlToValidate="ngo_email_text" SetFocusOnError="true"></asp:RequiredFieldValidator>

						<asp:RegularExpressionValidator CssClass="error" ID="ngo_email_regex"
							runat="server" ErrorMessage="Enter Valid Email"
							ValidationExpression="^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
							ControlToValidate="ngo_email_text"></asp:RegularExpressionValidator>

						<asp:Label CssClass="error" ID="ngo_email_exist" runat="server"
							Text="Email Id Already Registered" Visible="false"></asp:Label>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<%--mobile--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10"">
						<asp:Label ID="ngo_mobile_label" runat="server" 
							Text="Mobile"></asp:Label>

						<asp:TextBox TextMode="SingleLine" ID="ngo_mobile_text" runat="server"
							placeholder="Enter Mobile No."></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="ngo_mobile_val"
							runat="server" ErrorMessage="Mobile No. is Required" 
							ControlToValidate="ngo_mobile_text" SetFocusOnError="true"></asp:RequiredFieldValidator>

						<asp:RegularExpressionValidator CssClass="error" ID="ngo_mobile_regex"
							runat="server" ErrorMessage="Enter valid Mobile Number" 
							ValidationExpression="^\d{10}" 
							ControlToValidate="ngo_mobile_text"></asp:RegularExpressionValidator>

						<asp:Label CssClass="error" ID="ngo_mobile_exist" runat="server" 
							Text="Mobile No. Already Exist" Visible="false"></asp:Label>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<%--Address--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10"">
						<asp:Label ID="ngo_address_label" runat="server"
							Text="Address"></asp:Label>

						<asp:TextBox TextMode="MultiLine" ID="ngo_address_text" 
							runat="server" placeholder="Enter Address Here"></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="ngo_address_val"
							runat="server" ErrorMessage="Address is Required" 
							ControlToValidate="ngo_address_text" SetFocusOnError="true"></asp:RequiredFieldValidator>
					</div>

					<div class="col-sm-1">
					</div>

				</div>

				<%--city--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-5">
						<asp:Label ID="ngo_city_label" runat="server" 
							Text="Select City:"></asp:Label>
					</div>
					<div class="col-sm-5">
						<asp:DropDownList CssClass="dropdown" ID="ngo_city_list" runat="server">
						</asp:DropDownList>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<br />

				<%-- state --%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-5">
						<asp:Label ID="ngo_state_label" runat="server" 
							Text="Select State:"></asp:Label>
					</div>
					<div class="col-sm-5">
						<asp:DropDownList CssClass="dropdown" ID="ngo_state_list" runat="server">
						</asp:DropDownList>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<br />

				<%--password--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10"">
						<asp:Label ID="ngo_pass_label" runat="server" 
							Text="Password"></asp:Label>

						<asp:TextBox TextMode="Password" ID="ngo_pass_text"
							runat="server" placeholder="Enter Password"></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="ngo_pass_val" 
							runat="server" ErrorMessage="Password can't be Empty" 
							ControlToValidate="ngo_pass_text" SetFocusOnError="true"></asp:RequiredFieldValidator>

						<asp:RegularExpressionValidator CssClass="error" ID="ngo_pass_len"
							runat="server" ValidationExpression="^\w{6,20}" 
							ErrorMessage="Password should be 6 to 20 characters long"
							ControlToValidate="ngo_pass_text"></asp:RegularExpressionValidator>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<%--confirm password--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10"">
						<asp:Label ID="ngo_cpass_label" runat="server" 
							Text="Confirm Password"></asp:Label>

						<asp:TextBox TextMode="Password" ID="ngo_cpass_text"
							runat="server" placeholder="Repeat Password"></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="ngo_cpass_val"
							runat="server" ErrorMessage="Confirm Password is Required"
							ControlToValidate="ngo_cpass_text" SetFocusOnError="true"></asp:RequiredFieldValidator>

						<asp:CompareValidator CssClass="error" ID="ngo_cpass_cmp"
							runat="server" ErrorMessage="Passwords didn't match" 
							ControlToValidate="ngo_cpass_text" ControlToCompare="ngo_pass_text"></asp:CompareValidator>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<%-- Upload File --%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-5">
						<asp:Label ID="ngo_ctf_label" runat="server" Text="Upload NGO Certificate"></asp:Label>
					</div>
					<div class="col-sm-5">
						<asp:FileUpload ID="ngo_ctf_upload" runat="server" />
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10">
						<asp:RequiredFieldValidator CssClass="error" runat="server"
							ControlToValidate="ngo_ctf_upload" ID="ngo_ctf_val"
							ErrorMessage="Valid NGO Certificate is Required"></asp:RequiredFieldValidator>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<br />

				<%--Button--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10"">
						<asp:Button CssClass="button" ID="ngosignupBtn" runat="server"
							Text="Sign Up" OnClick="ngosignupBtn_Click" />
					</div>
					<div class="col-sm-1">
					</div>
				</div>

			<%-- End of col-sm-6 --%>
			</div>

			<%-- Side Image --%>
			<div class="col-sm-6 text-center">

				<img src="~/assets/111.png" runat="server"/>

			</div>
		</div>
	</div>
</asp:Content>
