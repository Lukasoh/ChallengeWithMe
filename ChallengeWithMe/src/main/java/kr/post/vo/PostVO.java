package kr.post.vo;

import java.sql.Date;

public class PostVO {
	private long post_num;//글 번호
	private long us_num;//유저 번호
	private String post_img;//글 이미지
	private String post_title;//글 제목
	private String post_content;//글 내용
	private Date post_date;//글 작성일
	private String us_nickname;//유저의 닉네임
	private String us_img;//유저 프로필 이미지
	public long getPost_num() {
		return post_num;
	}
	public void setPost_num(long post_num) {
		this.post_num = post_num;
	}
	public long getUs_num() {
		return us_num;
	}
	public void setUs_num(long us_num) {
		this.us_num = us_num;
	}
	public String getPost_img() {
		return post_img;
	}
	public void setPost_img(String post_img) {
		this.post_img = post_img;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public String getUs_nickname() {
		return us_nickname;
	}
	public void setUs_nickname(String us_nickname) {
		this.us_nickname = us_nickname;
	}
	public String getUs_img() {
		return us_img;
	}
	public void setUs_img(String us_img) {
		this.us_img = us_img;
	}
	@Override
	public String toString() {
		return "PostVO [post_num=" + post_num + ", us_num=" + us_num + ", post_img=" + post_img + ", post_title="
				+ post_title + ", post_content=" + post_content + ", post_date=" + post_date + ", us_nickname="
				+ us_nickname + ", us_img=" + us_img + "]";
	}
	
}
