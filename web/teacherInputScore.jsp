<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.query.Query" %>
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
        <form method="post" action="handleInputScore.action">
            <table id="MainTable" class="MainTable" align="center" cellpadding="5">
                <tbody>
                <tr>
                    <td class="InnerTitle">课号</td>
                    <td class="InnerTitle">课名</td>
                    <td class="InnerTitle">学期</td>
                    <td class="InnerTitle">学号</td>
                    <td class="InnerTitle">姓名</td>
                    <td class="InnerTitle">平时成绩</td>
                    <td class="InnerTitle">考试成绩</td>
                    <td class="InnerTitle">总评成绩</td>
                </tr>
                <%
                    SessionFactory sessionFactory = new Configuration(). configure("hibernate.cfg.xml"). buildSessionFactory();
                    Session s = sessionFactory.openSession();
                    String username = (String)session.getAttribute("username");
                    Query query = s.createQuery("select E.kh, C.km, S.xh, S.xm, E.gh, E.xq, E.pscj, E.kscj, E.zpcj  from EEntity as E, OEntity as O, CEntity as C, TEntity as T, SEntity as S " +
                            "where S.xh = E.xh and E.kh = C.kh " +
                            "and E.kh = O.kh and E.gh = O.gh and E.xq= O.xq " +
                            "and E.gh = '" + username +"' " +
                            "order by E.kh");
                    List list = query.list();
                    for (Object aList : list) {
                        Object[] tuple = (Object[]) aList;
                        String kh = (String) tuple[0], km = (String) tuple[1], xh = (String) tuple[2], xm = (String) tuple[3], gh = (String) tuple[4], xq = (String) tuple[5];
                        int pscj = tuple[6] == null ?  -1 :(int) tuple[6], kscj = tuple[7] == null ?  -1 :(int) tuple[7], zpcj = tuple[8] == null ?  -1 :(int) tuple[8];
                        out.print("\n" +
                                "<input type='hidden' name='content' value='" + xh + "'/>\n" +
                                "<input type='hidden' name='content' value='" + xq + "'/>\n" +
                                "<input type='hidden' name='content' value='" + kh + "'/>\n" +
                                "<input type='hidden' name='content' value='" + gh + "'/>\n" +
                                "<tr>\n" +
                                "   <td class='InnerBlock'>" + kh + "</td>\n" +
                                "   <td class='InnerBlock'>" + km + "</td>\n" +
                                "   <td class='InnerBlock'>" + xq + "</td>\n" +
                                "   <td class='InnerBlock'>" + xh + "</td>\n" +
                                "   <td class='InnerBlock'>" + xm + "</td>\n" +
                                "   <td class='InnerBlock'><input type='text' name='content' value='"+ (pscj == -1 ? "" : pscj) +"'></td>\n" +
                                "   <td class='InnerBlock'><input type='text' name='content' value='"+ (kscj == -1 ? "" : kscj) +"'></td>\n" +
                                "   <td class='InnerBlock'><input type='text' name='content' value='"+ (zpcj == -1 ? "" : zpcj) +"'></td>\n" +
                                "</tr>\n");
                    }
                %>
                </tbody>
            </table>
            <input type="submit" value="确认"/>
            <input type="reset" value="重置"/>
            <%
                String name = request.getParameter("from");
                if (name != null && name.equals("failed"))
                    out.print("<br><br><div style='text-align: center; font-weight: bolder'>录入失败！</div>");
                if (name != null && name.equals("success"))
                    out.print("<br><br><div style='text-align: center; font-weight: bolder'>录入成功！</div>");
            %>
        </form>
    </div>
</div>
</body>
</html>