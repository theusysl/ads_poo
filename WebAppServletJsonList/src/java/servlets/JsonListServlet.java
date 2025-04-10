package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "JsonListServlet", urlPatterns = {"/list.json"})
public class JsonListServlet extends HttpServlet {
    private ArrayList<String> list = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        if (request.getParameter("add")!=null){
            String text = request.getParameter("text");
            list.add(text);
        }
        if (request.getParameter("remove")!=null){
            int i = Integer.parseInt(request.getParameter("i"));
            list.remove(i);
        }
        
        try (PrintWriter out = response.getWriter()) {
            JSONObject obj = new JSONObject();
            obj.put("dateTime", new Date());
            JSONArray arr = new JSONArray();
            for(String e: list){
                arr.put(e);
            }
            obj.put("list", arr);
            out.print(obj.toString());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
