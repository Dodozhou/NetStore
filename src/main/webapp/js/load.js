/**
 *
 * Created by hp on 2016/12/13.
 */
$(document).ready(function () {
        //新品推荐
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
    //求购轮播
    $.getJSON("http://localhost:8888/pur?method=find12",function (pu) {
        $.each(pu,function(index){
            $("#purchase_show").after(
                "<p><a href='pur_info.jsp#"+pu[index].id+
                "'>"+
                pu[index].description+"  &&  ￥："+pu[index].price+
                "</a></p>"
                );
        })
    });
    //校园代步 transport
    $.getJSON("http://localhost:8888/product?method=findByCategory&category=transport",function (ps1) {
        $.each(ps1,function(index){
            $("#transport").after(
                "<div class='col-12'> <div class='shangpin1' >"+
                "<a href='http://localhost:8888/product?method=findById&id="+ps1[index].id+"' style='display: block;'>"+
                "<div class='img'>"+
                "<img  src='http://localhost:8888/"+ps1[index].imgurl+"'/>"+
                "</div> <div class='description'>"+
                "<span>卖家&nbsp;:"+ps1[index].owner+"</span>"+
                "<strong> &nbsp; 卖家的昵称</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>等级&nbsp;:&nbsp;&nbsp;&nbsp;</span>"+
                "<img src='images/Vi.png'/><br/>"+
                "<span>Q Q&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].QQ+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>联系方式&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].phone+"</span><br/>"+
                "<span>宝贝名称&nbsp;:&nbsp;</span> <span>"+ps1[index].name+"<br>"+"宝贝描述 : "+ps1[index].description+"</span><br/>"+
                "￥&nbsp;<span style='color:red;'>"+ps1[index].price+"</span> 元"+
                "</div> </a> </div> </div>"
            );
        })
    });

    //电脑 computer
    $.getJSON("http://localhost:8888/product?method=findByCategory&category=computer",function (ps1) {
        $.each(ps1,function(index){
            $("#computer").after(
                "<div class='col-12'> <div class='shangpin1' >"+
                "<a href='http://localhost:8888/product?method=findById&id="+ps1[index].id+"' style='display: block;'>"+
                "<div class='img'>"+
                "<img  src='http://localhost:8888/"+ps1[index].imgurl+"'/>"+
                "</div> <div class='description'>"+
                "<span>卖家&nbsp;:"+ps1[index].owner+"</span>"+
                "<strong> &nbsp; 卖家的昵称</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>等级&nbsp;:&nbsp;&nbsp;&nbsp;</span>"+
                "<img src='images/Vi.png'/><br/>"+
                "<span>Q Q&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].QQ+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>联系方式&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].phone+"</span><br/>"+
                "<span>宝贝名称&nbsp;:&nbsp;</span> <span>"+ps1[index].name+"<br>"+"宝贝描述 : "+ps1[index].description+"</span><br/>"+
                "￥&nbsp;<span style='color:red;'>"+ps1[index].price+"</span> 元"+
                "</div> </a> </div> </div>"
            );
        })
    });
    //数码产品 electronics
    $.getJSON("http://localhost:8888/product?method=findByCategory&category=electronics",function (ps1) {
        $.each(ps1,function(index){
            $("#electronics").after(
                "<div class='col-12'> <div class='shangpin1' >"+
                "<a href='http://localhost:8888/product?method=findById&id="+ps1[index].id+"' style='display: block;'>"+
                "<div class='img'>"+
                "<img  src='http://localhost:8888/"+ps1[index].imgurl+"'/>"+
                "</div> <div class='description'>"+
                "<span>卖家&nbsp;:"+ps1[index].owner+"</span>"+
                "<strong> &nbsp; 卖家的昵称</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>等级&nbsp;:&nbsp;&nbsp;&nbsp;</span>"+
                "<img src='images/Vi.png'/><br/>"+
                "<span>Q Q&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].QQ+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>联系方式&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].phone+"</span><br/>"+
                "<span>宝贝名称&nbsp;:&nbsp;</span> <span>"+ps1[index].name+"<br>"+"宝贝描述 : "+ps1[index].description+"</span><br/>"+
                "￥&nbsp;<span style='color:red;'>"+ps1[index].price+"</span> 元"+
                "</div> </a> </div> </div>"
            );
        })
    });
    //运动健身 exercise
    $.getJSON("http://localhost:8888/product?method=findByCategory&category=exercise",function (ps1) {
        $.each(ps1,function(index){
            $("#exercise").after(
                "<div class='col-12'> <div class='shangpin1' >"+
                "<a href='http://localhost:8888/product?method=findById&id="+ps1[index].id+"' style='display: block;'>"+
                "<div class='img'>"+
                "<img  src='http://localhost:8888/"+ps1[index].imgurl+"'/>"+
                "</div> <div class='description'>"+
                "<span>卖家&nbsp;:"+ps1[index].owner+"</span>"+
                "<strong> &nbsp; 卖家的昵称</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>等级&nbsp;:&nbsp;&nbsp;&nbsp;</span>"+
                "<img src='images/Vi.png'/><br/>"+
                "<span>Q Q&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].QQ+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>联系方式&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].phone+"</span><br/>"+
                "<span>宝贝名称&nbsp;:&nbsp;</span> <span>"+ps1[index].name+"<br>"+"宝贝描述 : "+ps1[index].description+"</span><br/>"+
                "￥&nbsp;<span style='color:red;'>"+ps1[index].price+"</span> 元"+
                "</div> </a> </div> </div>"
            );
        })
    });
    //日常用品 daily
    $.getJSON("http://localhost:8888/product?method=findByCategory&category=daily",function (ps1) {
        $.each(ps1,function(index){
            $("#daily").after(
                "<div class='col-12'> <div class='shangpin1' >"+
                "<a href='http://localhost:8888/product?method=findById&id="+ps1[index].id+"' style='display: block;'>"+
                "<div class='img'>"+
                "<img  src='http://localhost:8888/"+ps1[index].imgurl+"'/>"+
                "</div> <div class='description'>"+
                "<span>卖家&nbsp;:"+ps1[index].owner+"</span>"+
                "<strong> &nbsp; 卖家的昵称</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>等级&nbsp;:&nbsp;&nbsp;&nbsp;</span>"+
                "<img src='images/Vi.png'/><br/>"+
                "<span>Q Q&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].QQ+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>联系方式&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].phone+"</span><br/>"+
                "<span>宝贝名称&nbsp;:&nbsp;</span> <span>"+ps1[index].name+"<br>"+"宝贝描述 : "+ps1[index].description+"</span><br/>"+
                "￥&nbsp;<span style='color:red;'>"+ps1[index].price+"</span> 元"+
                "</div> </a> </div> </div>"
            );
        })
    });
    //图书素材 books
    $.getJSON("http://localhost:8888/product?method=findByCategory&category=books",function (ps1) {
        $.each(ps1,function(index){
            $("#books").after(
                "<div class='col-12'> <div class='shangpin1' >"+
                "<a href='http://localhost:8888/product?method=findById&id="+ps1[index].id+"' style='display: block;'>"+
                "<div class='img'>"+
                "<img  src='http://localhost:8888/"+ps1[index].imgurl+"'/>"+
                "</div> <div class='description'>"+
                "<span>卖家&nbsp;:"+ps1[index].owner+"</span>"+
                "<strong> &nbsp; 卖家的昵称</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>等级&nbsp;:&nbsp;&nbsp;&nbsp;</span>"+
                "<img src='images/Vi.png'/><br/>"+
                "<span>Q Q&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].QQ+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>联系方式&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].phone+"</span><br/>"+
                "<span>宝贝名称&nbsp;:&nbsp;</span> <span>"+ps1[index].name+"<br>"+"宝贝描述 : "+ps1[index].description+"</span><br/>"+
                "￥&nbsp;<span style='color:red;'>"+ps1[index].price+"</span> 元"+
                "</div> </a> </div> </div>"
            );
        })
    });
    //其他 other
    $.getJSON("http://localhost:8888/product?method=findByCategory&category=other",function (ps1) {
        $.each(ps1,function(index){
            $("#other").after(
                "<div class='col-12'> <div class='shangpin1' >"+
                "<a href='http://localhost:8888/product?method=findById&id="+ps1[index].id+"' style='display: block;'>"+
                "<div class='img'>"+
                "<img  src='http://localhost:8888/"+ps1[index].imgurl+"'/>"+
                "</div> <div class='description'>"+
                "<span>卖家&nbsp;:"+ps1[index].owner+"</span>"+
                "<strong> &nbsp; 卖家的昵称</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>等级&nbsp;:&nbsp;&nbsp;&nbsp;</span>"+
                "<img src='images/Vi.png'/><br/>"+
                "<span>Q Q&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].QQ+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                "<span>联系方式&nbsp;:&nbsp;</span>"+
                "<span>"+ps1[index].phone+"</span><br/>"+
                "<span>宝贝名称&nbsp;:&nbsp;</span> <span>"+ps1[index].name+"<br>"+"宝贝描述 : "+ps1[index].description+"</span><br/>"+
                "￥&nbsp;<span style='color:red;'>"+ps1[index].price+"</span> 元"+
                "</div> </a> </div> </div>"
            );
        })
    });




});