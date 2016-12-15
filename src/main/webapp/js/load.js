/**
 *
 * Created by hp on 2016/12/13.
 */
$(document).ready(function () {
        //load("http://localhost:8888/product?method=findAll");
   $.getJSON("http://localhost:8888/product?method=findAll",function (ps) {
     $.each(ps,function(index){

        $("#page_hot").after("<div class='col-6'>"+
            "<div class='shangpin1' >"+
            "<img src='http://localhost:8888/"+ps[index].imgurl+"'/><br/>"+
            "<span>商品名："+ps[index].name+"</span><br>"+
            "<span>"+ps[index].description+"</span><br/>"+
            "￥&nbsp;<span style='color:red;'>"+ps[index].price+"</span> 元"+
            "<a href='http://localhost:8888/product?method=findById&id="+ps[index].id+"'>速速抢购</a>"+
            "</div></div>");
     })
        });
});