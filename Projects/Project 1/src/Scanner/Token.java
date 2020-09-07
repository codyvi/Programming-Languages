package Scanner;

public class Token {
	public enum Type{
		INTEGER,
		REGISTER,
		OPERATION,
		ASSIGNMENT,
		EOF
	}
	
	private Type type;
	private String value;
	
	public Token (Type type, String value) {
		this.type = type;
		this.value = value;
	}
	
	public Type getType() {
		return this.type;
	}
	
	public String getValue() {
		return this.value;
	}
	
	 public boolean equalsToken(Token token) {
	        if (token.value.length() > 0) {
	            return (type == token.type && value.equalsIgnoreCase(token.value)); 
	        } else {
	            return (type == token.type);
	        }
	  }
	    
	 public String tokenToString() {
	        StringBuilder string;
	        string = new StringBuilder();
	        string.append("[").append(type).append("- ").append(value).append("]");
	        return string.toString();
	  }
}
