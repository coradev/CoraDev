<%@page import="java.util.List"%>
<%@page import="model.Enrollment"%>
<%@page import="dal.EnrollmentDAO"%>
<%@page import="model.Student"%>
<%
    //for lesson page and course detail
    try {
        Student student = (Student) session.getAttribute("studentlogged");
        String courseid = request.getParameter("courseid");

        EnrollmentDAO enrollmentdao = new EnrollmentDAO();
        List<Enrollment> enrollments = enrollmentdao.getAll();

        boolean checkaccesscourse = false;

        for (Enrollment e : enrollments) {
            if (e.getStudent_id() == student.getId() && e.getCourse_id() == Integer.parseInt(courseid)) {
                checkaccesscourse = true;
            }
        }
        request.setAttribute("checkaccesscourse", checkaccesscourse);
    } catch (Exception e) {
        response.sendRedirect("/login");
    }
%>