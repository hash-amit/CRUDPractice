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

        tr th {
            border: none;
            font-family: monospace;
            font-size: larger;
        }

        table {
            height: 300px;
            width: 300px;
            background: white;
            border-radius: 20px;
            border: none;
        }

        td table {
            color: white;
            background: black;
            font-family: monospace;
            font-size: larger;
            padding-left: 10px;
        }

        .buttons input {
            padding: 0px;
            width: 140px;
            height: 30px;
            border: 0px;
            border-radius: 4px;
            background: #2196F3;
            color: white;
            font-family: monospace;
            font-size: large;
            font-weight: bolder;
            margin: 5px;
        }

        .Another_btn input{
            padding: 0px;
            width: 295px;
            height: 30px;
            border: 0px;
            border-radius: 4px;
            background: #9C27B0;
            color: white;
            font-family: monospace;
            font-size: large;
            font-weight: bolder;
            margin: 5px;
        }

        table tbody tr th{
            border: none;
        }
        table tbody tr td{
            border: none;
        }

        .footer{
            position: absolute; /* Set position to absolute */
            bottom: 0; /* Position the footer at the bottom */
            width: 100%; /* Ensure the footer spans the entire width */
        }

        .footer p {
            color: white;
            font-family: monospace;
            font-size: larger;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="background-image"></div>
    <form id="form1" runat="server">
        <div class="outerContainer">
            <asp:GridView ID="UserGridView" AutoGenerateColumns="false" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="Welcome">
                        <ItemTemplate>
                            <table>
                                <tr><td>Name: <%# Eval("Name") %></td></tr>
                                <tr><td>Email: <%# Eval("Email") %></td></tr>
                                <tr><td>Gender: <%# Eval("GName") %></td></tr>
                                <tr><td>Country: <%# Eval("CName") %></td></tr>
                                <tr><td>State: <%# Eval("SName") %></td></tr>
                                <tr><td>City: <%# Eval("CityName") %></td></tr>
                                <tr><td>Hobbies: <%# Eval("Hobbies") %></td></tr>
                                <tr><td>Password:  <%# Eval("Password") %></td></tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="buttons">
                <asp:Button ID="Logout_btn" Text="Logout" runat="server" OnClick="Logout_btn_Click" />
                <asp:Button ID="DeleteAccount_btn" Text="Delete Account" runat="server" OnClick="DeleteAccount_btn_Click" />
            </div>
            <div class="Another_btn">
                <asp:Button ID="ChangePass_btn" Text="Do you want to change passowrd?" runat="server" OnClick="ChangePass_btn_Click"/>
            </div>
        </div>
    </form>
    <div class="footer">
        <p>©Amit Kumar 2023. All rights reserved.</p>
    </div>
</body>
</html>
