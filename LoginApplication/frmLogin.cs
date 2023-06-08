using System;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace LoginApplication
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        //btn_Submit Click event
        private void button1_Click(object sender, EventArgs e)
        {
            string enteredId = txt_UserName.Text;
            string enteredPassword = txt_Password.Text;
            if (enteredId == "" || enteredPassword == "")
            {
                MessageBox.Show("Please provide UserName and Password");
                return;
            }
            try
            {
                //Algorithm to check if the entered ID and PW exist in the DB

                int check = 1;               
                if (check == 1)
                {
                    string successMessage = "Login Successful! ID: " + enteredId + ", Password: " + enteredPassword;
                    MessageBox.Show(successMessage, "Login Successful", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Login Failed!");
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
