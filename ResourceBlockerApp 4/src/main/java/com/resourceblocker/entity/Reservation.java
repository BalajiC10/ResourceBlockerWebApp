package com.resourceblocker.entity;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Reservation {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer resid;
	private LocalDate startdate;
	private Integer duration;
	// Default status set as "pending"
	private String status = "pending";
	private String cancel; // New field
	private String cancelStatus; // New field

	// ... getters, setters, constructors ...

	@ManyToOne
	@JoinColumn(name = "sl_no")
	private User user;

	@OneToOne
	@JoinColumn(name = "rid")
	private Resources res;

	public Reservation() {
	}

	public Integer getResid() {
		return resid;
	}

	public void setResid(Integer resid) {
		this.resid = resid;
	}

	public LocalDate getStartDate() {
		return startdate;
	}

	public void setStartDate(LocalDate startdate) {
		this.startdate = startdate;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Resources getRes() {
		return res;
	}

	public void setRes(Resources res) {
		this.res = res;
	}

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}

	public String getCancelStatus() {
		return cancelStatus;
	}

	public void setCancelStatus(String cancelStatus) {
		this.cancelStatus = cancelStatus;
	}

	public Reservation(LocalDate startDate, Integer duration, User user, Resources res) {
		this.startdate = startDate;
		this.duration = duration;
		this.user = user;
		this.res = res;
	}

	@Override
	public String toString() {
		return "Reservation [resid=" + resid + ", startDate=" + startdate + ", duration=" + duration + ", status="
				+ status + ", user=" + user + ", res=" + res + "]";
	}

}
