<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="db.School.OEntity" %>
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
        <br><form id="selectTable" method="get" action="/systemManage.jsp"> <!-- TODO:设置处理系统管理选择数据库界面 -->
            选择数据库: <select onchange="selectTable()" name="database">
                <option value="C">课程表</option>
                <option value="D">院系表</option>
                <option value="E">选课表</option>
                <option value="O">开课表</option>
                <option value="S">学生表</option>
                <option value="T">教师表</option>
            </select>
        </form><br>
        <form method='post' action='handleSystem.action'>
        <%
            switch (request.getParameter("database")) {
                case "C":
                    break;
                case "D":
                    break;
                case "E":
                    break;
                case "O":
                    out.print("<span class='RightSubtitleStyle'>开课表</span><br><br>");
                    SessionFactory sessionFactory = new Configuration(). configure("hibernate.cfg.xml"). buildSessionFactory();
                    Session s = sessionFactory.openSession();
                    Query query = s.createQuery("from OEntity");
                    List list = query.list();
                    for (Object obj : list) {
                        OEntity o = (OEntity) obj;
                        out.print("\n" +
                                "<input type='hidden' name='table' value='O'/>\n" +
                                "<table id='MainTable' class='MainTable' align='center' cellpadding='5'>\n" +
                                "   <tbody>\n" +
                                "      <tr>\n" +
                                "         <td class='InnerTitle'>学期</td>\n" +
                                "         <td class='InnerTitle'>课号</td>\n" +
                                "         <td class='InnerTitle'>工号</td>\n" +
                                "         <td class='InnerTitle'>上课时间</td>\n" +
                                "      </tr>\n" +
                                "      <tr>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ o.getXq() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ o.getKh() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ o.getGh() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ o.getSksj() +"'></td>\n" +
                                "      </tr>\n" +
                                "   </tbody>\n" +
                                "</table>\n");
                    }
                    break;
                case "S":
                    break;
                case "T":
                    break;
            }
        %>
            <input type='submit' value='确认'/>
            <input type='reset' value='重置'/>
        </form>"
        <%
            String name = request.getParameter("from");
            if (name != null && name.equals("failed"))
                out.print("<br><br><div style='text-align: center; font-weight: bolder'>退课失败！</div>");
            if (name != null && name.equals("success"))
                out.print("<br><br><div style='text-align: center; font-weight: bolder'>退课成功！</div>");
        %>
    </div>
</div>
</body>
</html>