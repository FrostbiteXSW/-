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
        <br><span class="RightSubtitleStyle">录入成绩</span><br><br>
        <form method="post" action=""> <!-- TODO:设置处理教师录入成绩跳转界面 -->
            <table id="MainTable" class="MainTable" align="center" cellpadding="5">
                <tbody>
                <tr>
                    <td class="InnerTitle">课号</td>
                    <td class="InnerTitle">课名</td>
                    <td class="InnerTitle">上课时间</td>
                    <td class="InnerTitle">学号</td>
                    <td class="InnerTitle">平时成绩</td>
                    <td class="InnerTitle">考试成绩</td>
                    <td class="InnerTitle">总评成绩</td>
                </tr>
                <tr>
                    <td class="InnerBlock">08305001</td>
                    <td class="InnerBlock">HTML入门</td>
                    <td class="InnerBlock">三11-13</td>
                    <td class="InnerBlock">15121234</td>
                    <td class="InnerBlock"><input type="number" name="pscj1" value=""></td>
                    <td class="InnerBlock"><input type="number" name="kscj1" value=""></td>
                    <td class="InnerBlock"><input type="number" name="zpcj1" value=""></td>
                </tr>
                </tbody>
            </table>
            <input type="submit" value="确认"/>
            <input type="reset" value="重置"/>
        </form>
    </div>
</div>
</body>
</html>