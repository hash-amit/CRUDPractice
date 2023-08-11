using System;
using System.CodeDom;
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
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection _connection = new SqlConnection(ConfigurationManager.ConnectionStrings["con_string"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { ShowUser(); }
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            
        }

        public void ShowUser()
        {
            _connection.Open();
            SqlCommand cmd = new SqlCommand("spGetUserRecord", _connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["user_id"]));
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);  
            DataTable dt = new DataTable(); 
            adapter.Fill(dt);   
            _connection.Close();
            UserGridView.DataSource = dt;
            UserGridView.DataBind();
        }

        protected void Logout_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Logout.aspx");
        }

        protected void DeleteAccount_btn_Click(object sender, EventArgs e)
        {
            _connection.Open();
            SqlCommand cmd = new SqlCommand("spDeleteRecord", _connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["user_id"]));
            cmd.ExecuteNonQuery();
            _connection.Close();
            Session.Abandon();
            Response.Redirect("Registration.aspx");
        }
    }
}