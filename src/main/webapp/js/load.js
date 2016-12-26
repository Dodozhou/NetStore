/**
 *
 * Created by hp on 2016/12/13.
 */
$(document).ready(function () {
        //load("http://localhost:8888/product?method=findAll");
   $.getJSON("http://localhost:8888/product?method=findAll",function (ps) {
     $.each(ps,function(index){
        $("#page_hot").after(
            "<div class='col-12'> <div class='shangpin1' >"+
         "<a href='http://localhost:8888/product?method=findById&id="+ps[index].id+"' style='display: block;'>"+
         "<div class='img'>"+
         "<img  src='http://localhost:8888/"+ps[index].imgurl+"'/>"+
         "</div> <div class='description'>"+
         "<span>卖家&nbsp;:"+ps[index].owner+"</span>"+
         "<strong> &nbsp; 卖家的昵称</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
         "<span>等级&nbsp;:&nbsp;&nbsp;&nbsp;</span>"+
         "<img src='images/Vi.png'/><br/>"+
         "<span>Q Q&nbsp;:&nbsp;</span>"+
         "<span>"+ps[index].QQ+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
         "<span>联系方式&nbsp;:&nbsp;</span>"+
         "<span>"+ps[index].phone+"</span><br/>"+
         "<span>宝贝名称&nbsp;:&nbsp;</span> <span>"+ps[index].name+"<br>"+"宝贝描述 : "+ps[index].description+"</span><br/>"+
         "￥&nbsp;<span style='color:red;'>"+ps[index].price+"</span> 元"+
         "</div> </a> </div> </div>"
            );
     })
        });

    $.getJSON("http://localhost:8888/pur?method=find12",function (pu) {
        $.each(pu,function(index){
            $("#purchase_show").after(
                "<p><a href='purchase_information.jsp#"+pu[index].id+
                "'>"+
                pu[index].description+"  &&  ￥："+pu[index].price+
                "</a></p>"
                );
        })
    });


});