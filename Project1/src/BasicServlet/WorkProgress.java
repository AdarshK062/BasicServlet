package BasicServlet;

public class WorkProgress {
	public String persno, wpDate, projectId, projectName, projectDescription, status, PDC;
	public WorkProgress(String persno, String wpDate, String projectId, String projectName, String projectDescription, String status, String PDC) {
		this.persno=persno;
		this.wpDate=wpDate;
		this.PDC=PDC;
		this.projectDescription=projectDescription;
		this.projectId=projectId;
		this.projectName=projectName;
		this.status=status;
	}
}
