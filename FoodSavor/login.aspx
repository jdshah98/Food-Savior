<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FoodSavor.login" %>
<asp:Content ID="loginHeader" ContentPlaceHolderID="DefaultHeadContent" runat="server">
	<style type="text/css">
		body {
			background-color: #f0f0f0;
		}
		.container-fluid {
			width: 100%;
			height: 100%;
		}

		/* Full-width input fields */
		input[type=email], input[type=password] {
			width: 100%;
			padding: 12px 20px;
			margin: 8px 0;
			display: block;
			border-radius: 5px;
			border: 1px solid #ccc;
			box-sizing: border-box;
		}

		.text-label {
			font-family: Arial;
			font-size: 14px;
			font-weight: bold;
		}

		.error {
			font-size: 14px;
			color: red;
		}

		.margin-top {
			margin-top: 5px;
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
			font-size: 30px;
		}

		.login {
			border: 1px solid #ccc;
			height: auto;
			width: 50%;
			margin: 2%;
			display: inline-block;
			padding: 20px;
			box-shadow: rgba(150,150,150,8) 1px 1px 1px inset;
			background-color: white;
		}

		@media (max-width: 768px) {
			.login {
				border: 1px solid #ccc;
				height: auto;
				width: 80%;
				margin: 2%;
				display: inline-block;
				padding: 20px;
				box-shadow: rgba(150,150,150,8) 1px 1px 1px inset;
				background-color: white;
			}

			span.psw {
				float: left;
			}

			hr {
				border: 1px solid #8f8f8f;
				opacity: 0.5;
				margin: 0px !important;
			}
		}

		hr {
			border: 1px solid #8f8f8f;
			opacity: 0.5;
			margin: 20px;
		}

		.alert {
			margin-top: 5px;
			margin-bottom: 5px !important;
		}

		.radio {
			padding-left: 20px;
			padding-right: 20px;
			margin: 0px;
			text-align: left;
		}
	</style>
</asp:Content>

<asp:Content ID="loginBody" ContentPlaceHolderID="DefaultBodyContent" runat="server">
	<div class="container-fluid text-center">
		<div class="login">
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10" style="text-align: left; font-weight: bold;">
					<asp:Label CssClass="heading" ID="login_heading" runat="server" Text="Login"></asp:Label>
				</div>
				<div class="col-md-1">
				</div>
			</div>
			<hr />
			<br />
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-4" style="text-align: left; font-weight: bold;">
					<asp:Label runat="server" Text="Select User Type:"></asp:Label>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-6">
							<asp:RadioButton AutoPostBack="true" CssClass="radio" GroupName="usertype" ID="customer" runat="server" Text="Customer" Checked="true" OnCheckedChanged="ngo_CheckedChanged"/>
						</div>
						<div class="col-md-6">
							<asp:RadioButton AutoPostBack="true" CssClass="radio" GroupName="usertype" ID="ngo" runat="server" Text="NGO" OnCheckedChanged="ngo_CheckedChanged"/>
						</div>
					</div>
				</div>
				<div class="col-md-1">
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10" style="text-align: left;">
					<asp:Label CssClass="text-label" ID="login_email_label"
						runat="server" Text="Email"></asp:Label>
					<asp:TextBox CssClass="textbox" TextMode="Email" ID="login_email"
						runat="server" placeholder="Enter Email"></asp:TextBox>
					<asp:RequiredFieldValidator CssClass="error" ID="email_validation"
						runat="server" ErrorMessage="Email is Required"
						ControlToValidate="login_email"></asp:RequiredFieldValidator>
				</div>
				<div class="col-md-1">
				</div>
			</div>
			<div class="row margin-top">
				<div class="col-md-1">
				</div>
				<div class="col-md-10" style="text-align: left;">
					<asp:Label CssClass="text-label" ID="login_pass_label" runat="server" Text="Password"></asp:Label>
					<asp:TextBox CssClass="textbox" TextMode="Password" ID="login_password" runat="server" placeholder="Enter Password"></asp:TextBox>
					<asp:RequiredFieldValidator CssClass="error" ID="password_validation" runat="server" ErrorMessage="Password is Empty" ControlToValidate="login_password"></asp:RequiredFieldValidator>
				</div>
				<div class="col-md-1">
				</div>
			</div>
			<div class="row margin-top">
				<div class="col-md-1">
				</div>
				<div class="col-md-5" style="text-align: left;">
					<asp:CheckBox ID="remember" runat="server" Text="Remember Me" Checked="true" />
				</div>
				<div class="col-md-5">
					<span class="psw">Forgot <a href="~/">password?</a></span>
				</div>
				<div class="col-md-1">
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10">
					<div id="login_error" runat="server" class="alert alert-danger alert-dimdissable" style="display: none;">
						<button type="button" class="close" data-dimdiss="alert" aria-hidden="true">
							&times;
						</button>
						Incorrect username or password
					</div>
					<asp:Button CssClass="button" ID="loginBtn" runat="server" Text="Login" OnClick="loginBtn_Click" />
				</div>
				<div class="col-md-1">
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10" style="text-align: left;">
					<span>New user? <a id="new_user" runat="server" href="~/signup">Sign Up</a></span>
				</div>
				<div class="col-md-1">
				</div>
			</div>
		</div>
	</div>
</asp:Content>