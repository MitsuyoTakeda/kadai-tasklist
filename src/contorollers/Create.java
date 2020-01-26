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
 * Servlet implementation class Create
 */
@WebServlet("/create")
public class Create extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Create() {
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

            // Taskのインスタンスを生成
            Task task = new Task();

            // 各プロパティにデータを代入
            String content = request.getParameter("content");
            task.setContent(content);

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            task.setCreated_at(currentTime);
            task.setUpdate_at(currentTime);

            // データベースへ保存
            em.getTransaction().begin();
            em.persist(task);
            em.getTransaction().commit();
            em.close();

            // リダイレクト処理
            response.sendRedirect(request.getContextPath() + "/index");

        }
    }

}
