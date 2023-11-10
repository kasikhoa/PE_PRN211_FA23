using Microsoft.EntityFrameworkCore;
using Repository;
using Repository.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.VisualStyles;

namespace GameCard_SE150494
{
    public partial class frmGameCardInfo : Form
    {

        public GameCardInfoService _gameCardService { get; set; }
        public ProviderService _providerService { get; set; }
        public frmGameCardInfo(MemberAccount member)
        {
            _gameCardService = new GameCardInfoService();
            _providerService= new ProviderService();
            if (member == null) {
                this.Hide();
                var loginform = new frmLogin();
                loginform.ShowDialog();
            }           
            InitializeComponent();
            if (member != null && member.Role == 2)
            {
                btnSearch.Enabled = false;
                btnCreate.Enabled = false;
                btnDelete.Enabled = false;
                btnUpdate.Enabled = false;
            }
            GetListdgv();
            GetValueCombobox();
        }

        public void GetListdgv()
        {
            var listCards = _gameCardService.GetAll().Include(p => p.Provider).ToList();
            dgvGameCardInfo.DataSource = listCards.Select(p => new
            {
                p.GameCardId,
                p.GameCardName,
                p.GameDescription,
                p.GamePlatform,
                p.Price,
                p.Quantity,
                p.CreatedDate,
                p.Provider?.ProviderName
            }).ToList();
        }

        public void GetValueCombobox(string providerId = "")
        {
            var listProvider = _providerService.GetAll().ToList();
            cboProvider.DataSource = listProvider;
            cboProvider.DisplayMember = "ProviderName";
            cboProvider.ValueMember = "ProviderId";
            if (providerId != null)
            {
                cboProvider.SelectedIndex = listProvider.IndexOf(listProvider.Where(p => p.ProviderId.Equals(providerId)).FirstOrDefault());
            }

        }

        private void dgvGameCardInfo_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            var gameCardId = dgvGameCardInfo.Rows[e.RowIndex].Cells[0].Value;
            if (gameCardId != null)
            {
                var obj = _gameCardService.GetAll().ToList().Where(p => p.GameCardId.Equals(gameCardId)).FirstOrDefault();
                if (obj != null)
                {
                    txtGameCardId.Text = obj.GameCardId.ToString();
                    txtGameCardName.Text = obj.GameCardName;
                    txtGameDesc.Text = obj.GameDescription;
                    txtGamePlatform.Text = obj.GamePlatform;
                    txtPrice.Text = obj.Price.ToString();
                    txtQuantity.Text = obj.Quantity.ToString();
                    dtpCreateDate.Value = obj.CreatedDate.Value;

                    GetValueCombobox(obj.ProviderId); 

                }

            }

        }


        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            var searchKey = txtSearch.Text;
            var listGameCard = _gameCardService.GetAll()
                                .Where(p => p.GamePlatform.Contains(searchKey))
                                .Include(p => p.Provider).ToList();
            dgvGameCardInfo.DataSource = listGameCard.Select(p => new
            {
                p.GameCardId,
                p.GameCardName,
                p.GameDescription,
                p.GamePlatform,
                p.Price,
                p.Quantity,
                p.CreatedDate,
                p.Provider?.ProviderName
            }).ToList();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {

            var gameCard = _gameCardService.GetAll()
                .Where(p => p.GameCardId.Equals(int.Parse(txtGameCardId.Text))).FirstOrDefault();

            if (gameCard == null)
            {
                MessageBox.Show("ID not existed, please try again", "Error", MessageBoxButtons.OK);
                return;
            }

            DialogResult result = MessageBox.Show("Are you sure you want to delete this account?", "Confirm Deletion", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (result == DialogResult.Yes)
            {
                _gameCardService.Delete(gameCard);
                ClearTextBox();
                GetListdgv();
            }
        }

        public void ClearTextBox()
        {
            txtGameCardId.Text = string.Empty;
            txtGameCardName.Text = string.Empty;
            txtGameDesc.Text = string.Empty;
            txtGamePlatform.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtQuantity.Text = string.Empty;
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            var gameCardOld = _gameCardService.GetAll()
                .Where(p => p.GameCardId.Equals(int.Parse(txtGameCardId.Text))).FirstOrDefault();

            if (gameCardOld != null)
            {
                MessageBox.Show("ID existed, please try again", "Error", MessageBoxButtons.OK);
                return;
            }

            if (string.IsNullOrEmpty(txtGameCardId.Text) || string.IsNullOrEmpty(txtGameCardName.Text) || string.IsNullOrEmpty(txtGameDesc.Text)
                || string.IsNullOrEmpty(txtGamePlatform.Text) || cboProvider.SelectedValue == null)
            {
                MessageBox.Show("All fields are required", "Error", MessageBoxButtons.OK);
                return;
            }

            if (txtGameCardName.Text.ToString().Length < 2 || txtGameCardName.Text.ToString().Length > 60)
            {
                MessageBox.Show("Game Card Name in range (2,60) chars", "Error", MessageBoxButtons.OK);
                return;
            }

            if (int.Parse(txtPrice.Text) < 0 || int.Parse(txtQuantity.Text) < 0)
            {
                MessageBox.Show("Price must be equal or greate than 0", "Error", MessageBoxButtons.OK);
                return;
            }

            string[] words = txtGameCardName.Text.Split(' ');

            foreach (string word in words)
            {
                if (string.IsNullOrEmpty(word) || !char.IsUpper(word[0]) && !char.IsDigit(word[0]))
                {
                    MessageBox.Show("Each word of Game Card Name must begin with a capital letter or a digit", "Error", MessageBoxButtons.OK);
                    return;
                }
            }

            var newGameCard = new GameCardInfo();
            newGameCard.GameCardId = int.Parse(txtGameCardId.Text);
            newGameCard.GameCardName = txtGameCardName.Text;
            newGameCard.GameDescription = txtGameDesc.Text;
            newGameCard.GamePlatform = txtGamePlatform.Text;
            newGameCard.Price = int.Parse(txtPrice.Text);
            newGameCard.Quantity = int.Parse(txtQuantity.Text);
            newGameCard.CreatedDate = dtpCreateDate.Value;
            newGameCard.ProviderId = cboProvider.SelectedValue.ToString();

            _gameCardService.Create(newGameCard);

            // Show the list again
            ClearTextBox();
            GetListdgv();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            var gameCardOld = _gameCardService.GetAll().Where(p => p.GameCardId.Equals(int.Parse(txtGameCardId.Text))).FirstOrDefault();

            if (gameCardOld == null)
            {
                MessageBox.Show("ID not existed, please try again", "Error", MessageBoxButtons.OK);
                return;
            }

            if (string.IsNullOrEmpty(txtGameCardId.Text) || string.IsNullOrEmpty(txtGameCardName.Text) || string.IsNullOrEmpty(txtGameDesc.Text)
                || string.IsNullOrEmpty(txtGamePlatform.Text) || cboProvider.SelectedValue == null)
            {
                MessageBox.Show("All fields are required", "Error", MessageBoxButtons.OK);
                return;
            }

            if (txtGameCardName.Text.ToString().Length < 2 || txtGameCardName.Text.ToString().Length > 60)
            {
                MessageBox.Show("Game Card Name in range (2,60) chars", "Error", MessageBoxButtons.OK);
                return;
            }

            if (int.Parse(txtPrice.Text) < 0 || int.Parse(txtQuantity.Text) < 0)
            {
                MessageBox.Show("Price must be equal or greate than 0", "Error", MessageBoxButtons.OK);
                return;
            }

            string[] words = txtGameCardName.Text.Split(' ');

            foreach (string word in words)
            {
                if (!char.IsUpper(word[0]) && !char.IsDigit(word[0]))
                {
                    MessageBox.Show("Each word of Game Card Name must begin with a capital letter or a digit", "Error", MessageBoxButtons.OK);
                    return;
                }
            }

            gameCardOld.GameCardId = int.Parse(txtGameCardId.Text);
            gameCardOld.GameCardName = txtGameCardName.Text;
            gameCardOld.GameDescription = txtGameDesc.Text;
            gameCardOld.GamePlatform = txtGamePlatform.Text;
            gameCardOld.Price = int.Parse(txtPrice.Text);
            gameCardOld.Quantity = int.Parse(txtQuantity.Text);
            gameCardOld.CreatedDate = dtpCreateDate.Value;
            gameCardOld.ProviderId = cboProvider.SelectedValue.ToString();

            _gameCardService.Update(gameCardOld);
            ClearTextBox();
            GetListdgv();
        }
    }
}
