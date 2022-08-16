using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PresupuestoFamiliar_HowardJ
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BIngresar_Click(object sender, EventArgs e)
        {
            ClsUsuario.setEmail(temail.Text);
            ClsUsuario.setClave(tcontrasena.Text);

            string s = System.Configuration.ConfigurationManager.ConnectionStrings["PresupuestoConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);

            try
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand("select email, Clave from Usuario " +
                    "where email = '" + ClsUsuario.GetEmail() + "' and Clave = '" + ClsUsuario.GetClave() + "'", conexion);
                SqlDataReader registro = comando.ExecuteReader();
                if (registro.Read())
                {
                    Response.Redirect("menu.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification: Usuario no encontrado');", true);
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification: Revisar Conexión');", true);
            }

            finally
            {
                conexion.Close();
            }
        }

        protected void BRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}