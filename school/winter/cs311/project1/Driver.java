/**
 * *************************************************************
 * file: Driver.java 
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

import java.util.*;
import java.io.*;

public class Driver {

//  Method: publc static void main(String[] args)
//  Description: Creates new StateMachine object; takes the input file which is formatted to correctly be used,
//  and sets up a state machine with specified states, final states, transitions, and test strings to be tested
//  to determine whether they are contained within the language. determines whether the strings are accepted or rejected.
//  loops through each machine and set of instructions (each different machine separated by "/////" or some other separator,
//  until the end of the file is reached. Finally, it exits the program upon reaching the end of the file.
    public static void main(String[] args) throws FileNotFoundException {
        StateMachine fsm = new StateMachine();
        String[] testString;
        String[] transition;
        String temp;
        int count = 1;
        String accepted = "Rejected";
        int fin;

        try (Scanner inputFile = new Scanner(new File("input.dat"))) {
            while (inputFile.hasNext()) {
                System.out.println("Finite State Automaton #" + count++);
                temp = inputFile.nextLine();
                fsm.states = Integer.parseInt(temp);
                System.out.println("Number of states: " + fsm.states);
                fsm.finalStates = new boolean[fsm.states];
                Arrays.fill(fsm.finalStates, false);
                temp = inputFile.nextLine();
                System.out.println("Final states: " + temp);
                String[] tempArray;
                tempArray = temp.split(",");

                for (String tempArray1 : tempArray) { //make final states read from file true
                    fsm.finalStates[Integer.parseInt(tempArray1)] = true;
                }
                temp = inputFile.nextLine();

                System.out.println("Alphabet: " + temp);
                fsm.alphabet = temp.split("\\s+");

                fsm.transitions = new int[fsm.alphabet.length][fsm.states];

                //Begin setting transitions
                temp = inputFile.nextLine();
                while (temp.startsWith("(")) { //takes in transitions from file of form ( p q s ) and sets to transitions array.

                    transition = temp.split("\\s+");

                    fsm.transitions[fsm.getAlphabetIndex(transition[2])][Integer.parseInt(transition[1])] = Integer.parseInt(transition[3]);  //transitions[key][currentstate] = [nextstate]

                    temp = inputFile.nextLine();
                } //end while loop responsible for setting transitions

                System.out.println("Test Strings: ");

                //begin testing strings
                while (!"/////".equals(temp)) {     //this while loop goes until it reaches the separator "/////"
                    System.out.printf("%-50s", temp);

                    temp = temp.toLowerCase();
                    testString = temp.split("");
                    fin = fsm.inLanguage(testString);

                    if (fsm.finalStates[fin] == true) {
                        accepted = "Accepted";
                    }

                    System.out.printf("%30s", accepted + "\n"); //printes out whether it is accepted or rejected

                    temp = inputFile.nextLine();
                    accepted = "Rejected";
                }

                System.out.print("\n");
            }
            inputFile.close();
        }
        
        System.out.println("Thank you for using my program!");
    }

}
