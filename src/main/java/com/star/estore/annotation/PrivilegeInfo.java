package com.star.estore.annotation;

import java.lang.annotation.*;

/**
 * Created by hp on 2016/12/4.
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Inherited
public @interface PrivilegeInfo {
    String value();//权限名称
}
