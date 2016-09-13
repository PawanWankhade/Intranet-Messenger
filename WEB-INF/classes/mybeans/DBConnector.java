package mybeans;
public class DBConnector
{	
	private String constr;
	public DBConnector()
	{
		constr = "jdbc:mysql://localhost:3306/messenger?user=root&password=riteshsql";
	}
	public String getConstr()
	{
		return (constr);
	}
	
}
