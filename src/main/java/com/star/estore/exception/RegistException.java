package com.star.estore.exception;

/**
 * Created by hp on 2016/11/21.
 */
public class RegistException extends Exception {
    public RegistException(){
        super();
    }

    public RegistException(String message){
        super(message);
    }

    public RegistException(String message,Throwable cause){
        super(message,cause);
    }
    public RegistException(Throwable cause){
        super(cause);
    }

}
