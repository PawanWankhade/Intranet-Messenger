package mybeans;
public class Student
{
	private int marks;
	private String result;
	
	public Student()
	{
		marks = 0;
		result = "NA";
	}
	
	public void setMarks(int marks)
	{
		this.marks = marks;
		makeChange();
	}
	
	private void makeChange()
	{
		if(marks>=35)
			result = "Pass";
		else
			result = "fail";
	}
	
	public String getResult()
	{
		return result;
	}
	
}