using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PresupuestoFamiliar_HowardJ
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BRegistrar_Click(object sender, EventArgs e)
        {
            ClsUsuario.setNombre(TNombre.Text);
            ClsUsuario.setApellido(TApellido.Text);
            ClsUsuario.setEmail(TCorreo1.Text);
            ClsUsuario.setClave(TClave1.Text);
            ClsUsuario.setCedula(TCedula.Text);
            

            int resultado = ClsUsuario.RegistroUsuario();
            
            if (resultado > 0)
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification: Usuario has sido Registrado')");
            }
            else
            {

            }
            return;
        }
    }
}