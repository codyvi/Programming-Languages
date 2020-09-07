package Scanner;

import java.util.ArrayList;
import java.util.List;

import Scanner.Token.Type;

public class Scanner {

	private final int ERROR = Integer.MAX_VALUE; //Constant value of error
	private final int[][]  transitionMatrix;
	
	public Scanner () {
		transitionMatrix = new int[][] {
			{0, 1, 3, 2, 104, ERROR},
			{101, 1, ERROR, ERROR, ERROR, ERROR},
			{ERROR, ERROR, 102,ERROR, ERROR, ERROR, ERROR},
			{103, ERROR, 3, ERROR, ERROR, ERROR}
		};
	}
	
	public ArrayList<Token> scan(String string){
		char c;
		int state = 0;
		int index = 0;
		StringBuilder value;
		ArrayList<Token> tokens = new ArrayList<Token>();
		
		while(index < string.length()) {
			value = new StringBuilder();
			do {
				c = string.charAt(index);
				System.out.println("[" + state + "." + c + "."+ "]");
				index++;
				state = transitionMatrix[state][filter(c)];
				if(state > 0) {
					value.append(c);
				}
			}while(index < string.length() && state < 100);
			
			switch(state) {
			case 0:
				return tokens;
			case 101:
				tokens.add(new Token(Type.INTEGER, value.toString().trim()));
				break;
			case ERROR:
				value.append(c);
				System.out.println("LEXICAL ERROR");
				System.exit(0);
				return tokens;
			case 102:
				switch(value.toString().trim()) {
				case "#A":
				case "#B":
				case "#C":
				case "#D":
					tokens.add(new Token(Type.REGISTER, value.toString().trim()));
					break;
				default:
					System.out.println("LEXICAl ERROR");
					System.exit(0);
				}
				break;
			case 103:
				switch(value.toString().trim()) {
				case "SUM":
				case "SUB":
				case "MUL":
				case "DIV":
					tokens.add(new Token(Type.OPERATION, value.toString().trim()));
					break;
				case "MOV":
					tokens.add(new Token(Type.ASSIGNMENT, value.toString().trim()));
					break;
				default:
					System.out.println("LEXICAL ERROR");
					System.exit(0);
				}
				break;
			case 104:
				tokens.add(new Token(Type.EOF, value.toString().trim()));
				break;
			}
			state = 0;
		}
		return tokens;
	}
	
	private int filter(char c) {
		if(c == ' ' || c == '\t' || c == '\n') {
			return 0;
		}
		if(c > 47 && c < 58 ) {
			return 1;
		}
		if(c > 64 && c < 91 ) {
			return 2;
		}
		if(c == '#') {
			return 3;
		}
		if(c == ';') {
			return 4;
		}
		return 5; //ilegal
		
	}
}
