/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package api;

import jakarta.servlet.ServletConfig;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.util.ArrayList;
import model.Task;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Matheus
 */
@WebServlet(name = "TaskServlet", urlPatterns = {"/taskss"})
public class TaskServlet extends HttpServlet {
    
    private JSONObject getJSONBody(BufferedReader reader) throws IOException{
        StringBuilder buffer = new StringBuilder();
        String line = null;
        while ((line = reader.readLine()) != null) {
            buffer.append(line);
        }
        return new JSONObject(buffer.toString());
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        JSONObject file = new JSONObject();
        try {
            file.put("exception",Task.exception);
            ArrayList<Task> list = Task.getList();
            JSONArray arr = new JSONArray();
            for(Task t: list){
                JSONObject o = new JSONObject();
                o.put("title", t.getTitle());
                arr.put(o);
            }
            file.put("list", arr);
        }catch(Exception ex){
            response.setStatus(500);
            file.put("error", ex.getLocalizedMessage());
        }
        response.getWriter().print(file.toString());
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        JSONObject file = new JSONObject();
        try {
            JSONObject body = getJSONBody(request.getReader());
            String title = body.getString("title");
            if(title != null){
                Task.addTask(title);
            }
            ArrayList<Task> list = Task.getList();
            JSONArray arr = new JSONArray();
            for(Task t: list){
                JSONObject o = new JSONObject();
                o.put("title", t.getTitle());
                arr.put(o);
            }
            file.put("list", arr);
        }catch(Exception ex){
            response.setStatus(500);
            file.put("error", ex.getLocalizedMessage());
        }
        response.getWriter().print(file.toString());
    }

    /**
     * Handles the HTTP <code>DELETE</code> method.
     * 
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        JSONObject file = new JSONObject();
        try {
            String title = request.getParameter("title");
            Task.removeTask(title);
            ArrayList<Task> list = Task.getList();
            JSONArray arr = new JSONArray();
            for(Task t: list){
                JSONObject o = new JSONObject();
                o.put("title", t.getTitle());
                arr.put(o);
            }
            file.put("list", arr);
        }catch(Exception ex){
            response.setStatus(500); //Internal error
            file.put("error", ex.getLocalizedMessage());
        }
        response.getWriter().print(file.toString());
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        Task.createTable();
    }// </editor-fold>

}
