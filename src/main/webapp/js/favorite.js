/**
 *
 * Created by hp on 2016/12/13.
 */
$(document).ready(function () {
        //load("http://localhost:8888/product?method=findAll");
   $.getJSON("http://localhost:8888/fav?method=findAll",function (ps) {
     $.each(ps,function(index){
        $("#favorite").after(
            "<div class='mine row'>"+
            "<div class='mine-img col-3'>"+
            "<img src='http://localhost:8888/"+ps[index].imgurl+"' />"+
            "</div><div class='mine-txt col-9'>"+
            "<h3>宝贝名称:"+ps[index].name+"<button>取消收藏</button></h3>"+
            "<p>商品详情："+ps[index].description+"</p>"+
            "<p>商品状态：出售中</p>"+
            "</div></div>"
            );
     })
        });

});