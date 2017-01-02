/**
 * Created by hp on 2016/12/17.
 */

$(document).ready(function () {
    //想求购信息页面装填求购信息
    $.getJSON("http://localhost:8888/pur?method=findAll",function (pa) {
        $.each(pa,function(index){
            $("#purchase_show").after(
                "<div class='wantbuy col-12' id='"+pa[index].id+"'>"+
            "<h2>"+pa[index].owner+"想买的商品:"+pa[index].name+"</h2>"+
            "<span style='float: right'>￥："+pa[index].price+"</span>"+
            "<p>"+
            pa[index].description+
            "</p>"+
            "QQ:"+pa[index].QQ+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+"tel:"+pa[index].phone+
            "<br><time  pubdate='true' class='pubdate'>"+pa[index].update_time+"</time>"+
            "</div>"
            );
        })
    });

});