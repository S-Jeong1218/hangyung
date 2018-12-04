package com.shop_closet.Rserve;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class test3 {
	public REXP x = null;
	public RConnection r = null;
	public String str = "";

	public test3() {
		try {
			r = new RConnection(); // R 접속. 아규먼트에 아무것도 없으면 로컬로 접속
		} catch (RserveException e) {
			e.printStackTrace();
		}
	}

	public byte[] getImage() throws RserveException, REXPMismatchException {
		// R에서 분석 한 이미지 요청
		
		x = r.eval("try(jpeg('test.jpg', quality=100))");
		r.eval("source('D:/r_workspace/moamoa/practiceUser.R')");
		r.eval("cloud_neg(137)");
		r.eval("graphics.off()");
		x = r.eval("r=readBin('test.jpg','raw',1024*1024);unlink('test.jpg');r");
		r.close();
		return x.asBytes();
	}
}