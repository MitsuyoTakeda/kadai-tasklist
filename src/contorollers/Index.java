package contorollers;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Task;
import util.DBUtil;

/**
 * Servlet implementation class Index
 */
@WebServlet("/index")
public class Index extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManager em = DBUtil.createEntityManager();

        // ページネーション処理用。ページ数を取得（デフォルトは1ページ）
        int page = 1;

        try {
            page = Integer.parseInt(request.getParameter("page"));

        } catch(NumberFormatException e) {

        }


        // 1ページの表示件数が10件になるようにする
        List<Task> tasks = em.createNamedQuery("getAllTasks", Task.class)
                                  .setFirstResult(10 * (page -1))
                                  .setMaxResults(10)
                                  .getResultList();

        // 全件数を取得
        long tasks_count = (long)em.createNamedQuery("getAllTasksCount", Long.class)
                                      .getSingleResult();

        em.close();

        request.setAttribute("tasks", tasks);
        request.setAttribute("tasks_count", tasks_count);
        request.setAttribute("page", page);

        // フラッシュメッセージがセッションスコープにセットされていたら
        // リクエストスコープに保存＋セッションスコープのフラッシュメッセージを削除
        if(request.getSession().getAttribute("flush") != null){
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/tasks/index.jsp");
        rd.forward(request, response);

    }
}
