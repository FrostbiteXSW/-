<%@ page pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生管理</title>
    <link href="css/page.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/student.js"></script>
</head>
<body style="background-color: #a9c4d6">
<h1 class="TitleStyle">欢迎登录教学事务管理系统</h1>
<div class="MainDiv">
    <div class="LeftDiv">
        <table class="LeftTable">
            <tbody>
            <tr>
                <td><button class="LeftContent" onclick="CourseInfo()">&nbsp;课程信息</button></td>
            </tr>
            <tr>
                <td ><button class="LeftContent" onclick="selectCourse()">&nbsp;选课</button></td>
            </tr>
            <tr>
                <td><button class="LeftContent" onclick="quitCourse()">&nbsp;退课</button></td>
            </tr>
            <tr>
                <td><button class="LeftContent" onclick="exitSystem()">&nbsp;退出登录</button></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="SplitLine"></div>
    <div class="RightDiv">
        <br><span class="RightSubtitleStyle">选课</span><br><br>
        <form method="post" action=""> <!-- TODO:设置处理学生选课跳转界面 -->
            <table id="MainTable" class="MainTable" align="center" cellpadding="5">
                <tbody>
                <tr>
                    <td class="InnerTitle">课号</td>
                    <td class="InnerTitle">课名</td>
                    <td class="InnerTitle">上课时间</td>
                    <td class="InnerTitle">任课教师</td>
                    <td class="InnerTitle">选择</td>
                </tr>
                <tr>
                    <td class="InnerBlock">08305001</td>
                    <td class="InnerBlock">HTML入门</td>
                    <td class="InnerBlock">三11-13</td>
                    <td class="InnerBlock">王重阳</td>
                    <td class="InnerBlock" style="text-align: center"><input type="checkbox" name="c1"/></td>
                </tr>
                <tr>
                    <td class="InnerBlock">08305002</td>
                    <td class="InnerBlock">JSP精通</td>
                    <td class="InnerBlock">五11-13</td>
                    <td class="InnerBlock">郭敬明</td>
                    <td class="InnerBlock" style="text-align: center"><input type="checkbox" name="c2"/></td>
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