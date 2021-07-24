/*
 * Created: 03-23-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package model;

public class Enrollment {

    private int id, student_id, course_id;
    private boolean is_paid_subscription;
    private String student_name, course_bought;
    private float fee;
    

    public Enrollment() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public boolean isIs_paid_subscription() {
        return is_paid_subscription;
    }

    public void setIs_paid_subscription(boolean is_paid_subscription) {
        this.is_paid_subscription = is_paid_subscription;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getCourse_bought() {
        return course_bought;
    }

    public void setCourse_bought(String course_bought) {
        this.course_bought = course_bought;
    }

    public float getFee() {
        return fee;
    }

    public void setFee(float fee) {
        this.fee = fee;
    }
}
