
$(document).ready(function () {
    $("#twitter_box").twitterSearch({
        term: 'from:nationaalkompas',
        title: 'Volg @nationaalkompas op twitter:',
        titleLink: 'http://twitter.com/#!/nationaalkompas',
        birdLink: 'http://twitter.com/#!/nationaalkompas',
        bird: true,

        colorExterior: '#e1eddb',
        colorInterior: '#e1eddb',
        css: { img: { width: '50px', height: '50px' }, bird: { left: '0px', top: '5px'} }
    });
    $('.cycle').cycle({ fx: 'fade',
        speed: '2000',
        timeout: 7000,
        slideExpr: 'div'
    });

});