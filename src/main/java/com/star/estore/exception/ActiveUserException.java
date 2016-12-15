package com.star.estore.exception;

/**
 * Created by hp on 2016/11/29.
 */
public class ActiveUserException extends Exception{
    public ActiveUserException(){
        super();
    }
    public ActiveUserException(String message,Throwable cause){
        super(message,cause);
    }
    public ActiveUserException(String message){
        super(message);
    }
    public ActiveUserException(Throwable cause){
        super(cause);
    }
}
