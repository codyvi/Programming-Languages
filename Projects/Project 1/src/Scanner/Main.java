package Scanner;

import java.util.ArrayList;

public class Main {
	public static void main(String[] args) {
		String str;
		Scanner scanner = new Scanner();
		ArrayList<Token> tokens;
		
		str = "SUM 5 5 ;";
		
		tokens = scanner.scan(str);
		for(Token token: tokens) {
			System.out.println(token.tokenToString());
		}
		
	    Parser parser;
        parser = new Parser();
        parser.parse(tokens);
	}
	
}
