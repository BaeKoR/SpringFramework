package mul.cam.a.util;

public class Utility {
	// 답글의 화살표
	public static String arrow(int depth){
		String img = "<img src='./images/arrow.png' width='20px' height='20px'/>";
		String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
		
		String ts = "";
		for(int i = 0; i < depth; i++){
			ts += nbsp;
		}
		
		return depth == 0 ? "" : ts + img;
	}
}
