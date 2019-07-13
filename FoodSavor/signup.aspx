<%@ Page Title="Registeration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="FoodSavor.signup" %>

<asp:Content ID="signupheader" ContentPlaceHolderID="DefaultHeadContent" runat="server">
	<script src="Scripts/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('.restaurant').hide();
		});

		function change() {
			if ($('#restaurant_check').is(':checked')) {
				$('.restaurant').show();
				ValidatorEnable(document.getElementById('<%= reg_address_val.ClientID %>'), true);
			} else {
				$('.restaurant').hide();
				ValidatorEnable(document.getElementById('<%= reg_address_val.ClientID %>'), false);
			}
		}
	</script>

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

		.dropdown {
			width: 100%;
			height: 30px;
		}
	</style>
</asp:Content>
<asp:Content ID="signupbody" ContentPlaceHolderID="DefaultBodyContent" runat="server">
	<div class="container-fluid reg-form">
		<div class="row">
			<div class="col-sm-6">

				<%--heading--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10">
						<asp:Label CssClass="heading" ID="signup_heading" runat="server"
							Text="Register Here"></asp:Label>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<%--sub-heading--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10">
						<asp:Label CssClass="sub_text" ID="signup_text" runat="server" Text="Create your personal account"></asp:Label>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<br />

				<%--first and last name--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-5">
						<asp:Label ID="reg_fname_label" runat="server"
							Text="Firstname"></asp:Label>

						<asp:TextBox TextMode="SingleLine" ID="reg_fname_text"
							runat="server" placeholder="Enter Firstname"></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="reg_fname_val"
							runat="server" ErrorMessage="First Name is Required"
							ControlToValidate="reg_fname_text"></asp:RequiredFieldValidator>
					</div>

					<div class="col-sm-5">
						<asp:Label ID="reg_lname_label" runat="server"
							Text="Lastname"></asp:Label>

						<asp:TextBox TextMode="SingleLine" ID="reg_lname_text"
							runat="server" placeholder="Enter Lastname"></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="reg_lname_val"
							runat="server" ErrorMessage="Last name is Required"
							ControlToValidate="reg_lname_text"></asp:RequiredFieldValidator>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-4">
						<asp:Label ID="check_label" runat="server" Text="Are you Restaurant Owner?"></asp:Label>
					</div>
					<div class="col-sm-6">
						<input type="checkbox" id="restaurant_check" onchange="change()" />
					</div>
					<div class="col-sm-1"></div>
				</div>
				<br />
				<div class="restaurant">
					<%--restaurant name--%>
					<div class="row">
						<div class="col-sm-1">
						</div>
						<div class="col-sm-10">
							<asp:Label ID="reg_rname_label" runat="server"
								Text="Restaurant Name"></asp:Label>

							<asp:TextBox TextMode="SingleLine" ID="reg_rname_text"
								runat="server" placeholder="Enter Restaurant Name" Text=""></asp:TextBox>
						</div>
						<div class="col-sm-1">
						</div>
					</div>
					<br />
					<%--Address--%>
					<div class="row">
						<div class="col-sm-1">
						</div>
						<div class="col-sm-10">
							<asp:Label ID="reg_address_label" runat="server"
								Text="Address"></asp:Label>

							<asp:TextBox TextMode="MultiLine" ID="reg_address_text"
								runat="server" placeholder="Enter Address Here"></asp:TextBox>

							<asp:RequiredFieldValidator Enabled="false" CssClass="error" ID="reg_address_val"
								runat="server" ErrorMessage="Address is Required"
								ControlToValidate="reg_address_text" SetFocusOnError="true"></asp:RequiredFieldValidator>
						</div>
						<div class="col-sm-1">
						</div>
					</div>

					<%--city--%>
					<div class="row restaurant">
						<div class="col-sm-1">
						</div>
						<div class="col-sm-5">
							<asp:Label ID="reg_city_label" runat="server"
								Text="Select City:"></asp:Label>
						</div>
						<div class="col-sm-5">
							<asp:DropDownList CssClass="dropdown" ID="reg_city_list" runat="server">
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
							<asp:Label ID="reg_state_label" runat="server"
								Text="Select State:"></asp:Label>
						</div>
						<div class="col-sm-5">
							<asp:DropDownList CssClass="dropdown" ID="reg_state_list" runat="server">
							</asp:DropDownList>
						</div>
						<div class="col-sm-1">
						</div>
					</div>
					<br />
				</div>

				<%--email--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10">
						<asp:Label ID="reg_email_label" runat="server"
							Text="Email Id"></asp:Label>

						<asp:TextBox TextMode="Email" ID="reg_email_text"
							runat="server" placeholder="Enter Email"></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="reg_email_val"
							runat="server" ErrorMessage="Email is Required"
							ControlToValidate="reg_email_text"></asp:RequiredFieldValidator>

						<asp:RegularExpressionValidator CssClass="error" ID="reg_email_regex"
							runat="server" ErrorMessage="Enter Valid Email"
							ValidationExpression="^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
							ControlToValidate="reg_email_text"></asp:RegularExpressionValidator>

						<asp:Label CssClass="error" ID="reg_email_exist" runat="server"
							Text="Email Id Already Registered" Visible="false"></asp:Label>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<%--mobile--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10">
						<asp:Label ID="reg_mobile_label" runat="server"
							Text="Mobile"></asp:Label>

						<asp:TextBox TextMode="SingleLine" ID="reg_mobile_text"
							runat="server" placeholder="Enter Mobile No."></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="reg_mobile_val"
							runat="server" ErrorMessage="Mobile No. is Required"
							ControlToValidate="reg_mobile_text"></asp:RequiredFieldValidator>

						<asp:RegularExpressionValidator CssClass="error" ID="reg_mobile_regex"
							runat="server" ErrorMessage="Enter valid Mobile Number"
							ValidationExpression="^\d{10}"
							ControlToValidate="reg_mobile_text"></asp:RegularExpressionValidator>

						<asp:Label CssClass="error" ID="reg_mobile_exist" runat="server"
							Text="Mobile Number Already Exist" Visible="false"></asp:Label>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<%--password--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10">
						<asp:Label ID="reg_pass_label" runat="server"
							Text="Password"></asp:Label>

						<asp:TextBox TextMode="Password" ID="reg_pass_text"
							runat="server" placeholder="Enter Password"></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="reg_pass_val"
							runat="server" ErrorMessage="Password can't be Empty"
							ControlToValidate="reg_pass_text"></asp:RequiredFieldValidator>

						<asp:RegularExpressionValidator CssClass="error" ID="reg_pass_len"
							runat="server" ValidationExpression="^\w{6,20}"
							ErrorMessage="Password should be 6 to 20 characters long"
							ControlToValidate="reg_pass_text"></asp:RegularExpressionValidator>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<%--confirm password--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10">
						<asp:Label ID="reg_cpass_label" runat="server"
							Text="Confirm Password"></asp:Label>

						<asp:TextBox TextMode="Password" ID="reg_cpass_text" runat="server"
							placeholder="Repeat Password"></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="reg_cpass_val"
							runat="server" ErrorMessage="Confirm Password is Required"
							ControlToValidate="reg_cpass_text"></asp:RequiredFieldValidator>

						<asp:CompareValidator CssClass="error" ID="reg_cpass_cmp" runat="server"
							ErrorMessage="Passwords didn't match" ControlToValidate="reg_cpass_text"
							ControlToCompare="reg_pass_text"></asp:CompareValidator>
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<%--Button--%>
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10">
						<asp:Button CssClass="button" ID="signupBtn" runat="server"
							Text="Sign Up" OnClick="signupBtn_Click" />
					</div>
					<div class="col-sm-1">
					</div>
				</div>

				<%-- End of col-sm-6 --%>
			</div>

			<%-- Side Image --%>
			<div class="col-sm-6 text-center">

				<img src="~/assets/111.png" runat="server" />

			</div>
		</div>
	</div>

</asp:Content>
