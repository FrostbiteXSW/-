<%@ page pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>系统管理</title>
    <link href="css/page.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/system.js"></script>
</head>
<body style="background-color: #a9c4d6">
<h1 class="TitleStyle">欢迎登录教学事务管理系统</h1>
<div class="MainDiv">
    <div class="LeftDiv">
        <table class="LeftTable">
            <tbody>
            <tr>
                <td><button class="LeftContent" onclick="exitSystem()">&nbsp;退出登录</button></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="SplitLine"></div>
    <div class="RightDiv">
        <br><form id="selectTable" method="post" action=""> <!-- TODO:设置处理系统管理选择数据库界面 -->
            选择数据库: <select onchange="selectTable()" name="database">
                <option value="C">课程表</option>
                <option value="D">院系表</option>
                <option value="E">选课表</option>
                <option value="O">开课表</option>
                <option value="S">学生表</option>
                <option value="T">教师表</option>
            </select>
        </form><br>
        <span class="RightSubtitleStyle">开课表 <!-- TODO:设置当前选中数据库表名 --> </span><br><br>
        <form method="post" action=""> <!-- TODO:设置处理系统管理更改数据库内容界面 -->
            <table id="MainTable" class="MainTable" align="center" cellpadding="5">
                <tbody>
                <tr>
                    <td class="InnerTitle">课号</td>
                    <td class="InnerTitle">课名</td>
                    <td class="InnerTitle">上课时间</td>
                    <td class="InnerTitle">任课教师</td>
                </tr>
                <tr>
                    <td class="InnerBlock"><input type="text" name="kh1" value="08305001"></td>
                    <td class="InnerBlock"><input type="text" name="km1" value="HTML入门"></td>
                    <td class="InnerBlock"><input type="text" name="sksj1" value="三11-13"></td>
                    <td class="InnerBlock"><input type="text" name="js1" value="王重阳"></td>
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