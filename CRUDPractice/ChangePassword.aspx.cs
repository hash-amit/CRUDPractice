using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography.X509Certificates;

namespace CRUDPractice
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection _connection = new SqlConnection(ConfigurationManager.ConnectionStrings["con_string"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public bool CheckBlack()
        {
            if (current_pass_txt.Text == string.Empty)
            {
                msg_lbl.Text = "Please enter your old password!";
                return false;
            }

            if (new_pass_txt.Text == string.Empty)
            {
                msg_lbl.Text = "Please enter your new password!";
                return false;
            }

            if (confirm_pass_txt.Text == string.Empty)
            {
                msg_lbl.Text = "Please confirm your password!";
                return false;
            }
            return true;
        }

        public bool CheckFormat()
        {
            if (new_pass_txt.Text.Length < 6 || new_pass_txt.Text.Length > 8)
            {
                msg_lbl.Text = "The new password should be 6 to 8 characters long!";
                return false;
            }
            return true;
        }

        public bool ConfirmPass()
        {
            SqlCommand cmd = new SqlCommand("spGetUserRecord", _connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["user_id"]));
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable(); 
            adapter.Fill(dt);
            _connection.Close();
            if (current_pass_txt.Text != dt.Rows[0]["Password"].ToString())
            {
                msg_lbl.Text = "Oops! you may have entered wrong password!";
                return false;
            }
            if (new_pass_txt.Text != confirm_pass_txt.Text)
            {
                msg_lbl.Text = "Oops! Password doesn't match!";
                return false;
            }
            return true;
        }

        protected void ChangePass_btn_Click(object sender, EventArgs e)
        {
            if (CheckBlack() && CheckFormat() && ConfirmPass())
            {
                _connection.Open();
                SqlCommand cmd = new SqlCommand("spUpdatePass", _connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@new_pass", new_pass_txt.Text);
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["user_id"]));
                cmd.ExecuteNonQuery();
                _connection.Close();
                msg_lbl.Text = "Password has been updated!";
            }
        }
    }
}