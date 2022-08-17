using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;

namespace PresupuestoFamiliar_HowardJ
{
    public class ClsUsuario
    {

        private static string email { get; set; }
        
        private static string clave { get; set; }
        private static string nombre { get; set; }
        private static string cedula { get; set; }
        private static string apellido { get; set; }


        //Constructor
        public ClsUsuario (string correo, string clav, string nom, string ced, string apell)
        {
            email = correo;
            
            clave = clav;
            nombre = nom;
            cedula = ced;
            apellido = apell;

        }

        public static string GetEmail() { return email; }
        
        public static string GetClave() { return clave; }
        public static string GetApellido() { return apellido; }
        public static string GetNombre() { return nombre; }
        public static string GetCedula() { return cedula; }


        public static void setEmail (string correo)
        {
            email = correo;
        }
        
        public static void setClave (string clav)
        {
            clave = clav;
        }
        public static void setApellido(string apell)
        {
            apellido = apell;
        }
        public static void setNombre(string nom)
        {
            nombre = nom;
        }
        public static void setCedula(string ced)
        {
            cedula = ced;
        }

         public static int RegistroUsuario()
          {
              int retorno = 0;
              int tipo = 0;
              SqlConnection Conn = new SqlConnection();

              try
              {
                  using (Conn = Clases.DBconn.obtenerConexion())
                  {
                      SqlCommand cmd = new SqlCommand("Registro", Conn)
                      {
                          CommandType = CommandType.StoredProcedure
                      };
                      cmd.Parameters.Add(new SqlParameter("@cedula", cedula));
                      cmd.Parameters.Add(new SqlParameter("@nombre", nombre));
                      cmd.Parameters.Add(new SqlParameter("@Apellido", apellido));
                      cmd.Parameters.Add(new SqlParameter("@email", email));
                      cmd.Parameters.Add(new SqlParameter("@clave", clave));
                      

                    using (SqlDataReader reader = cmd.ExecuteReader())
                      {
                          if (reader.Read())
                          {
                              retorno = 1;
                          }    
                      }
                  }
                
            } catch (Exception ex)
            {
                
            }
            return retorno;

        }

    }
}