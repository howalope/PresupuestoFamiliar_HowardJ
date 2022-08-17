<%@ Page Title="" Language="C#" MasterPageFile="~/InicioMaster.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="PresupuestoFamiliar_HowardJ.menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <!DOCTYPE html>
    <html lang ="en">
        <head>
            <meta charset="utf-8" />
            <meta name="viewpoint" content="width=devicewidth, initial-scale=1.0" />
            <title>Presupuesto Familiar</title>
        </head>
        <body>
            <div class="container">
                <p id="error_msg"></p>
                <div class="title">
                    <h1 class="title">
                        Mi Presupuesto <a href="#"><i class ="fa fa-money"></i></a>
                    </h1>
                </div>
                <h3>Nueva Transacción</h3>
                <form id="form">
                    <div class="form-control">
                        <label for="text"> Descripción</label>
                        <input type="text" id="text" onfocus="this.value=''" placeholder="Ingrese Descripción ..." />
                    </div>
                    <div class="form-control">
                        <label for="amount">Monto (+Ingreso/-Egreso) <br /></label>
                        <input type="number" id="amount" onfocus="this.value=''" placeholder="Ingrese Monto ..." />
                    </div>
                    <button class ="btn">Agregar Transacción</button>
                </form>
                <br />


            </div>
        </body>
    </html>
</asp:Content>
