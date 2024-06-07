package com.morning.per;

import java.util.List;


import com.morning.domain.Qna;

public interface QnaMapper {
	
	public int getTotalCount();
	public List<Qna> getQnaList();
	public Qna getQna(int Qna);
	public void insQna(Qna qna);
	public void upQna(Qna qna);
	public void delQna(int no);

}
