<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="db.School.*" %>
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
                <option value="" selected="selected">&nbsp;</option>
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
            SessionFactory sessionFactory = new Configuration(). configure("hibernate.cfg.xml"). buildSessionFactory();
            Session s = sessionFactory.openSession();
            switch (request.getParameter("database") == null ? "" : request.getParameter("database")) {
                case "C":
                    out.print("<span class='RightSubtitleStyle'>课程表</span><br><br>" +
                            "<input type='hidden' name='table' value='C'/>\n" +
                            "<table id='MainTable' class='MainTable' align='center' cellpadding='5'>\n" +
                            "   <tbody>\n" +
                            "      <tr>\n" +
                            "         <td class='InnerTitle'>课号</td>\n" +
                            "         <td class='InnerTitle'>课名</td>\n" +
                            "         <td class='InnerTitle'>学分</td>\n" +
                            "         <td class='InnerTitle'>学时</td>\n" +
                            "         <td class='InnerTitle'>院系号</td>\n" +
                            "      </tr>");
                    for (Object obj : s.createQuery("from CEntity").list()) {
                        CEntity c = (CEntity) obj;
                        out.print("\n" +
                                "      <tr>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ c.getKh() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ c.getKm() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ c.getXf() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ c.getXs() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ c.getYxh() +"'></td>\n" +
                                "      </tr>\n");
                    }
                    out.print("</tbody>\n" +
                            "</table>\n" +
                            "<input type='submit' value='确认'/>\n" +
                            "<input type='reset' value='重置'/>\n");
                    break;
                case "D":
                    out.print("<span class='RightSubtitleStyle'>院系表</span><br><br>" +
                            "<input type='hidden' name='table' value='D'/>\n" +
                            "<table id='MainTable' class='MainTable' align='center' cellpadding='5'>\n" +
                            "   <tbody>\n" +
                            "      <tr>\n" +
                            "         <td class='InnerTitle'>院系号</td>\n" +
                            "         <td class='InnerTitle'>名称</td>\n" +
                            "         <td class='InnerTitle'>地址</td>\n" +
                            "         <td class='InnerTitle'>联系电话</td>\n" +
                            "      </tr>");
                    for (Object obj : s.createQuery("from DEntity").list()) {
                        DEntity d = (DEntity) obj;
                        out.print("\n" +
                                "      <tr>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ d.getYxh() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ d.getMc() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ d.getDz() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ d.getLxdh() +"'></td>\n" +
                                "      </tr>\n");
                    }
                    out.print("</tbody>\n" +
                            "</table>\n" +
                            "<input type='submit' value='确认'/>\n" +
                            "<input type='reset' value='重置'/>\n");
                    break;
                case "E":
                    out.print("<span class='RightSubtitleStyle'>选课表</span><br><br>" +
                            "<input type='hidden' name='table' value='E'/>\n" +
                            "<table id='MainTable' class='MainTable' align='center' cellpadding='5'>\n" +
                            "   <tbody>\n" +
                            "      <tr>\n" +
                            "         <td class='InnerTitle'>学号</td>\n" +
                            "         <td class='InnerTitle'>学期</td>\n" +
                            "         <td class='InnerTitle'>课号</td>\n" +
                            "         <td class='InnerTitle'>工号</td>\n" +
                            "         <td class='InnerTitle'>平时成绩</td>\n" +
                            "         <td class='InnerTitle'>考试成绩</td>\n" +
                            "         <td class='InnerTitle'>总评成绩</td>\n" +
                            "      </tr>");
                    for (Object obj : s.createQuery("from EEntity where zpcj is not null").list()) {
                        EEntity e = (EEntity) obj;
                        out.print("\n" +
                                "      <tr>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ e.getXh() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ e.getXq() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ e.getKh() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ e.getGh() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ e.getPscj() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ e.getKscj() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ e.getZpcj() +"'></td>\n" +
                                "      </tr>\n");
                    }
                    for (Object obj : s.createQuery("select E.xh, E.xq, E.kh, E.gh from EEntity as E where zpcj is null").list()) {
                        Object[] e = (Object[]) obj;
                        out.print("\n" +
                                "      <tr>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ e[0] +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ e[1] +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ e[2] +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ e[3] +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value=''></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value=''></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value=''></td>\n" +
                                "      </tr>\n");
                    }
                    out.print("</tbody>\n" +
                            "</table>\n" +
                            "<input type='submit' value='确认'/>\n" +
                            "<input type='reset' value='重置'/>\n");
                    break;
                case "O":
                    out.print("<span class='RightSubtitleStyle'>开课表</span><br><br>" +
                            "<input type='hidden' name='table' value='O'/>\n" +
                            "<table id='MainTable' class='MainTable' align='center' cellpadding='5'>\n" +
                            "   <tbody>\n" +
                            "      <tr>\n" +
                            "         <td class='InnerTitle'>学期</td>\n" +
                            "         <td class='InnerTitle'>课号</td>\n" +
                            "         <td class='InnerTitle'>工号</td>\n" +
                            "         <td class='InnerTitle'>上课时间</td>\n" +
                            "      </tr>");
                    for (Object obj : s.createQuery("from OEntity").list()) {
                        OEntity o = (OEntity) obj;
                        out.print("\n" +
                                "      <tr>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ o.getXq() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ o.getKh() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ o.getGh() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ o.getSksj() +"'></td>\n" +
                                "      </tr>\n");
                    }
                    out.print("</tbody>\n" +
                            "</table>\n" +
                            "<input type='submit' value='确认'/>\n" +
                            "<input type='reset' value='重置'/>\n");
                    break;
                case "S":
                    out.print("<span class='RightSubtitleStyle'>学生表</span><br><br>" +
                            "<input type='hidden' name='table' value='S'/>\n" +
                            "<table id='MainTable' class='MainTable' align='center' cellpadding='5'>\n" +
                            "   <tbody>\n" +
                            "      <tr>\n" +
                            "         <td class='InnerTitle'>学号</td>\n" +
                            "         <td class='InnerTitle'>姓名</td>\n" +
                            "         <td class='InnerTitle'>性别</td>\n" +
                            "         <td class='InnerTitle'>出生日期</td>\n" +
                            "         <td class='InnerTitle'>籍贯</td>\n" +
                            "         <td class='InnerTitle'>手机号码</td>\n" +
                            "         <td class='InnerTitle'>院系号</td>\n" +
                            "      </tr>");
                    for (Object obj : s.createQuery("from SEntity").list()) {
                        SEntity ss = (SEntity) obj;
                        out.print("\n" +
                                "      <tr>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ ss.getXh() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ ss.getXm() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ ss.getXb() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ ss.getCsrq() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ ss.getJg() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ ss.getSjhm() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ ss.getYxh() +"'></td>\n" +
                                "      </tr>\n");
                    }
                    out.print("</tbody>\n" +
                            "</table>\n" +
                            "<input type='submit' value='确认'/>\n" +
                            "<input type='reset' value='重置'/>\n");
                    break;
                case "T":
                    out.print("<span class='RightSubtitleStyle'>教师表</span><br><br>" +
                            "<input type='hidden' name='table' value='T'/>\n" +
                            "<table id='MainTable' class='MainTable' align='center' cellpadding='5'>\n" +
                            "   <tbody>\n" +
                            "      <tr>\n" +
                            "         <td class='InnerTitle'>工号</td>\n" +
                            "         <td class='InnerTitle'>姓名</td>\n" +
                            "         <td class='InnerTitle'>性别</td>\n" +
                            "         <td class='InnerTitle'>出生日期</td>\n" +
                            "         <td class='InnerTitle'>学历</td>\n" +
                            "         <td class='InnerTitle'>基本工资</td>\n" +
                            "         <td class='InnerTitle'>院系号</td>\n" +
                            "      </tr>");
                    for (Object obj : s.createQuery("from TEntity").list()) {
                        TEntity t = (TEntity) obj;
                        out.print("\n" +
                                "      <tr>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ t.getGh() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ t.getXm() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ t.getXb() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ t.getCsrq() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ t.getXl() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ t.getJbgz() +"'></td>\n" +
                                "         <td class='InnerBlock'><input type='text' name='content' value='"+ t.getYxh() +"'></td>\n" +
                                "      </tr>\n");
                    }
                    out.print("</tbody>\n" +
                            "</table>\n" +
                            "<input type='submit' value='确认'/>\n" +
                            "<input type='reset' value='重置'/>\n");
                    break;
            }
        %>
        </form>
        <%
            String name = request.getParameter("from");
            if (name != null && name.equals("failed"))
                out.print("<br><br><div style='text-align: center; font-weight: bolder'>修改失败！</div>");
            if (name != null && name.equals("success"))
                out.print("<br><br><div style='text-align: center; font-weight: bolder'>修改成功！</div>");
        %>
    </div>
</div>
</body>
</html>