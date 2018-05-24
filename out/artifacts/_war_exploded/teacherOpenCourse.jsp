<%@ page pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>教师管理</title>
    <link href="css/page.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/teacher.js"></script>
</head>
<body style="background-color: #a9c4d6">
<h1 class="TitleStyle">欢迎登录教学事务管理系统</h1>
<div class="MainDiv">
    <div class="LeftDiv">
        <table class="LeftTable">
            <tbody>
            <tr>
                <td><button class="LeftContent" onclick="InputScore()">&nbsp;录入成绩</button></td>
            </tr>
            <tr>
                <td ><button class="LeftContent" onclick="OpenCourse()">&nbsp;开设课程</button></td>
            </tr>
            <tr>
                <td><button class="LeftContent" onclick="exitSystem()">&nbsp;退出登录</button></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="SplitLine"></div>
    <div class="RightDiv">
        <br><span class="RightSubtitleStyle">开设课程</span><br><br>
        <form method="post" action="handleOpenCourse.action"> <!-- TODO:设置处理教师开设课程跳转界面 -->
            <table id="MainTable" class="MainTable" align="center" cellpadding="5">
                <tbody>
                <tr>
                    <td class="InnerTitle">课号</td>
                    <td class="InnerTitle">上课时间</td>
                    <td class="InnerTitle">学期</td>
                </tr>
                <tr>
                    <td class='InnerBlock'><input type='text' name='kh' value=''></td>
                    <td class='InnerBlock'><input type='text' name='sksj' value=''></td>
                    <td class='InnerBlock'><input type='text' name='xq' value=''></td>
                </tr>
                </tbody>
            </table>
            <input type="hidden" name="gh" value="<%=session.getAttribute("username")%>"/>
            <input type="submit" value="确认"/>
            <input type="reset" value="重置"/>
            <%
                String name = request.getParameter("from");
                if (name != null && name.equals("failed"))
                    out.print("<br><br><div style='text-align: center; font-weight: bolder'>开课失败！</div>");
                if (name != null && name.equals("success"))
                    out.print("<br><br><div style='text-align: center; font-weight: bolder'>开课成功！</div>");
            %>
        </form>
    </div>
</div>
</body>
</html>