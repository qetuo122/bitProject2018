package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;



@WebServlet("/DBCPinit")
public class DBCPinit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init() throws ServletException {
		//1. �뜲�씠�꽣踰좎씠�뒪 �뱶�씪�씠踰� 濡쒕뱶
		loadJDBCDriver();
		
		//2. pool �뱶�씪�씠踰� 濡쒕뱶
		initConnectionPool();
		
	}

	private void loadJDBCDriver() {
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("데이터베이스 로드 성공");
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	}

	private void initConnectionPool() {
		
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1522:orcl";
		String username = "scott";
		String pw = "tiger";
		
		try{
		ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcDriver, username, pw);
		
		PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
		//而ㅻ꽖�뀡�씠 �쑀�슚�븳吏� �뿬遺�瑜� 寃��궗�븷 �븣 �궗�슜�븯�뒗 荑쇰━瑜� 吏��젙�븳�떎.
		poolableConnFactory.setValidationQuery("select 1");
		//而ㅻ꽖�뀡 ���쓽 �꽕�젙 �젙蹂대�� �깮�꽦�븳�떎.
		GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
		//�쑀�쑕 而ㅻ꽖�뀡 寃��궗 二쇨린
		poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
		//���뿉 蹂닿�以묒씤 而ㅻ꽖�뀡�씠 �쑀�슚�븳吏� 寃��궗�븷吏� �쑀臾� �꽕�젙
		poolConfig.setTestWhileIdle(true);
		
		//而ㅻ꽖�뀡 理쒖냼 媛쒖닔
		poolConfig.setMinIdle(4);
		//而ㅻ꽖�뀡 理쒕� 媛쒖닔
		poolConfig.setMaxTotal(50);
		//而ㅻ꽖�뀡 ���쓣 �깮�꽦. �깮�꽦�옄�뒗 PoolabeConnectionFactory�� GenericObjectPoolConfig瑜� �궗�슜
		GenericObjectPool<PoolableConnection> connectionPool =
		new GenericObjectPool<>(poolableConnFactory, poolConfig);
		//PoolabeConnectionFactory�뿉�룄 而ㅻ꽖�뀡 ���쓣 �뿰寃�
		poolableConnFactory.setPool(connectionPool);
		//而ㅻ꽖�뀡 ���쓣 �젣怨듯븯�뒗 jdbc �뱶�씪�씠踰꾨�� �벑濡�.
		Class.forName("org.apache.commons.dbcp2.PoolingDriver");
		PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
		
		//�쐞�뿉�꽌 而ㅻ꽖�뀡 �� �뱶�씪�씠踰꾩뿉 �깮�꽦�븳 而ㅻ꽖�뀡 ���쓣 �벑濡앺븳�떎. �씠由꾩� chap14 �씠�떎.
		driver.registerPool("open", connectionPool);
		System.out.println("POOLING 등록성공");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
