
package Proyecto.Dao ;

import com.sun.javafx.scene.traversal.Direction;
import java.util.Properties;
import javax.jms.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import Proyecto.Bean.BeanCliente;
import Utils.Conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;



public class Email extends Conexion {
    
    private Connection conn = null;
    private Statement puente = null;
    private ResultSet rs = null;
    private String sentencia = null;
    

    public boolean encontrado = false;
    public boolean listo = false;
    public boolean respuesta = false;
    String Mensajito;
    
    
    /*boolean Email (BeanCliente BUser) {

       

        try {
            conn = this.ObtenerConexion();
            puente = conn.createStatement();

            Mensajito = BUser.getCodigo();
            

        } catch (Exception e) {
            Logger.getLogger(DaoCliente.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;

    }*/
    
     
    // public boolean enviarCorreo(String de,String clave,String[] para,String mensaje,String asunto){
        public boolean enviarCorreo(String para, String mensaje, String asunto ) {
        boolean enviado = false;
        
           
        
        
        try {
            
           
           
            
            //ResultSet rs = puente.executeQuery("SELECT Codigo,Cedula FROM cliente WHERE Email ='" + Mensajito + "'");
            
            String de = "camilogomezmoreno87@gmail.com";
            String clave = "camilomoreno";
            mensaje = "Su contraseña es: 12345";
            asunto = "Cambio de contraseña";
            
            System.out.println("de: "+ de);
            System.out.println("clave: "+ clave);
            System.out.println("para: "+ para);
            System.out.println("mensaje: "+ mensaje);
            System.out.println("asunto: "+ asunto);
           

            String host = "smtp.gmail.com";

            Properties prop = new Properties();
            System.out.println("-------prop-------- ");
            System.out.println(prop);
            

            prop.put("mail.smtp.starttls.enable", "true");
            prop.put("mail.smtp.host", host);
            prop.put("mail.smtp.user", de);
            prop.put("mail.smtp.password", clave);
            prop.put("mail.smtp.port", 587);
            prop.put("mail.smtp.auth", "true");

            Session sesion = Session.getDefaultInstance(prop,null);

            MimeMessage message = new MimeMessage(sesion);

            message.setFrom(new InternetAddress(de));

            
               /* NOTA: para enviar correo electronico masivo*/
                
                //InternetAddress[] direcciones = new InternetAddress[para.length()];
                //for(int i=0;i<para.length();i++){
                //    direcciones[i] = new InternetAddress("para[i]");
                //}
                
                //for(int i=0;i<direcciones.length;i++){
                   /*  mensaje.addRecipient(mensaje.RecipientType. TO , new Direction[i]);*/
                //}
                
             
          message.setRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(para));

            message.setSubject(asunto); 
            message.setText(mensaje);

            Transport transport = sesion.getTransport("smtp");
           
            
            transport.connect(host,de,clave);

            transport.sendMessage(message, message.getAllRecipients());

            transport.close();

            enviado = true;

        }catch (Exception e) {
            e.printStackTrace();
        }
        
      return enviado;

    }


} 
