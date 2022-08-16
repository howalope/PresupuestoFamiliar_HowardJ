<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="PresupuestoFamiliar_HowardJ.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
   
<head runat="server">
    <link href="css/RegisterDesign.css" rel="stylesheet" />
    <title>Formulario Registro</title>
    
</head>
<body>
    <form id="form1" runat="server" >
        <section class="form-register">
            <h4>Registro de Usuarios</h4>
            Nombre:&nbsp;&nbsp;
            <asp:TextBox  ID="TNombre" runat="server" Height="21px" Width="176px"></asp:TextBox>
            <br />
            <br />
            Apellido:&nbsp;&nbsp;
            <asp:TextBox ID="TApellido" runat="server" Height="21px" Width="176px"></asp:TextBox>
&nbsp;<br />
            <br />
            Cédula:&nbsp; &nbsp; &nbsp;
            <asp:TextBox ID="TCedula" runat="server" Height="21px" Width="176px"></asp:TextBox>
            <br />
            <br />
            Correo:&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="TCorreo1" runat="server" Height="21px" Width="176px"></asp:TextBox>
            <br />
            <br />
            Clave:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="TClave1" runat="server" Height="21px" Width="176px"></asp:TextBox>
         
&nbsp;<br />
            <br />
            <div class="botons">
					<asp:Button ID="BRegistrar" class="botons" runat="server" Text="Registrar" OnClick="BRegistrar_Click" />
				    <br />
				</div>
           
            <p> <a href="Home.aspx">¿Ya tengo cuenta? Iniciar Sesión</a></p>
            </section>
    </form>
</body>
</html>