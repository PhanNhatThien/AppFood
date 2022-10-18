$(document).ready(function(){
    //js header
//    $(window).scroll(function() {
//        if($(this).scrollTop()){
//            $('header').addClass('sticky');
//        }else{
//            $('header').removeClass('sticky');
//        }
//    })

    //js gototop
    $("#gototop").hide();
    $(window).scroll(function(){
        if($(this).scrollTop() >= 500){
            $("#gototop").show("slow");
        }else{
            $("#gototop").hide("slow");
        }
    })

    $("#gototop").click(function() {
        $("html, body").animate({
            scrollTop: 0
        },1000);
        
    })


    //js carousel

    var splide = new Splide('.splide', {
            type: 'loop',
            perPage: 5,
            rewind: true,

        });

    splide.mount();
}) 



