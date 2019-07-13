<%@ Page Title="Donate" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="donate.aspx.cs" Inherits="FoodSavor.donate" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="UserHeadContent" runat="server">
	<style>
		body {
			background-color: #f0f0f0;
		}

		.donate-form {
			width: 100%;
			height: auto;
			margin: 50px 0px 70px 0px;
		}

		/* Full-width input fields */
		input[type=text], input[type=email], textarea {
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
<asp:Content ID="Content1" ContentPlaceHolderID="UserBodyContent" runat="server">

	<div class="container-fluid donate-form">

		<div class="row">

			<div class="col-sm-6">

				<%--heading--%>
				<div class="row">

					<div class="col-sm-1">
					</div>

					<div class="col-sm-10">
						<asp:Label CssClass="heading" ID="donate_heading" runat="server" Text="Donate Here"></asp:Label>
					</div>

					<div class="col-sm-1">
					</div>

				</div>

				<%--sub-heading--%>
				<div class="row">

					<div class="col-sm-1">
					</div>

					<div class="col-sm-10">

						<asp:Label ID="donate_sub" runat="server" Text="Fill up the details below"></asp:Label>

					</div>

					<div class="col-sm-1">
					</div>

				</div>

				<br />
				
				<%-- Quantity --%>
				<div class="row">

					<div class="col-sm-1">
					</div>

					<div class="col-sm-10">

						<asp:Label ID="donate_weight_label" runat="server" Text="Food Quantity"></asp:Label>

						<asp:TextBox TextMode="SingleLine" ID="donate_weight_text" runat="server" placeholder="Enter Quantity(in Weight or No of Persons)"></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="donate_weight_val" runat="server" ErrorMessage="Weight is Required" ControlToValidate="donate_weight_text" SetFocusOnError="True"></asp:RequiredFieldValidator>

					</div>

					<div class="col-sm-1">
					</div>

				</div>

				<%-- description --%>
				<div class="row">

					<div class="col-sm-1">
					</div>

					<div class="col-sm-10">

						<asp:Label ID="donate_desc_label" runat="server" Text="Food description"></asp:Label>
						<br />
						<asp:TextBox TextMode="MultiLine" ID="donate_desc_text" runat="server" placeholder="Add Description"></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="donate_desc_val" runat="server" ErrorMessage="Enter Atleast 50 characters" ControlToValidate="donate_desc_text" SetFocusOnError="True"></asp:RequiredFieldValidator>

					</div>

					<div class="col-sm-1">
					</div>

				</div>

				<%-- Address --%>
				<div class="row">

					<div class="col-sm-1">
					</div>

					<div class="col-sm-10">

						<asp:Label ID="donate_add_label" runat="server" Text="Address"></asp:Label>

						<asp:TextBox ID="donate_address_text" runat="server" TextMode="MultiLine" placeholder="Pickup location"></asp:TextBox>

						<asp:RequiredFieldValidator CssClass="error" ID="donate_val" runat="server" ErrorMessage="Address is Required" ControlToValidate="donate_address_text" SetFocusOnError="True"></asp:RequiredFieldValidator>

					</div>

					<div class="col-sm-1">
					</div>

				</div>

				<%-- City --%>
				<div class="row">

					<div class="col-sm-1">
					</div>

					<div class="col-sm-5">
						<asp:Label ID="donate_city_label" runat="server" Text="City"></asp:Label>

					</div>

					<div class="col-sm-5">
						<asp:DropDownList CssClass="dropdown" ID="donate_city_list" runat="server">
						</asp:DropDownList>
					</div>

					<div class="col-sm-1">
					</div>

				</div>

				<br />
				
				<%-- State --%>
				<div class="row">

					<div class="col-sm-1">
					</div>

					<div class="col-sm-5">
						<asp:Label ID="donate_state_label" runat="server" Text="State"></asp:Label>
					</div>

					<div class="col-sm-5">
						<asp:DropDownList CssClass="dropdown" ID="donate_state_list" runat="server">
						</asp:DropDownList>
					</div>

					<div class="col-sm-1">
					</div>

				</div>
				
				<br />

				<%-- Submit --%>
				<div class="row">
					<div class="col-md-1">
					</div>
					<div class="col-md-10">
						<asp:Button CssClass="button" ID="donateBtn" runat="server" Text="Donate" OnClick="donateBtn_Click" />
					</div>
					<div class="col-md-1">
					</div>
				</div>

			</div>
		</div>
	</div>
</asp:Content>
