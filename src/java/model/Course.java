/*
 * Created: 03-20-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package model;

import java.util.List;

public class Course {

    private int id, admin_id, category_id;
    private String title;
    private float fee;
    private String introduce;
    private String purport;
    private String cover_image;
    private String intro_video;
    private String category_name;

    List<Chapter> chapters;

    public Course() {
    }

    public Course(int id, int admin_id, int category_id, String title, float fee, String introduce, String purport, String cover_image, String intro_video) {
        this.id = id;
        this.admin_id = admin_id;
        this.category_id = category_id;
        this.title = title;
        this.fee = fee;
        this.introduce = introduce;
        this.purport = purport;
        this.cover_image = cover_image;
        this.intro_video = intro_video;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getFee() {
        return fee;
    }

    public void setFee(float fee) {
        this.fee = fee;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getPurport() {
        return purport;
    }

    public void setPurport(String purport) {
        this.purport = purport;
    }

    public String getCover_image() {
        return cover_image;
    }

    public void setCover_image(String cover_image) {
        this.cover_image = cover_image;
    }

    public String getIntro_video() {
        return intro_video;
    }

    public void setIntro_video(String intro_video) {
        this.intro_video = intro_video;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public List<Chapter> getChapters() {
        return chapters;
    }

    public void setChapters(List<Chapter> chapters) {
        this.chapters = chapters;
    }

}
