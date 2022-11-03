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

// xoa bo loc
function removeFilter() {
    window.location.href = window.location.href.split('?')[0]
}

function updateQueryStringParameter(key, value) {
    let uri = window.location.href
    let re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    let separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
        window.location.href = uri.replace(re, '$1' + key + "=" + value + '$2');
    } else {
        window.location.href = uri + separator + key + "=" + value;
    }
}