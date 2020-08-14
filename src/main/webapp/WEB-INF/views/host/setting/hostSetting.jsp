<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var = "path"	value = "${pageContext.request.contextPath}" />
<c:set var = "pathHost"	value = "${path }/include/host/" />
<c:set var = "image" value="${path }/include/image/"/>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Custom fonts for this template-->
  <link href="${pathHost }vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pathHost }css/sb-admin-2.min.css" rel="stylesheet">
  
    <!-- Bootstrap core JavaScript-->
  <script src="${pathHost }vendor/jquery/jquery.min.js"></script>
  <script src="${pathHost }vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pathHost }vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pathHost }js/sb-admin-2.min.js"></script>
  