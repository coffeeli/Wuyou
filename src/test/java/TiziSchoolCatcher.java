import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.cxf.jaxrs.client.WebClient;

import com.istudy.server.common.utils.CommonUtils;
import com.istudy.server.common.utils.JsonUtils;


public class TiziSchoolCatcher {
	
	private static final String MAX_AREA_LEVEL = "3";
	
	private Connection conn;
	
	public void catchAreas(){
		try {
			initConn();
			catchChildAreas("1");
			freeConn();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void catchChildAreas(String parentId){
		if(CommonUtils.isNull(parentId)){
			return;
		}
		
		try {
			WebClient baseClient = WebClient.create("http://www.tizi.com/class/area?id=" + parentId);
			@SuppressWarnings("unchecked")
			List<Map<String, String>> result = JsonUtils.toObj(baseClient.get(String.class), List.class);
			System.out.println(result);
			saveAreas(result);
			
			for(Map<String, String> area : result){
				 String id = area.get("id");
				 String level = area.get("level");
				 if(MAX_AREA_LEVEL.equals(level)){
					 continue;
				 }
				 catchChildAreas(id);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void saveAreas(List<Map<String, String>> areas) throws Exception{
		 if(areas == null || areas.isEmpty()){
			 return;
		 }
		 PreparedStatement ps = conn.prepareStatement("insert into tizi_area(`id`,`parentid`,`name`,`level`,`first`,`ismunicipality`,`hasschool`) values(?,?,?,?,?,?,?)");
		 for(Map<String, String> area : areas){
			 int i = 1;
			 for(Map.Entry<String, String> entry : area.entrySet()){
				 ps.setString(i++, entry.getValue());
			 }
			 ps.addBatch();
		 }
		 ps.executeBatch();
	}
	
	private void freeConn() throws SQLException{
		if(conn != null){
			conn.close();
		}
	}
	
	private Connection initConn() throws Exception{
		if(conn == null){
			Class.forName("com.mysql.jdbc.Driver");
			conn =  DriverManager.getConnection("jdbc:mysql://10.0.0.170:3306/istudy_cms_dev?useUnicode=true&amp;characterEncoding=utf8&amp;autoReconnect=true&amp;failOverReadOnly=false","istudy","istudy");
		}
		return conn;
	}
}
