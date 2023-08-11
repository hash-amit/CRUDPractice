<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CRUDPractice.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            margin: 0px;
            padding: 0px;
        }

        .background-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('Images/Home-page-cover-image4.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            opacity: 1; /* Adjust the opacity as needed */
            z-index: -1; /* Place the image behind the content */
        }

        .outerContainer {
            display: flex;
            justify-content: center;
            height: 500px;
            align-items: center;
            flex-direction: column;
        }

        table {
            height: 300px;
            width: 300px;
            background: white;
            border-radius: 20px;
            border: none;
        }

        table tbody tr th{
            border: none;
        }
        table tbody tr td{
            border: none;
        }
    </style>
</head>
<body>
    <div class="background-image"></div>
    <form id="form1" runat="server">
        <div class="outerContainer">
            <asp:GridView ID="UserGridView" AutoGenerateColumns="false" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="Details">
                        <ItemTemplate>
                            <table>
                                <tr><td style="width:50%">Name: </td><td><%# Eval("Name") %></td></tr>
                                <tr><td>Email: </td><td><%# Eval("Email") %></td></tr>
                                <tr><td>Gender: </td><td><%# Eval("GName") %></td></tr>
                                <tr><td>Country: </td><td><%# Eval("CName") %></td></tr>
                                <tr><td>State: </td><td><%# Eval("SName") %></td></tr>
                                <tr><td>City: </td><td><%# Eval("CityName") %></td></tr>
                                <tr><td>Hobbies: </td><td><%# Eval("Hobbies") %></td></tr>
                                <tr><td>Password: </td><td><%# Eval("Password") %></td></tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="buttons">
                <asp:Button ID="Logout_btn" Text="Logout" runat="server" OnClick="Logout_btn_Click" />
                <asp:Button ID="DeleteAccount_btn" Text="Delete Account" runat="server" OnClick="DeleteAccount_btn_Click" />
            </div>
        </div>
    </form>
</body>
</html>
