/*const slides =  document.querySelector(".slides");
let slide = slides.children



MakeClone();

function MakeClone() {
	for(let i = 0; i <)
}
*/


const categoryDepth1DOM = document.querySelector("#category_depth1");
const totalLectureDOM = document.querySelector("#total_lecture");
categoryDepth1DOM.addEventListener("click", function(e) {
	if (totalLectureDOM == e.target) {
		location.href = "/ChunjaeProject/mainPage/Main.do";
	} else if (e.target.tagName == "LI") {
        if (e.target.children[0].tagName == "I") {
              if (!e.target.children[1].style.display || e.target.children[1].style.display == "none" ) {
                e.target.children[1].style.display = "block";
             } else e.target.children[1].style.display = "none";
          }
      }
}, false)
    
const category_list = document.querySelectorAll(".category_depth2 li");
for(i=0;i<category_list.length;i++){
	category_list[i].addEventListener("click",function(e){
		const category2 = this.textContent;
		location.href = "/ChunjaeProject/mainPage/Main.do?category2=" + category2;
	}, false);
}
const lecture_list = document.querySelectorAll(".lecture_content_wrap");
const lecture_idx = document.querySelectorAll(".lecture_idx");
//for(i=0;i<lecture_list.length;i++){
//	lecture_list[i].addEventListener("click",function(e){
//		console.log(lecture_idx[i]);
//		window.location.href = "/ChunjaeProject/lecture/lecture.do?no=" + lecture_idx[i];
//	});
//}