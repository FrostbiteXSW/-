<%@ page pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link href="css/index.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/index.js"></script>
</head>
<body onload="getPwdFocus()" style="background-color: #a9c4d6">
    <form name="LoginForm" method="post" action="handleLogin.action"> <!-- TODO:设置处理用户名密码跳转界面 -->
        <p>&nbsp;</p>
        <table style="border: outset 3px;" width="300" cellspacing="0" cellpadding="1" border="0" align="center">
            <tbody>
            <tr>
                <td colspan="2" class="TableFoot" height="40"><div class="TitleStyle" align="center">教学事务管理系统</div></td>
            </tr>
            <tr class="ForumRow">
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr class="ForumRow">
                <td width="40%" height="25"><div align="right"> <strong>用户名： </strong> </div></td>
                <td height="25"><input name="username" class="Border" id="username" maxlength="11" type="text"></td>
            </tr>
            <tr class="ForumRow">
                <td width="40%" height="25"><div align="right"> <strong>密　码： </strong> </div></td>
                <td height="25"><input name="password" class="Border" id="password" type="password"></td>
            </tr>
            <tr class="ForumRow">
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" class="ForumRowHighlight" height="25"><div align="center">
                    <input name="Submit" class="Border" value="登 录" type="submit">
                    <input name="Cancel" class="Border" value="取 消" type="reset">
                </div></td>
            </tr>
            </tbody></table>
    </form>
    <%
        String name = request.getParameter("from");
        if (name != null && name.equals("failed"))
            out.print("<div style='text-align: center; font-weight: bolder'>用户名或密码错误！</div>");
    %>
</body>
</html>