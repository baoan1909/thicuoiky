using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace baithi
{
    public partial class capnhattruonghoc : System.Web.UI.Page
    {
        public static SqlConnection cn = new SqlConnection(@"Data Source=BAOAN\SQLEXPRESS;Initial Catalog=QL_SINHVIEN;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            Hienthi();
        }

        public static bool CheckKey(string sql)
        {
            SqlDataAdapter dap = new SqlDataAdapter(sql, cn);
            DataTable table = new DataTable();
            dap.Fill(table);
            if (table.Rows.Count > 0)
                return true;
            else return false;
        }

        public void ThucThi(string caulenh)
        {
            SqlCommand cm = new SqlCommand(caulenh, cn);
            cn.Open();
            cm.ExecuteNonQuery();
            cn.Close();
        }

        public void Hienthi()
        {
            try
            {
                string chuoiSQL = "SELECT * FROM tbl_truong";
                SqlDataAdapter sqlData = new SqlDataAdapter(chuoiSQL, cn);
                DataTable table = new DataTable();
                sqlData.Fill(table);
                gdvTruonghoc.DataSource = table;
                gdvTruonghoc.DataBind();
            }
            catch (Exception)
            {
                lblLoi.Text = "Lỗi kết nối";
            }

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            txtMT.Text = "";
            txtTT.Text = "";
            lblLoi.Text = "";
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {

            string chuoiSQL;
            if (txtMT.Text == "" || txtTT.Text == "")
            {
                lblLoi.Text = "Vui lòng điền đầy đủ thông tin";
                return;
            }
            chuoiSQL = "SELECT * FROM tbl_truong WHERE MaTruong=N'" + txtMT.Text.Trim() + "' OR TenTruong=N'" + txtTT.Text.Trim() + "'";
            if (CheckKey(chuoiSQL))
            {
                lblLoi.Text = "Trường này đã tồn tại";
                txtMT.Focus();
            }
            else
            {
                chuoiSQL = "INSERT INTO tbl_truong values ('" + txtMT.Text + "',N'" + txtTT.Text + "')";
                ThucThi(chuoiSQL);
                Hienthi();
                lblLoi.Text = "";
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            if (txtMT.Text == "" || txtTT.Text == "")
            {
                lblLoi.Text = "Vui lòng chọn đối tượng muốn xóa";
                return;
            }
            string chuoiSQL = "DELETE tbl_truong where MaTruong='" + txtMT.Text + "'";
            ThucThi(chuoiSQL);
            Hienthi();
            txtMT.Text = "";
            txtTT.Text = "";
            lblLoi.Text = "";
        }

        protected void gdvTruonghoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            string chuoiSQL = "SELECT * FROM tbl_truong";
            SqlDataAdapter da = new SqlDataAdapter(chuoiSQL, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int dong = gdvTruonghoc.SelectedIndex;
            int trang = gdvTruonghoc.PageIndex;
            txtMT.Text = dt.Rows[trang * 3 + dong][0].ToString();
            txtTT.Text = dt.Rows[trang * 3 + dong][1].ToString();
        }

        protected void gdvTruonghoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvTruonghoc.PageIndex = e.NewPageIndex;
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            if (txtMT.Text == "" || txtTT.Text == "")
            {
                lblLoi.Text = "Vui lòng chọn đối tượng muốn sửa";
                return;
            }
            string chuoiSQL = "UPDATE tbl_truong SET TenTruong=N'" + txtTT.Text + "'where MaTruong = '" + txtMT.Text + "'";
            ThucThi(chuoiSQL);
            Hienthi();
            lblLoi.Text = "";
        }

    }
}