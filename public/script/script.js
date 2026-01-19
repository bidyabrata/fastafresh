/*---header animation---*/
function init() {
    window.addEventListener('scroll', function(e) {
        var distanceY = window.pageYOffset || document.documentElement.scrollTop,
            shrinkOn = 50,
            header = document.querySelector("header");
        if (distanceY > shrinkOn) {
            classie.add(header, "smaller");
        } else {
            if (classie.has(header, "smaller")) {
                classie.remove(header, "smaller");
            }
        }
    });
}
window.onload = init();
/*---header animation end---*/

/*---input---*/
(function() {
    // trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
    if (!String.prototype.trim) {
        (function() {
            // Make sure we trim BOM and NBSP
            var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
            String.prototype.trim = function() {
                return this.replace(rtrim, '');
            };
        })();
    }

    [].slice.call(document.querySelectorAll('input.input__field')).forEach(function(inputEl) {
        // in case the input is already filled..
        if (inputEl.value.trim() !== '') {
            classie.add(inputEl.parentNode, 'input--filled');
        }

        // events:
        inputEl.addEventListener('focus', onInputFocus);
        inputEl.addEventListener('blur', onInputBlur);
    });

    function onInputFocus(ev) {
        classie.add(ev.target.parentNode, 'input--filled');
    }

    function onInputBlur(ev) {
        if (ev.target.value.trim() === '') {
            classie.remove(ev.target.parentNode, 'input--filled');
        }
    }
})();
/*---input end---*/

$(function() {
    $('.popup-modal').magnificPopup({
        type: 'inline',
        preloader: false,
        focus: '#username',
        modal: true
    });
    $(document).on('click', '.popup-modal-dismiss', function(e) {
        e.preventDefault();
        $.magnificPopup.close();
    });
});

$(document).ready(function() {
    /*--home testimonials--*/
    $('.bnrWrp').slick({
        dots: false,
        autoplay: true,
        responsive: [{
            breakpoint: 575,
            settings: {
                dots: true,
                arrows: false
            }
        }]
    });

    $('.toggle').click(function(e) {
        e.preventDefault();

        var $this = $(this);

        if ($this.next().hasClass('show')) {
            $this.removeClass('show');
            $this.next().removeClass('show');
            $this.next().slideUp(350);
        } else {
            $this.parent().parent().find('li .inner').removeClass('show');
            $this.parent().parent().find('li .inner').slideUp(350);
            $this.toggleClass('show');
            $this.next().toggleClass('show');
            $this.next().slideToggle(350);
        }
    });


    /*-----login-----*/
    $(document).on('click', '#openSignup', function(e) {
        e.preventDefault();
        $(".forLogin").css("display", "block");
        $(".forSignUp").css("display", "none");
    });
    $(document).on('click', '#openLogin', function(e) {
        e.preventDefault();
        $(".forLogin").css("display", "none");
        $(".forSignUp").css("display", "block");
    });
    $(document).on('click', '#checkForOtp', function() {
        $(".otpWrap").css("display", "block");
        $(".checkForOtp").css("display", "none");
    });
    /*-----login end-----*/

    /*document ready end*/
});