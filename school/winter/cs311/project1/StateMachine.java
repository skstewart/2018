/**
 * *************************************************************
 * file: StateMachine.java 
 * author: Shayna Stewart 
 * class: CS 311
 *
 * assignment: program 1 
 * date last modified: 3/31/2018 
 * changes: cleaned up code and comments
 *
 * purpose: creates a universal finite state automata, which reads input from a
 * file containing states, final states, alphabet, transitions in form ( p q s ), and test strings.
 * Tests strings against the language and determines whether they are contained within the language. 
 * Continues to read in each machine until the end of the file, upon which it closes the file and exits the program.
 *
 * Instructions: put input.dat (contained inside the zip file) in the main directory
 * folder to be read by the program. Compile, the program will run through the
 * machines with the test strings contained in the file automatically.
 *
 *
 ***************************************************************
 */
package FSM;

public class StateMachine {

    int states;
    boolean[] finalStates;
    String[] alphabet;
    int[][] transitions;
    int currentState;
    
    
//  Method: StateMachine()
//  Description: Creates object, and initializes variables.
    public StateMachine() {
        states = 0;
        currentState = 0;

    }
    
//  Method: getAlphabetIndex(String str)
//  Description: Takes as parameter a string, which is a single character. It runs through the alphabet array and returns
//  the index. Implemented to internally convert letters and other non-digit characters to integer digits.
    public int getAlphabetIndex(String str) {
        int alph = -1;

        for (int x = 0; x < alphabet.length; x++) {
            if (alphabet[x] == null ? str == null : alphabet[x].equals(str)) {
                alph = x;

            }

        }
        return alph;
    }
//  Method: isInAlphabet(String str)
//  Description: Takes as paramenter the string of the current character being tested in the test string.
//  Checks whether the character is contained in the alphabet. 
    public boolean isInAlphabet(String str) {
        boolean a = false;

        for (String alphabet1 : alphabet) {
            if (str == null ? alphabet1 == null : str.equals(alphabet1)) {
                a = true;
            }
        }
        return a;
    }
//  Method: isInLanguage(String[] str)
//  Description: Takes as a parameter the array of strings, which is the test string split into single characters. 
//  First tests whether the current character is in the alphabet. If it is not, it returns a trap state; if it 
//  is in the alphabet, it uses a loop to check every character in the string and change states. Returns the final state
//  at the end of the string.
    public int inLanguage(String[] testStr) {
        currentState = 0;

        for (String testStr1 : testStr) {
            if (isInAlphabet(testStr1)) {
                currentState = transitions[getAlphabetIndex(testStr1)][currentState]; //key, currentState
            } else {
                currentState = states - 1;
                break;
            }
        }

        return currentState;

    }

}
