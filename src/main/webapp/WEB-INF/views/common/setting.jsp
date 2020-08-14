<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<c:set var = "path"	value = "${pageContext.request.contextPath}" />
<c:set var = "image"	value = "${path}/include/image/" />


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link href="${path}/include/css/layout.css" rel="stylesheet" />

<link href="${path }/include/css/reset.css" rel="stylesheet" />
<link href="${path }/include/css/main.css" rel="stylesheet" />
<link href="${path }/include/css/slick.css" rel="stylesheet" />

<link href="${path }/include/css/common.css" rel="stylesheet" />

<!-- JS -->
<script src="${path }/include/js/jquery-3.5.1.js" type="text/javascript"></script>
<script src="${path }/include/js/slick.js" type="text/javascript"></script>