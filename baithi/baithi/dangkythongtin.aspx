<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="dangkythongtin.aspx.cs" Inherits="baithi.dangkythongtin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <table class="tabledangky">
                <tr>
                    <td colspan="3" class="titledangky rowdangky">
                        ĐĂNG KÝ THÔNG TIN
                    </td>
                </tr>
                <tr> 
                    <td class="textdangky rowdangky">
                        Họ tên
                    </td>
                    <td class="rowdangky">
                        <asp:TextBox ID="txtHoten" runat="server"></asp:TextBox>
                    </td>
                    <td class="rowdangky">
                        <asp:RequiredFieldValidator ID="rfvHoten" runat="server" ControlToValidate="txtHoten" ErrorMessage="Nhập họ tên" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="textdangky rowdangky">
                        Tên tài khoản
                    </td>
                    <td class="rowdangky">
                        <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                    </td>
                    <td class="rowdangky">
                        <asp:RequiredFieldValidator ID="rfvUser" runat="server" ControlToValidate="txtUser" ErrorMessage="Nhập tên tài khoản" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr> 
                <tr>
                    <td class="textdangky rowdangky">
                        Mật khẩu
                    </td>
                    <td class="rowdangky">
                        <asp:TextBox ID="txtMatkhau" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="rowdangky">
                        <asp:RequiredFieldValidator ID="rfvMatkhau" runat="server" ControlToValidate="txtMatkhau" ErrorMessage="Nhập mật khẩu" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="textdangky rowdangky">
                       Nhập lại mật khẩu
                    </td>
                    <td class="rowdangky">
                        <asp:TextBox ID="txtNLMatkhau" TextMode="Password" runat="server"></asp:TextBox>
                    </td>
                    <td class="rowdangky">
                        <asp:RequiredFieldValidator ID="rfvNLMatkhau" runat="server" ControlToValidate="txtNLMatkhau" ErrorMessage="Nhập mật khẩu lần 2" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:CompareValidator ID="cmvMatkhau" runat="server" ControlToValidate="txtNLMatkhau" ControlToCompare="txtMatkhau" ErrorMessage="Mật khẩu không khớp" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                 <tr>
                    <td class="textdangky rowdangky">
                        Ngày sinh
                    </td>
                    <td class="rowdangky">
                        <asp:TextBox ID="txtNgaysinh" runat="server" Width="45%"></asp:TextBox>
                    </td>
                    <td class="rowdangky">
                        <asp:CompareValidator ID="cmvNgaysinh" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtNgaysinh" ErrorMessage="Nhập định dạng ngày sinh" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                 <tr>
                    <td class="textdangky rowdangky">
                        Số điện thoại
                    </td>
                    <td class="rowdangky">
                        <asp:TextBox ID="txtSDT" TextMode="Number" runat="server"></asp:TextBox>
                    </td>
                    <td class="rowdangky">
                        <asp:RequiredFieldValidator ID="rfvSDT" runat="server" ControlToValidate="txtSDT" ErrorMessage="Nhập số điện thoại" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="revSDT" runat="server" ControlToValidate="txtSDT" ErrorMessage="Số điện thoại không hợp lệ" ValidationExpression="\d{10}" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="textdangky rowdangky">
                       Email
                    </td>
                    <td class="rowdangky">
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                    <td class="rowdangky">
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" ErrorMessage="Nhập đỉa chỉ email" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="textdangky rowdangky">
                        Địa chỉ
                    </td>
                    <td class="rowdangky">
                        <asp:TextBox ID="txtDiachi" runat="server"></asp:TextBox>
                    </td>
                    <td class="rowdangky">
                        <asp:RequiredFieldValidator ID="rfvDiachi" runat="server" ControlToValidate="txtDiachi" ErrorMessage="Nhập địa chỉ" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr> 
                
                <tr>
                    <td class="textdangky rowdangky">
                        Sở thích
                    </td>
                    <td class="rowdangky">
                        <asp:TextBox ID="txtSothich" runat="server"></asp:TextBox>
                    </td>
                    <td class ="rowdangky">
                         <asp:RequiredFieldValidator ID="rfvSothich" runat="server" ControlToValidate="txtSothich" ErrorMessage="Nhập sở thích" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center;" class="rowdangky">
                        <asp:Button ID="btnDangky" runat="server" Text="Đăng ký" OnClick="btnDangky_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center;" class="rowdangky">
                        <asp:Label ID="lblChucmung" runat="server" Text="" Font-Bold="true" ForeColor="White"></asp:Label><br />
                        <asp:Label ID="lblThongbao" runat="server" Text="Thông báo" ForeColor="White"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="rowdangky">
                        <asp:ValidationSummary ID="vsTomtatloi" runat="server" ForeColor="Red" CssClass="margin"/>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
