<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="pt">

<head>
<script src='<c:url value="/resources/js/bootstrap.changed.js"/>'></script>



  <meta charset="utf-8">
  <title>Email Seguro</title>
  <style>
    #content-left {
      /* border-right: 1px dashed #014066; */
      padding: 0 10px 0 10px;
      border: 1px solid #e5e5e5;
      -webkit-border-radius: 5px;
      -moz-border-radius: 5px;
      border-radius: 5px;
      -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
      -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
      box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
    }

    #content-right {
      padding: 0 5px 60px 5px;
      border: 1px solid #e5e5e5;
      -webkit-border-radius: 5px;
      -moz-border-radius: 5px;
      border-radius: 5px;
      -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
      -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
      box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
    }

    #content-right img {
      padding: 16px 0 27px 0;
    }

    #content-center {
      padding: 10px 15px 10px 0;
    }

    #logobvs {
      padding: 2px 0px 7px 0px;
    }
  </style>

  <script>
    $("#usernamePasswordForm").validate({
      rules: {
        ss_username: {
          required: true,
          email: true
        },
        ss_password: 'required'
      }
    });
  </script>

  <script type="text/javascript">
    var loadCaptcha = function () {
      grecaptcha.render('captcha_container', {
        'sitekey': '6LdjizIUAAAAAJ79NosdNruEiAD-ZSKpiGRhXcND',
        'expired-callback' : function() {
          grecaptcha.reset();
        }
      });
    };
  </script>

</head>



<body>

<br>

<div class="center">

  <img alt="Envio Seguro" src='<c:url value="/home/custom-logo.png" />' width="254" height="67" />
</div>

<br>

<div class="row-fluid">

  <div class="span12">

    <div class="span2"></div>

    <div class="span4" align="center" id="content-left">
      <h5>Acesso com usuário e senha</h5>

      <form id="usernamePasswordForm" action="${pageContext.request.contextPath}/authenticate" method="post"
            autocomplete="off">
        <fieldset>
          <label><fmt:message key="profile.email"/></label>
          <input id="ss_username" type="email" name="ss_username" autofocus="autofocus" autocomplete="off" required>
          <label><fmt:message key="profile.password"/></label>
          <input id="ss_password" type="password" name="ss_password" autocomplete="off" required>
          <br/>
          <button type="submit" class="btn btn-primary">Acessar</button>
          <br/>
          <a href="${pageContext.request.contextPath}/member/register" >
           Cadastre-se
          </a>&nbsp;
          <br/><br/>
          <div id="captcha_container"></div>
          <br/>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <a href="${pageContext.request.contextPath}/member/forgot-pass">Esqueci minha senha</a>
        </fieldset>
      </form>
    </div>

    <div class="span4" align="center" id="content-right">
      <h5>Acesso com certificado digital</h5>
      <img id="certImage" src='<c:url value="/resources/img/smartcard-ctech-small.png" />' alt="Certificado"
           class="img-rounded"/>
      <br/>
      <a href="${pageContext.request.contextPath}/challenge/login/generate/sdk-web" class="btn btn-primary">Acessar</a>
      <br/><br/><br/><br/><br/><br/>
    </div>

    <div class="span2"></div>

  </div>

  <div class="span12" id="content-center" align="center">
    <p id="msg" style="color: red;"></p>
  </div>

</div>

<sec:authorize access="isAnonymous()">
  <c:if test="${message != null}">
    <script>
      $(document).ready(function () {
        $('#msg').text('${message}');
      });
    </script>
  </c:if>
</sec:authorize>

<script src="https://www.google.com/recaptcha/api.js?onload=loadCaptcha&render=explicit" async defer></script>

</body>

</html>
