const imgSlideDom = document.querySelector("#img_slide");
imgSlideDom.addEventListener("click", function(e) {
    imgSlideDom.style.background = "url('../assets/image/main_banner02.png') center"
}, false);

const categoryDepth1DOM = document.querySelector("#category_depth1");
categoryDepth1DOM.addEventListener("click", function(e) {
    if (!(document.querySelector("#total_lecture") == e.target) && e.target.tagName == "LI") {
        if (e.target.children[0].tagName == "I") {
            if (!e.target.children[1].style.display || e.target.children[1].style.display == "none" ) {
                e.target.children[1].style.display = "block";
            } else e.target.children[1].style.display = "none";
        }
    }
}, false)