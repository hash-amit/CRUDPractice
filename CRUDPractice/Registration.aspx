<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CRUDPractice.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create your account</title>
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
            background-image: url('Images/Background%20image.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            opacity: 1; /* Adjust the opacity as needed */
            z-index: -1; /* Place the image behind the content */
        }

        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 600px;
        }

        /*table {
            border: 1px solid white;
            border-radius: 9px;
            padding: 3px;
        }*/

        .inputTextBox input {
            width: 240.56px;
            height: 35px;
            border: 0px;
            padding-left: 5px;
            border-radius: 4px;
        }

        .radioButtons table {
            background: white;
            width: 247.55px;
            padding: 0px;
            height: 35px;
            border-radius: 4px;
        }

        .checkBox table {
            padding: 0px;
            width: 247.56px;
            background: white;
            border-radius: 4px;
        }

        .hobby {
            display: flex;
            justify-content: center;
            background: white;
            border: 0px;
            border-radius: 4px;
            width: 245.56px;
        }

        .saveButton input {
            padding: 0px;
            width: -webkit-fill-available;
            height: 30px;
            border: 0px;
            border-radius: 4px;
            background: #0dc143;
            color: white;
            font-family: monospace;
            font-size: large;
            font-weight: bolder;
        }

        .selectBox select {
            width: 247.55px;
            height: 35Px;
            border: 0px;
            border-radius: 4px;
        }

        .message {
            color: white;
            text-align: center;
        }

        h2{
            color: white;
            margin-top: 5px;
            margin-bottom: 5px;
            font-family: monospace;
        }

        center span {
            font-family: math;
            color: #ffeb3b;
        }

        .lower_container center a {
            display: block;
            color: #f2ff41;
            text-decoration: none;
            margin-top: 5px;
            font-family: monospace;
            font-size: 16px;
        }

        .footer {
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
        <div class="container">
            <div class="msg_container">
                <center>
                    <h2>Create your account</h2>
                    <asp:Label ID="msg_lbl" runat="server" Text=""></asp:Label>
                </center>
            </div>
            <table>
                
                <tr>
                    <td class="inputTextBox">
                        <asp:TextBox ID="name_txt" placeholder="Full Name" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td class="inputTextBox">
                        <asp:TextBox ID="email_txt" placeholder="example@email.com" TextMode="Email" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td class="radioButtons">
                        <asp:RadioButtonList ID="gender_rbl" runat="server" RepeatColumns="3"></asp:RadioButtonList></td>
                </tr>

                <tr>
                    <td class="selectBox">
                        <asp:DropDownList ID="country_ddl" runat="server" OnSelectedIndexChanged="country_ddl_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
                </tr>

                <tr>
                    <td class="selectBox">
                        <asp:DropDownList ID="state_ddl" runat="server" OnSelectedIndexChanged="state_ddl_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
                </tr>

                <tr>
                    <td class="selectBox">
                        <asp:DropDownList ID="city_ddl" runat="server"></asp:DropDownList></td>
                </tr>

                <tr>
                    <td class="hobby">Check Hobbies</td>
                </tr>

                <tr>
                    <td class="checkBox">
                        <asp:CheckBoxList ID="hobbies_cbl" runat="server" RepeatColumns="3"></asp:CheckBoxList></td>
                </tr>

                <tr>
                    <td class="inputTextBox">
                        <asp:TextBox ID="pass_txt" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox></td>
                </tr>


                <tr>
                    <td class="saveButton">
                        <asp:Button ID="Create_btn" Text="Create Account" runat="server" OnClick="Create_btn_Click" /></td>
                </tr>
            </table>
            
            <div class="lower_container">
                <center>
                    <a href="Login.aspx">Login</a>
                </center>
            </div>
        </div>
    </form>
    <div class="footer">
        <p>©Amit Kumar 2023. All rights reserved.</p>
    </div>
</body>
</html>
