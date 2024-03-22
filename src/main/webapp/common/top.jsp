<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
	<div id="top_btn"><input type="image" src="../assets/image/top.png" id="up" alt="top"></div>
	<script>
	let up = document.getElementById("up");
	up.addEventListener("click",function(){
	    window.scrollTo({
	        top:0,
	        behavior:"smooth"
	    })
	});
</script>