<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="request.aspx.cs" Inherits="FoodSavor.request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NgoHeadContent" runat="server">
	<style type="text/css">
		.request {
			background-color: #efefef;
			margin: 40px 15%;
			width: 70%;
			border-radius: 20px;
			box-sizing: border-box;
			box-shadow: 0 1rem 1rem rgba(0, 0, 0, .1) !important;
			padding: 20px 40px 20px 30px;
		}

		span {
			color: #00003d;
			font-weight: bold;
			font-family: Alternate Gothic;
		}

		.font-18 {
			font-size: 18px;
		}

		.font-16 {
			font-size: 16px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NgoBodyContent" runat="server">
	<asp:Repeater ID="request_layout" runat="server" OnItemCreated="request_layout_ItemCreated" OnItemCommand="request_layout_ItemCommand">
		<ItemTemplate>
			<div class="container request">
				<div class="row padding">
					<div class="col-sm-8">
						<asp:Label CssClass="font-18" ID="username" runat="server" Text='<%# "Donator: " + Eval("donator") %>'></asp:Label>
					</div>
					<div class="col-sm-4" style="text-align: right;">
						<asp:Label CssClass="font-18" ID="date_time" runat="server" Text='<%# Eval("datetime") %>'></asp:Label>
					</div>
				</div>
				<br />
				<div class="row padding">
					<div class="col-sm-8">
						<asp:Label CssClass="font-16" ID="food_desc" runat="server" Text='<%# "Description:<br>" + Eval("fdesc") %>'></asp:Label>
					</div>
					<div class="col-sm-4">
						<asp:Label CssClass="font-16" ID="food_weight" runat="server" Text='<%# "Quantity: " + Eval("famount") %>'></asp:Label>
					</div>
				</div>
				<br />
				<div class="row padding">
					<div class="col-sm-12">
						<asp:Label CssClass="font-16" ID="address" runat="server" Text='<%# "Pickup Location: " +  Eval("address") + ", " + Eval("city") + ", " + Eval("state") %>'></asp:Label>
					</div>
				</div>
				<br />
				<div class="row padding">
					<div class="col-sm-6">
						<asp:Label CssClass="font-16" ID="email" runat="server" Text='<%# "Email: " + Eval("email") %>'></asp:Label><br />
						<asp:Label CssClass="font-16" ID="mobile" runat="server" Text='<%# "Mobile: " + Eval("mobile") %>'></asp:Label>
					</div>
					<div class="col-sm-6" style="text-align: right">
						<asp:Button CssClass="btn btn-lg btn-success" ID="request_accept" runat="server" Text="Accept" CommandName="accept" />
					</div>
				</div>
			</div>
		</ItemTemplate>
	</asp:Repeater>
</asp:Content>
