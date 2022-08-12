using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PresupuestoFamiliar_HowardJ
{
    public class ClsUsuario
    {

        private static string email { get; set; }
        private static string tipoUsuario { get; set; }
        private static string clave { get; set; }

        //Constructor
        public ClsUsuario (string correo, string tipo, string clav)
        {
            email = correo;
            tipoUsuario = tipo;
            clave = clav;
        }

        public static string GetEmail() { return email; }
        public static string GetTipoUsuario() { return tipoUsuario; }
        public static string GetClave() { return clave; }

        public static void setEmail (string correo)
        {
            email = correo;
        }
        public static void setTipoUsuario (string tipo)
        {
            tipoUsuario = tipo;
        }
        public static void setClave (string clav)
        {
            clave = clav;
        }
    }
}