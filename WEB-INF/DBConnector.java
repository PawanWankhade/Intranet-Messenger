package mybeans;
public class DBConnector
{	
	private String constr;
	public DBConnector()
	{
		constr = ("jdbc:mysql://localhost:8080/messenger?user=root&password=TSR");
	}
	pubic String getConstr()
	{
		return (constr);
	}
	
}
