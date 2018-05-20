function exitSystem() {
    localStorage.clear();
    sessionStorage.clear();
    window.location.href="index.jsp";
}
function selectTable() {
    var form=document.getElementById("selectTable");
    form.submit();
}