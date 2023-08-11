<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="CRUDPractice.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
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

        .inputTextBox input {
            width: 240.56px;
            height: 35px;
            border: 0px;
            padding-left: 5px;
            border-radius: 4px;
        }

        .ChangeButton input {
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
    </style>
</head>
<body>
    <div class="background-image"></div>
    <form id="form1" runat="server">
        <div class="container">
            <div class="msg_container">
                <center>
                    <h2>Change your password</h2>
                    <asp:Label ID="msg_lbl" runat="server" Text=""></asp:Label>
                </center>
            </div>
            <table>
                <tr>
                    <td class="inputTextBox">
                        <asp:TextBox ID="current_pass_txt" placeholder="Type current password" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td class="inputTextBox">
                        <asp:TextBox ID="new_pass_txt" placeholder="New password" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td class="inputTextBox">
                        <asp:TextBox ID="confirm_pass_txt" placeholder="Confirm password" runat="server"></asp:TextBox></td>
                </tr>


                <tr>
                    <td class="ChangeButton">
                        <asp:Button ID="ChangePass_btn" Text="Update" runat="server" OnClick="ChangePass_btn_Click" /></td>
                </tr>
            </table>
            <div class="lower_container">
                <center>
                    <a href="Home.aspx">Go Back To Home Page</a>
                </center>
            </div>
        </div>
    </form>
</body>
</html>
