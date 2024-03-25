package common;

import jakarta.servlet.http.HttpServlet;

public class CommonPage {
	public static String pagingArea(int total_page, int page_no, int page_block_start, int page_block_end, String linkUrl) {
		StringBuilder sb = new StringBuilder();
		String tmpLinkURL = (linkUrl!=null&&!linkUrl.isEmpty()?linkUrl:"?");
		
		System.out.print(linkUrl);
		
		if(total_page!=0) {
			sb.append((page_no>1? "<a href='"+tmpLinkURL+"page_no=1'><strong><<</strong></a>&nbsp;&nbsp;" : "<<&nbsp;&nbsp;"));
			sb.append((page_no>1? "<a href='"+tmpLinkURL+"page_no="+(page_no-1)+"'><strong><</strong></a>&nbsp;&nbsp;" : "<&nbsp;&nbsp;"));
			for (int i=page_block_start; i<=page_block_end; i++) {
				if ( page_no == i ){
					sb.append("<strong>"+i+"</strong>");
				} else {
					sb.append("<a href='"+tmpLinkURL+"page_no="+i+"'>"+i+"</a>");
				}
				if (i!=page_block_end) {
					sb.append("&nbsp;|&nbsp;");
				}
			}
	
			sb.append((page_no<total_page? "&nbsp;&nbsp;<a href='"+tmpLinkURL+"page_no="+(page_no+1)+"'><strong>></strong></a>" : "&nbsp;&nbsp;>"));
			sb.append((page_no<total_page? "&nbsp;&nbsp;<a href='"+tmpLinkURL+"page_no="+(total_page)+"'><strong>>></strong></a>" : "&nbsp;&nbsp;>>"));
			
		}
		return sb.toString();
	}
}
