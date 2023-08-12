using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDPractice
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection _connection = new SqlConnection(ConfigurationManager.ConnectionStrings["con_string"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public bool CheckBlank()
        {
            if (email_txt.Text == string.Empty)
            {
                msg_lbl.Text = "Please enter your email!";
                return false;
            }

            if (pass_txt.Text == string.Empty)
            {
                msg_lbl.Text = "Please enter your password!";
                return false;
            }

            return true;
        }

        public bool VerifyUser()
        {
            _connection.Open();
            SqlCommand cmd = new SqlCommand("spVerifyUser", _connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", email_txt.Text);
            cmd.Parameters.AddWithValue("@password", pass_txt.Text);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);   
            DataTable dt = new DataTable(); 
            adapter.Fill(dt);
            _connection.Close();
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                msg_lbl.Text = "Sorry! You may have entered wrong credentials!";
                return false;
            }
        }

        protected void Create_btn_Click(object sender, EventArgs e)
        {
            if (CheckBlank() && VerifyUser())
            {
                _connection.Open();
                SqlCommand cmd = new SqlCommand("spCheckLoginCredentials", _connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", email_txt.Text);
                cmd.Parameters.AddWithValue("@password", pass_txt.Text);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                _connection.Close();
                if (dt.Rows.Count > 0)
                {
                    Session["user_id"] = dt.Rows[0]["ID"].ToString();
                    Response.Redirect("Home.aspx");
                }
            }
        }
    }
}