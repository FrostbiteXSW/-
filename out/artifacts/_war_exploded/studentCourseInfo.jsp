<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.query.Query" %>
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
            <br><span class="RightSubtitleStyle">课程信息</span><br><br>
            <table id="MainTable" class="MainTable" align="center" cellpadding="5">
                <tbody>
                    <tr>
                        <td class="InnerTitle">课号</td>
                        <td class="InnerTitle">课名</td>
                        <td class="InnerTitle">上课时间</td>
                        <td class="InnerTitle">任课教师</td>
                        <td class="InnerTitle">学分</td>
                    </tr>
                    <%
                        SessionFactory sessionFactory = new Configuration(). configure("hibernate.cfg.xml"). buildSessionFactory();
                        Session s = sessionFactory.openSession();
                        String username = (String)session.getAttribute("username");
                        Query query = s.createQuery("select E.kh, C.km, O.sksj, T.xm, C.xf from EEntity as E, OEntity as O, CEntity as C, TEntity as T " +
                                "where T.gh = E.gh and O.kh = E.kh " +
                                "and O.gh = E.gh and O.xq = E.xq " +
                                "and C.kh = E.kh and E.xh = '" + username +"' " +
                                "order by E.kh");
                        List list = query.list();
                        for (Object aList : list) {
                            Object[] tuple = (Object[]) aList;
                            String kh = (String) tuple[0], km = (String) tuple[1], sksj = (String) tuple[2], xm = (String) tuple[3];
                            int xf = (int) tuple[4];
                            out.print("\n" +
                                    "<tr>\n" +
                                    "   <td class='InnerBlock'>" + kh + "</td>\n" +
                                    "   <td class='InnerBlock'>" + km + "</td>\n" +
                                    "   <td class='InnerBlock'>" + sksj + "</td>\n" +
                                    "   <td class='InnerBlock'>" + xm + "</td>\n" +
                                    "   <td class='InnerBlock'>" + xf + "</td>\n" +
                                    "</tr>\n");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>