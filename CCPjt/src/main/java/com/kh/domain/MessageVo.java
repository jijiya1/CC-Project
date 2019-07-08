package com.kh.domain;

import java.sql.Timestamp;

public class MessageVo {
	private int m_no;
	private String m_receiver;
	private String m_sender;
	private String m_message;
	private Timestamp m_open_date;
	private Timestamp m_send_date;
	
	public MessageVo() {
		super();
	}

	public MessageVo(int m_no, String m_receiver, String m_sender, String m_message, Timestamp m_open_date,
			Timestamp m_send_date) {
		super();
		this.m_no = m_no;
		this.m_receiver = m_receiver;
		this.m_sender = m_sender;
		this.m_message = m_message;
		this.m_open_date = m_open_date;
		this.m_send_date = m_send_date;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_receiver() {
		return m_receiver;
	}

	public void setM_receiver(String m_receiver) {
		this.m_receiver = m_receiver;
	}

	public String getM_sender() {
		return m_sender;
	}

	public void setM_sender(String m_sender) {
		this.m_sender = m_sender;
	}

	public String getM_message() {
		return m_message;
	}

	public void setM_message(String m_message) {
		this.m_message = m_message;
	}

	public Timestamp getM_open_date() {
		return m_open_date;
	}

	public void setM_open_date(Timestamp m_open_date) {
		this.m_open_date = m_open_date;
	}

	public Timestamp getM_send_date() {
		return m_send_date;
	}

	public void setM_send_date(Timestamp m_send_date) {
		this.m_send_date = m_send_date;
	}

	@Override
	public String toString() {
		return "MessageVo [m_no=" + m_no + ", m_receiver=" + m_receiver + ", m_sender=" + m_sender + ", m_message="
				+ m_message + ", m_open_date=" + m_open_date + ", m_send_date=" + m_send_date + "]";
	}
	
	
	
	
}
