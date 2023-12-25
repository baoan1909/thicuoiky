using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace baithi
{
    public partial class dangkythongtin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangky_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblChucmung.Text = "Xin chúc mừng";
                lblThongbao.Text = string.Format("Bạn {0} đã đăng ký thành công!", txtHoten.Text);
            }
        }
    }
}