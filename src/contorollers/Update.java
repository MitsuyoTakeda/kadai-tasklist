package contorollers;

import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Task;
import util.DBUtil;

/**
 * Servlet implementation class Update
 */
@WebServlet("/update")
public class Update extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");

        if(_token != null && _token.equals(request.getSession().getId())){
            EntityManager em = DBUtil.createEntityManager();

            // セッションスコープからタスクのIDを取得して
            // 該当のIDのメッセージ1件のみを取得
            Task task = em.find(Task.class, (Integer)(request.getSession().getAttribute("task_id")));

            // フォームの内容を上書き
            String content = request.getParameter("content");
            task.setContent(content);

            Timestamp update_at = new Timestamp(System.currentTimeMillis());
            task.setUpdate_at(update_at);

            // データベース更新
            em.getTransaction().begin();
            em.getTransaction().commit();
            request.getSession().setAttribute("flush", "更新が完了しました");
            em.close();

            // セッションスコープから不要になったIDを削除
            request.getSession().removeAttribute("task_id");

            // indexページにリダイレクト
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

}
