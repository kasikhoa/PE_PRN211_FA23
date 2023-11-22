using Microsoft.VisualBasic.ApplicationServices;
using Repository;

namespace GameCard_SE150494
{
    public partial class frmLogin : Form
    {
        public MemberAccountService _accountService { get; set; }
        public frmLogin()
        {
            _accountService = new MemberAccountService();
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            var username = txtUsername.Text;
            var password = txtPassword.Text;

            var user = _accountService.GetAll().Where(p => p.MemberEmail.Equals(username)
                            && p.MemberAccountPassword.Equals(password) && (p.Role == 2 || p.Role == 3)).FirstOrDefault();
            if (user != null)
            {
                this.Hide();
                var manage = new frmGameCardInfo(user);
                manage.ShowDialog();
               
            }
            else
            {
                MessageBox.Show("You have no permission to access this function", "Error", MessageBoxButtons.OK);
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}