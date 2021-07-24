function openTab(evt, tabName) {
    var y = window.matchMedia("(max-width: 600px)");
    var i, x, tablinks;

    if (y.matches) {
        x = document.getElementsByClassName("tab-item-mobile");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }

        tablinks = document.getElementsByClassName("tab__title-mobile");
        for (i = 0; i < x.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" tab__active", "");
        }

        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.firstElementChild.className += " tab__active";
    } else {
        x = document.getElementsByClassName("tab-item");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tab__title");
        for (i = 0; i < x.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" tab__active", "");
        }

        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.firstElementChild.className += " tab__active";
    }
}

// accordion
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function () {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.maxHeight) {
            panel.style.maxHeight = null;
        } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
        }
    });
}

function off() {
    document.getElementById("overlay-video").style.display = "none";
    $(document).ready(function () {
        $(".play-video").on("click", function (ev) {
            $("#video")[0].src += "&autoplay=1";
            ev.preventDefault();
        });
    });
}

function myFunction(x) {
    if (x.matches) { // If media query matches

    } else {
        document.getElementById("Overview").style.display = 'block';
        var des = document.getElementById("des");
        des.classList.add("tab__active");

    }
}
var x = window.matchMedia("(max-width: 600px)")
myFunction(x)
x.addListener(myFunction)
