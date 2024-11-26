package kr.pvchallenge.vo;

import java.sql.Date;

public class PvChallengeVO {
	//기본 챌린지 정보
	private long ch_num; //챌린지 번호(PK)
	private long us_num; //유저 번호(FK)
	private int cat_num; //카테고리 번호(FK)
	
	//인증 게시판 정보
	private int ah_num; //인증글 고유 번호 (인증문구 작성시에 사용)
	private String ah_img; //인증 이미지
	private int ch_proved;//인증 여부
	private Date ah_date; //인증 날짜
	
	public long getCh_num() {
		return ch_num;
	}
	public void setCh_num(long ch_num) {
		this.ch_num = ch_num;
	}
	public long getUs_num() {
		return us_num;
	}
	public void setUs_num(long us_num) {
		this.us_num = us_num;
	}
	public int getCat_num() {
		return cat_num;
	}
	public void setCat_num(int cat_num) {
		this.cat_num = cat_num;
	}
	public int getAh_num() {
		return ah_num;
	}
	public void setAh_num(int ah_num) {
		this.ah_num = ah_num;
	}
	public String getAh_img() {
		return ah_img;
	}
	public void setAh_img(String ah_img) {
		this.ah_img = ah_img;
	}
	public int getCh_proved() {
		return ch_proved;
	}
	public void setCh_proved(int ch_proved) {
		this.ch_proved = ch_proved;
	}
	public Date getAh_date() {
		return ah_date;
	}
	public void setAh_date(Date ah_date) {
		this.ah_date = ah_date;
	}

}
 