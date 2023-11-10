<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pagina.aspx.cs" Inherits="ApiRedesSociales_SAEG.Pagina" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script>
    window.fbAsyncInit = function () {
        FB.init({
            appId: '991083681958969',
            cookie: true,
            xfbml: true,
            version: 'v18.0'
        });
        FB.AppEvents.logPageView();
    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) { return; }
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    function onLogin() {
        FB.login((response) => {
            if (response.authResponse) {
                FB.api('/me?fields=email,name,picture', (response) => {
                    console.log(response);
                    window.location.href = "Inicio.html";
                })
            }
        })
    }

    function checkLoginState() {
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response)
        });
    }

</script>
    <title>API de Facebook</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <button onclick="onLogin();">Iniciar Sesion con Facebook</button>
        </div>
    </form>
</body>
</html>
