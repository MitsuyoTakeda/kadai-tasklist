package models.validators;

import models.Task;

public class TaskValidator {

    public static String validate(Task t){

        String error = null;

        String content_error = _validateContent(t.getContent());
        if(!content_error.equals("")){
            error = content_error;
        }

        return error;
    }

    // タスクの必須入力チェック
    private static String _validateContent(String content){
        if(content == null || content.equals("")){
            return "タスクを入力してください";
        }

        return "";
    }
}
