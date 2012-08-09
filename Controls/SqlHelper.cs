using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


   /// <summary>
   /// Contains helper procedure for executing stored procedures against a SQL Server database
   /// </summary>
   public class SqlHelper
   {
      private static string _connection;

      /// <summary>
      /// Database connection string
      /// </summary>
      public static string ConnectionString
      {
         get 
         {
            if (_connection == null)
            {
                if (string.IsNullOrEmpty(ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString))
                {
                    throw new Exception("Connection string not set.");
                }
                else
                {
                    return ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                }
            }
            return _connection; 
         }
         set 
         {
            if (value == null)
            {
               throw new ArgumentNullException("Connection", "Connection string cannot be set to null.");
            }
            _connection = value; 
         }
      }

      /// <summary>
      /// Executes a stored procedure
      /// </summary>
      /// <param name="procedureName">procedure name</param>
      /// <param name="parameters">parameters</param>
      public static void ExecuteNonQueryProcedure(string procedureName, SqlParameter[] parameters)
      {
         using (SqlConnection connection = new SqlConnection(ConnectionString))
         {
            SqlCommand cmd = new SqlCommand(procedureName, connection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddRange(parameters);
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
         }
      }

      /// <summary>
      /// Executes a scalar stored procedure
      /// </summary>
      /// <param name="procedureName">procedure name</param>
      /// <param name="parameters">parameters</param>
      public static object ExecuteScalarProcedure(string procedureName, SqlParameter[] parameters)
      {
         using (SqlConnection connection = new SqlConnection(ConnectionString))
         {
            SqlCommand cmd = new SqlCommand(procedureName, connection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddRange(parameters);
            connection.Open();
            object result = cmd.ExecuteScalar();
            connection.Close();
            return result;
         }
      }

      /// <summary>
      /// Executes a stored procedure that returns a dataset
      /// </summary>
      /// <param name="procedureName">procedure name</param>
      /// <param name="parameters">parameters</param>
      public static DataSet ExecuteQueryProcedure(string procedureName, SqlParameter[] parameters)
      {
         
             return ExecuteQueryProcedure( procedureName,  parameters,  ConnectionString);
      }
      public static DataSet ExecuteQueryProcedure(string procedureName, SqlParameter[] parameters, string dbConnectionString)
      {
          using (SqlConnection connection = new SqlConnection( dbConnectionString))
          {
              //todo parametriseren
              connection.Open();
              SqlCommand cmdArith = new SqlCommand("SET ARITHABORT ON", connection);
              cmdArith.CommandType = System.Data.CommandType.Text;
              cmdArith.ExecuteNonQuery();
              //SqlCommand cmdRecompile = new SqlCommand("SET RECOMPILE ON", connection);
              //cmdRecompile.CommandType = System.Data.CommandType.Text;
              //cmdRecompile.ExecuteNonQuery();
 
              SqlCommand cmd = new SqlCommand(procedureName, connection);
                            cmd.CommandType = System.Data.CommandType.StoredProcedure;
                            cmd.Parameters.AddRange(parameters);
              SqlDataAdapter adapter = new SqlDataAdapter(cmd);
              DataSet ds = new DataSet();
              adapter.Fill(ds);
              return ds;
          }
      }
   }

 /// <author>Jan de Bruin</author> 
    /// <createdate>13 juni 2003</createdate>
    /// <summary>In deze Class allerlei functionaliteit om met de database te communiceren, zoals een verbinding en een mogelijkheid om sql statements uit te voeren op de database.</summary>

    public class DataAccessHelper
    {
        //connectie string db
        private string _ConnectString;
        // verbinding
        private System.Data.SqlClient.SqlConnection _Connection;
        /// <summary>constructor</summary>
        /// <param name='ConnectString'>(Optioneel)Database connectiestring voor SQL Server database.</param>
        public DataAccessHelper(string ConnectString)
        {

            try
            {
                // connectiestring bepalen
                // als in design mode (IDE) dan is de connectiestring leeg en dan default connectie geven
                if (string.IsNullOrEmpty(ConnectString))
                {
                    _ConnectString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

                }
                else
                {
                    _ConnectString = ConnectString;
                }
                // verbinding opzetten
                _Connection = new System.Data.SqlClient.SqlConnection(_ConnectString);

                _Connection.Open();
            }
            catch (Exception DataAccessError)
            {
                throw (DataAccessError);
            }
        }
        /// <summary>Verbinding met database sluiten.</summary>
        public void Dispose()
        {

            if (_Connection.State != System.Data.ConnectionState.Closed)
            {

                _Connection.Close();
                _Connection.Dispose();
            }
        }
        /// <summary>Verbinding met database sluiten.</summary>
        public void Close()
        {

            Dispose();
        }


        /// <summary>Geeft het connection object terug.</summary>
        public System.Data.SqlClient.SqlConnection Connection
        {

            get { return _Connection; }
        }
        /// <summary>Geeft een SqlCommand object terug op basis van een sql statement</summary>
        /// <param  name='SqlStatement'>Sql statement waarop het command object gebaseerd dient te worden.</param>
        public System.Data.SqlClient.SqlCommand getCommand(string SqlStatement, System.Data.CommandType Type)
        {


            SqlCommand tmpCommand = new SqlCommand();
            tmpCommand.Connection = _Connection;
            tmpCommand.CommandText = SqlStatement;
            tmpCommand.CommandType = Type;
            return tmpCommand;

        }
        /// <summary>
        /// Returns a sql parameter, based on input values.
        /// </summary>
        /// <param name="ParameterName"></param>
        /// <param name="Type"></param>
        /// <param name="Value"></param>
        /// <returns></returns>
        public System.Data.SqlClient.SqlParameter GetParameter(string ParameterName, System.Data.ParameterDirection Direction, System.Data.SqlDbType Type, object Value, Boolean isNullable)
        {
            SqlParameter oParameter = new SqlParameter();
            oParameter.Direction = Direction;
            oParameter.ParameterName = ParameterName;
            oParameter.SqlDbType = Type;
            if (Direction == System.Data.ParameterDirection.Input)
            {
                if (isNullable & Value == null)
                {
                    oParameter.Value = DBNull.Value;
                }
                else
                {
                    oParameter.Value = Value;
                }

            }
            return oParameter;
        }

        /// <summary>Geeft SqlDataReader object terug op basis van sql statement</summary>
        /// <param type='String' name='SqlStatement'>Sql statement waarop het DataReader object gebaseerd dient te worden.</param>
        public System.Data.SqlClient.SqlDataReader getDataReader(string SqlStatement)
        {


            SqlCommand tmpCommand = new SqlCommand();
            tmpCommand.Connection = _Connection;
            tmpCommand.CommandText = SqlStatement;
            tmpCommand.CommandType = CommandType.Text;
            SqlDataReader tmpDataReader = default(SqlDataReader);
            tmpDataReader = tmpCommand.ExecuteReader();

            return tmpDataReader;
        }
        /// <summary>Voert een sql statement uit op de database</summary>
        /// <param type='String' name='SqlStatement'>Sql statement wdat uitgevoerd dient te worden.</param>
        public void executeSql(string SqlStatement)
        {

            try
            {
                SqlCommand tmpCommand = new SqlCommand();
                tmpCommand.Connection = _Connection;
                tmpCommand.CommandText = SqlStatement;
                tmpCommand.CommandType = CommandType.Text;
                tmpCommand.ExecuteNonQuery();
            }
            catch (Exception DataAccessError)
            {
                throw (DataAccessError);
            }
        }

        /// <summary>Vult een dataset op basis van een SqlClient.SqlCommand object. Werking is beperkt tot het gebruik van stored procedures.</summary>
        public System.Data.DataSet FillDataset(System.Data.SqlClient.SqlCommand oCommand)
        {

            oCommand.CommandType = CommandType.StoredProcedure;



            System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter();
            adapter.SelectCommand = oCommand;
            DataSet ds = new DataSet();
            try
            {
                adapter.Fill(ds);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            finally
            {
                //Close connection if it's was opened here
                //If (alreadyopen) Then
                if (oCommand.Connection.State == ConnectionState.Open)
                {
                    oCommand.Connection.Close();
                }
            }
            // End If
            return ds;
        }
        /// <summary>
        /// Methode waarmee een embedded script uitgevoerd kan worden op de database, dit tbv automatische configuratie.
        /// </summary>
        /// <param name="ScriptName">Naam van de embedded resource</param>
        public void ExecuteEmbeddedScript (string ScriptName){
            if (ScriptName.IndexOf(".sql") == -1) { 
                throw (new Exception("Only execution of sql files allowed"));
            }
            else
            {
               // string[] names = this.GetType().Assembly.GetManifestResourceNames();

                System.IO.Stream stream = System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream(ScriptName);
                System.IO.StreamReader reader = new System.IO.StreamReader(stream);
                string scriptText = reader.ReadToEnd().Replace("go", "GO").Replace("Go", "GO");
                //split the script on "GO" commands
                string[] splitter = new string[] { "GO\r\n" };
                string[] commandTexts = scriptText.Split(splitter,
                  StringSplitOptions.RemoveEmptyEntries);
                foreach (string commandText in commandTexts)
                {
                    //execute commandText
                    executeSql(commandText);
                }
            }
        }

    }