package com.resourceblocker.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Resources {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer rid;
	private String rtype;
	private String rname;
	private String location;
	private Integer capacity;

	public Resources() {

	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getRtype() {
		return rtype;
	}

	public void setRtype(String rtype) {
		this.rtype = rtype;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Integer getCapacity() {
		return capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	@Override
	public String toString() {
		return "Resources [rid=" + rid + ", rtype=" + rtype + ", rname=" + rname + ", location=" + location
				+ ", capacity=" + capacity + "]";
	}

	public Resources(Integer rid, String rtype, String rname, String location, Integer capacity) {
		super();
		this.rid = rid;
		this.rtype = rtype;
		this.rname = rname;
		this.location = location;
		this.capacity = capacity;
	}

}
