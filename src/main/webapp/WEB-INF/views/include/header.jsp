<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.sticky {	
			width:100%;
            position: fixed;
            top: 0;
            margin: 0 auto;
		   left: 0;
		   right: 0;
		   z-index:1;
	
            
        }
</style>
<script>
/* $(document).ready(function() {
	var navbar = $('.navbar');
function scroll() {
    if ($(window).scrollTop() > navbar.height()) {
        $('.navbar').addClass('sticky');
        console.log(navbar.width());
        
        
    } else {
        $('.navbar').removeClass('sticky');
        
        
    }


}

document.onscroll = scroll;
}); */
</script>

