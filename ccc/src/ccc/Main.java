package ccc;
import java.io.*;
import java.util.*;

public class Main {
  public static void main(String [] args) throws Exception {
    Scanner in = new Scanner(System.in);
    int m = in.nextInt();
    int n = in.nextInt();
    
    // 0-B, 1-G
    boolean[][] walls = new boolean[m][n];
    for (int i=0; i<m; i++) {
    	for(int j=0; j<n; j++) {
    		walls[i][j] = false;
    	}
    }
    
    int k = in.nextInt();
    ArrayList<String> choices = new ArrayList<>();
    in.nextLine();
    for(int i=0; i<k; i++) {
    	String now = in.nextLine();
    	choices.add(now);
    }
    for(int i=0; i<k; i++) {
    	char letter = choices.get(i).charAt(0);
    	int number = Character.getNumericValue((choices.get(i).charAt(2)));
    	
    	if(letter == 'R') {
    		for(int j=0; j<n; j++) {
    			walls[number][j] = !(walls[number][j]);
    		}
    	} else {
    		for(int j=0; j<n; j++) {
    			walls[j][number] = !(walls[j][number]);
    		}
    	}
    }
    
    int count = 0;
    for (int i=0; i<m; i++) {
    	for(int j=0; j<n; j++) {
    		if (walls[i][j] == true) {
    			count += 1;
    		}
    	}
    }
    
    System.out.println(count);
  }
}