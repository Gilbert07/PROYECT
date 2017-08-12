package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.*;
import java.net.*;
import java.sql.*;

public final class newjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        \n");

// declarando y creando objetos globales
Connection canal = null;
ResultSet tabla= null;
Statement instruccion=null;
String sitiobase = "c:/pfacil/mibase.mdb";
String strcon= "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + sitiobase;
// detectando y cargando el objeto submit de html
if(request.getParameter("OK") != null)
{
// abriendo canal o enlace en su propio try-catch
try { Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
canal=DriverManager.getConnection(strcon);
instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
ResultSet.CONCUR_UPDATABLE);
} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};
//leyendo tabla en disco y pasandola al resultset
try { tabla = instruccion.executeQuery("select * from mitabla");
// empezando a construir una tabla html
out.println("<TABLE Border=10 CellPadding=5><TR>");
out.println("<th bgcolor=Green>CLAVE</th><th bgcolor=White>NOMBRE</th><th bgcolor=Red>EDAD</th></TR>");
// mandando resultset a una tabla html
// y ciclo de lectura del resultset
while(tabla.next()) {
out.println("<TR>");
out.println("<TD>"+tabla.getString(1)+"</TD>");
out.println("<TD>"+tabla.getString(2)+"</TD>");
out.println("<TD>"+tabla.getString(3)+"</TD>");
out.println("</TR>"); }; // fin while
out.println("</TABLE></CENTER></DIV></HTML>");
// cerrando resultset
tabla.close(); instruccion.close(); canal.close();} //fin try no usar ; al final de dos o mas catchs
catch(SQLException e) {};
};
// construyendo forma dinamica
out.println("<FORM ACTION=prog33.jsp METHOD=post>");
out.println("<INPUT TYPE=SUBMIT NAME=OK VALUE=CONSULTA><BR>");
out.println("</FORM>");

      out.write("\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
