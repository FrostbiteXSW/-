function CourseInfo() {
    window.location.href="studentCourseInfo.jsp";
}
function selectCourse() {
    window.location.href="studentSelectCourse.jsp";
}
function quitCourse() {
    window.location.href="studentQuitCourse.jsp";
}
function exitSystem() {
    localStorage.clear();
    sessionStorage.clear();
    window.location.href="index.jsp";
}