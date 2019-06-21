package com.kh.sbj.domain;

public class PersonVo {
	private String u_id; 
	private String u_name;
	private String m_idPhoto;
	private String m_electPhoto; 
	private String m_party; 
	private String m_position; 
	private String m_area; 
	private String m_dominationInfo;
	  
	public PersonVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PersonVo(String u_id, String u_name, String m_idPhoto, String m_electPhoto, String m_party,
			String m_position, String m_area, String m_dominationInfo) {
		super();
		this.u_id = u_id;
		this.u_name = u_name;
		this.m_idPhoto = m_idPhoto;
		this.m_electPhoto = m_electPhoto;
		this.m_party = m_party;
		this.m_position = m_position;
		this.m_area = m_area;
		this.m_dominationInfo = m_dominationInfo;
	}
	@Override
	public String toString() {
		return "PersonVo [u_id=" + u_id + ", u_name=" + u_name + ", m_idPhoto=" + m_idPhoto + ", m_electPhoto="
				+ m_electPhoto + ", m_party=" + m_party + ", m_position=" + m_position + ", m_area=" + m_area
				+ ", m_dominationInfo=" + m_dominationInfo + "]";
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getM_idPhoto() {
		return m_idPhoto;
	}
	public void setM_idPhoto(String m_idPhoto) {
		this.m_idPhoto = m_idPhoto;
	}
	public String getM_electPhoto() {
		return m_electPhoto;
	}
	public void setM_electPhoto(String m_electPhoto) {
		this.m_electPhoto = m_electPhoto;
	}
	public String getM_party() {
		return m_party;
	}
	public void setM_party(String m_party) {
		this.m_party = m_party;
	}
	public String getM_position() {
		return m_position;
	}
	public void setM_position(String m_position) {
		this.m_position = m_position;
	}
	public String getM_area() {
		return m_area;
	}
	public void setM_area(String m_area) {
		this.m_area = m_area;
	}
	public String getM_dominationInfo() {
		return m_dominationInfo;
	}
	public void setM_dominationInfo(String m_dominationInfo) {
		this.m_dominationInfo = m_dominationInfo;
	}
	  
	  
	  
	  
}
