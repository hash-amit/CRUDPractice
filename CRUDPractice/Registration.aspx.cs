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
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection _connection = new SqlConnection(ConfigurationManager.ConnectionStrings["con_string"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGender();
                BindCountry();
                country_ddl.Items.Insert(0, new ListItem("Select Country", "0"));
                state_ddl.Items.Insert(0, new ListItem("Select State", "0"));
                state_ddl.Enabled = false;
                city_ddl.Items.Insert(0, new ListItem("Select City", "0"));
                city_ddl.Enabled = false;
                BindHobbies();
            }
        }

        public void BindGender()
        {
            _connection.Open();
            SqlCommand cmd = new SqlCommand("spBindGender", _connection);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            _connection.Close();
            gender_rbl.DataValueField = "GID";
            gender_rbl.DataTextField = "GName";
            gender_rbl.DataSource = dt;
            gender_rbl.DataBind();
        }

        public void BindCountry()
        {
            _connection.Open();
            SqlCommand cmd = new SqlCommand("spBindCountry", _connection);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            _connection.Close();
            country_ddl.DataValueField = "CID";
            country_ddl.DataTextField = "CName";
            country_ddl.DataSource = dt;
            country_ddl.DataBind();
        }

        public void BindState()
        {
            _connection.Open();
            SqlCommand cmd = new SqlCommand("spBindState", _connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@cid", country_ddl.SelectedValue);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            _connection.Close();
            state_ddl.DataValueField = "SID";
            state_ddl.DataTextField = "SName";
            state_ddl.DataSource = dt;
            state_ddl.DataBind();
            state_ddl.Items.Insert(0, new ListItem("Select State", "0"));
        }

        public void BindCity()
        {
            _connection.Open();
            SqlCommand cmd = new SqlCommand("spBindCity", _connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@sid", state_ddl.SelectedValue);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            _connection.Close();
            city_ddl.DataValueField = "CityID";
            city_ddl.DataTextField = "CityName";
            city_ddl.DataSource = dt;
            city_ddl.DataBind();
            city_ddl.Items.Insert(0, new ListItem("Select City", "0"));
        }

        public void BindHobbies()
        {
            _connection.Open();
            SqlCommand cmd = new SqlCommand("spBindHobbies", _connection);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            _connection.Close();
            hobbies_cbl.DataValueField = "HID";
            hobbies_cbl.DataTextField = "HName";
            hobbies_cbl.DataSource = dt;
            hobbies_cbl.DataBind();
        }


        protected void country_ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (country_ddl.SelectedIndex != 0)
            {
                state_ddl.Enabled = true;
                BindState();
            }
            else
            {
                state_ddl.SelectedValue = "0";
                state_ddl.Enabled = false;
                city_ddl.SelectedValue = "0";
                city_ddl.Enabled = false;
            }
        }

        protected void state_ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (state_ddl.SelectedIndex != 0)
            {
                city_ddl.Enabled = true;
                BindCity();
            }
            else
            {
                city_ddl.SelectedValue = "0";
                city_ddl.Enabled = false;
            }
        }

        public string GetHobbies()
        {
            String hobbies = string.Empty;
            for (int i = 0; i < hobbies_cbl.Items.Count; i++)
            {
                if (hobbies_cbl.Items[i].Selected == true)
                {
                    hobbies += hobbies_cbl.Items[i].Text + ",";
                }
            }
            return hobbies.TrimEnd(',');
        }

        public bool CheckBlank()
        {
            if (name_txt.Text == string.Empty)
            {
                msg_lbl.Text = "Please fill name!";
                return false;
            }

            if (email_txt.Text == string.Empty)
            {
                msg_lbl.Text = "Please fill email!";
                return false;
            }

            if (gender_rbl.SelectedValue == string.Empty)
            {
                msg_lbl.Text = "Please select gender!";
                return false;
            }

            if (country_ddl.SelectedIndex == 0)
            {
                msg_lbl.Text = "Please select country!";
                return false;
            }

            if (state_ddl.SelectedIndex == 0)
            {
                msg_lbl.Text = "Please select state!";
                return false;
            }

            if (city_ddl.SelectedIndex == 0)
            {
                msg_lbl.Text = "Please select city!";
                return false;
            }

            bool flag = false;
            for (int i = 0; i < hobbies_cbl.Items.Count; i++ )
            {
                if (hobbies_cbl.Items[i].Selected == true)
                {
                    flag = true;
                    break;
                }
            }
            if (!flag) 
            {
                msg_lbl.Text = "Please select Hobbies!";
                return flag;
            }

            if (pass_txt.Text == string.Empty)
            {
                msg_lbl.Text = "Please make password!";
                return false;
            }

            return true;
        }

        public bool CheckFormat()
        {
            if (name_txt.Text.Length > 60)
            {
                msg_lbl.Text = "Name is too long!";
                return false;
            }

            if (email_txt.Text.Length > 60)
            {
                msg_lbl.Text = "Email is too long!";
                return false;
            }

            if (pass_txt.Text.Length < 6 || pass_txt.Text.Length > 8)
            {
                msg_lbl.Text = "Password should be 6 to 8 charracters long!";
                return false;
            }

            return true;
        }

        protected void Create_btn_Click(object sender, EventArgs e)
        {
            if (CheckBlank() && CheckFormat())
            {
                _connection.Open();
                SqlCommand cmd = new SqlCommand("spInsertData", _connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", name_txt.Text);
                cmd.Parameters.AddWithValue("@email", email_txt.Text);
                cmd.Parameters.AddWithValue("@gender", gender_rbl.SelectedValue);
                cmd.Parameters.AddWithValue("@country", country_ddl.SelectedValue);
                cmd.Parameters.AddWithValue("@state", state_ddl.SelectedValue);
                cmd.Parameters.AddWithValue("@city", city_ddl.SelectedValue);
                cmd.Parameters.AddWithValue("@hobbies", GetHobbies());
                cmd.Parameters.AddWithValue("@pass", pass_txt.Text);
                cmd.ExecuteNonQuery();
                _connection.Close();
                msg_lbl.Text = "Registered Successfully!";
            }
        }
    }
}