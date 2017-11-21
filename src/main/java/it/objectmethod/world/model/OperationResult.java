package it.objectmethod.world.model;

public class OperationResult {
	
	public static final String SUCCESS="Operazione conclusa con successo.";
	
	private boolean success;
	private String message;
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
