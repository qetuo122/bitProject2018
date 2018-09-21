class Emp{
	int EMPNO;
	String ENAME;
	String JOB;
	int MGR;
	String HIREDATE;
	int SAL;
	int COMM;
	int DEPTNO;
	
	public Emp() {
	}

	public Emp(int eMPNO, String eNAME, String jOB, int mGR, String hIREDATE, int sAL, int cOMM, int dEPTNO) {
		EMPNO = eMPNO;
		ENAME = eNAME;
		JOB = jOB;
		MGR = mGR;
		HIREDATE = hIREDATE;
		SAL = sAL;
		COMM = cOMM;
		DEPTNO = dEPTNO;
	}

	public int getEMPNO() {
		return EMPNO;
	}
	public void setEMPNO(int eMPNO) {
		EMPNO = eMPNO;
	}
	public String getENAME() {
		return ENAME;
	}
	public void setENAME(String eNAME) {
		ENAME = eNAME;
	}
	public String getJOB() {
		return JOB;
	}
	public void setJOB(String jOB) {
		JOB = jOB;
	}
	public int getMGR() {
		return MGR;
	}
	public void setMGR(int mGR) {
		MGR = mGR;
	}
	public String getHIREDATE() {
		return HIREDATE;
	}
	public void setHIREDATE(String hIREDATE) {
		HIREDATE = hIREDATE;
	}
	public int getSAL() {
		return SAL;
	}
	public void setSAL(int sAL) {
		SAL = sAL;
	}
	public int getCOMM() {
		return COMM;
	}
	public void setCOMM(int cOMM) {
		COMM = cOMM;
	}
	public int getDEPTNO() {
		return DEPTNO;
	}
	public void setDEPTNO(int dEPTNO) {
		DEPTNO = dEPTNO;
	}
	
}
