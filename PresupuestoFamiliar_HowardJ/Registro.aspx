<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="PresupuestoFamiliar_HowardJ.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu</title>
    <link rel="stylesheet" type="text/css" href="css/desingMaster.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <h2>
            Registro de Usuario</h2>
        <p>
            Nombre:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TNombre" runat="server" Width="133px"></asp:TextBox>
        </p>
        <p>
            Cédula:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TCedula" runat="server" Width="133px"></asp:TextBox>
        </p>
        <p>
            Apellido:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TApellido" runat="server" Width="133px"></asp:TextBox>
        </p>
        <p>
            Correo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TCorreo1" runat="server" Width="133px"></asp:TextBox>
        </p>
        <p>
            Clave:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TClave1" runat="server" Width="133px"></asp:TextBox>
        </p>
        <p>
            Tipo Usuario:&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Descripcion" DataValueField="Descripcion">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PresupuestoConnectionString %>" SelectCommand="SELECT [Descripcion] FROM [TipoUsuario]"></asp:SqlDataSource>
        </p>
        <asp:Button ID="BAgregar" runat="server" Height="35px" OnClick="BAgregar_Click" Text="Registrar Usuario" Width="197px" />
    </form>
</body>
</html>
