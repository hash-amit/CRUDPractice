<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CRUDPractice.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Account</title>
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

/*        table {
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

        .loginButton input {
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
            color: red;
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
                    <h2>Login Account</h2>
                    <asp:Label ID="msg_lbl" runat="server" Text=""></asp:Label>
                </center>
            </div>
            <table>
                <tr>
                    <td class="inputTextBox">
                        <asp:TextBox ID="email_txt" placeholder="example@email.com" TextMode="Email" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td class="inputTextBox">
                        <asp:TextBox ID="pass_txt" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox></td>
                </tr>


                <tr>
                    <td class="loginButton">
                        <asp:Button ID="Create_btn" Text="Login Account" runat="server" OnClick="Create_btn_Click"/></td>
                </tr>
            </table>

            <div class="lower_container">
                <center>
                    <a href="ChangePassword.aspx">Forgot Passworde</a>
                </center>
            </div>

            <div class="lower_container">
                <center>
                    <a href="Registration.aspx">If you don't have an account<br>Click here</a>
                </center>
            </div>
        </div>
    </form>
</body>
</html>
