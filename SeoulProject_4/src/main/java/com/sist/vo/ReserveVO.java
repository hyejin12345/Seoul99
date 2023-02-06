package com.sist.vo;

import java.sql.Date;

/*
 * rno NUMBER,
   fno NUMBER,
   id VARCHAR2(20),
   rdate VARCHAR2(20) CONSTRAINT res_rdate_nn_4 NOT NULL,
   rtime VARCHAR2(20) CONSTRAINT res_rtime_nn_4 NOT NULL,
   inwon NUMBER,
   reserve_no VARCHAR2(20) CONSTRAINT res_rn_nn_4 NOT NULL,
   ok CHAR(1),
   regdate DATE DEFAULT SYSDATE,
   CONSTRAINT res_rno_pk_4 PRIMARY KEY(rno),
   CONSTRAINT res_fno_4 FOREIGN KEY(fno)
   REFERENCES gg_foodDetail_4(fno),
   CONSTRAINT res_id_fk_4 FOREIGN KEY(id)
   REFERENCES gg_member_4 (id),
   CONSTRAINT res_inwon_ck_4 CHECK(inwon>0)

 */

/*
 	FRNO    NOT NULL NUMBER         
	FNO              NUMBER         
	ID               VARCHAR2(20)   
	RNO     NOT NULL VARCHAR2(50)   
	RDATE   NOT NULL VARCHAR2(100)  
	RTIME   NOT NULL VARCHAR2(100)  
	INWON            NUMBER         
	MSG              VARCHAR2(1000) 
	OK               CHAR(10)       
	REGDATE          DATE           
 */
public class ReserveVO {
	private int frno,fno,inwon;
	private String id,rno,rdate,rtime,msg,ok;
	private Date regdate;
	public int getFrno() {
		return frno;
	}
	public void setFrno(int frno) {
		this.frno = frno;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getInwon() {
		return inwon;
	}
	public void setInwon(int inwon) {
		this.inwon = inwon;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRno() {
		return rno;
	}
	public void setRno(String rno) {
		this.rno = rno;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getOk() {
		return ok;
	}
	public void setOk(String ok) {
		this.ok = ok;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
