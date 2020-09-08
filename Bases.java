/**
 * CS 2110 Fall 2020 HW1
 * Part 2 - Coding with bases
 *
 * @author Rachel Mills
 *
 * Global rules for this file:
 * - You may not use more than 2 conditionals per method. Conditionals are
 *   if-statements, if-else statements, or ternary expressions. The else block
 *   associated with an if-statement does not count toward this sum.
 * - You may not use more than 2 looping constructs per method. Looping
 *   constructs include for loops, while loops and do-while loops.
 * - You may not use nested loops.
 * - You may not declare any file-level variables.
 * - You may not use switch statements.
 * - You may not use the unsigned right shift operator (>>>)
 * - You may not write any helper methods, or call any other method from this or
 *   another file to implement any method.
 * - The only Java API methods you are allowed to invoke are:
 *     String.length()
 *     String.charAt()
 * - You may not invoke the above methods from string literals.
 *     Example: "12345".length()
 * - When concatenating numbers with Strings, you may only do so if the number
 *   is a single digit.
 *
 * Method-specific rules for this file:
 * - You may declare exactly one String variable each in intToHexString and
 *   and octalStringToBinaryString.
 */
public class Bases
{
    /**
     * Convert a string containing ASCII characters (in binary) to an int.
     *
     * You do not need to handle negative numbers. The Strings we will pass in
     * will be valid binary numbers, and able to fit in a 32-bit signed integer.
     *
     * Example: binaryStringToInt("111"); // => 7
     */
    public static int binaryStringToInt(String binary)
    {
        int power = 0;
        int result = 0;
        int curr = 0;
        for (int i = binary.length() - 1; i >=0; i--) {
            curr = binary.charAt(i) - '0';
            if (curr == 1) {
                result += 0x1 << power;
            }
            power++;
        }
        return result;
    }

    /**d
     * Convert a string containing ASCII characters (in octal) to an int.
     *
     * You do not need to handle negative numbers. The Strings we will pass in
     * will be valid octal numbers, and able to fit in a 32-bit signed integer.
     *
     * Example: octalStringToInt("46"); // => 38
     */
    public static int octalStringToInt(String octal)
    {
        int result = 0;
        int curr;
        for (int i = 0; i < octal.length(); i++) {
            curr = ((int)(octal.charAt(i))) - 48;
            result = result << 3;
            result += curr;
        }
        return result;
    }

    /**
     * Convert a int into a String containing ASCII characters (in hex).
     *
     * You do not need to handle negative numbers.
     * The String returned should contain the minimum number of characters
     * necessary to represent the number that was passed in.
     *
     * Example: intToHexString(166); // => "A6"
     *
     * You may declare one String variable in this method.
     */
    public static String intToHexString(int hex)
    {
        String result = "";
        int mod = 0;
        while (hex >= 1) {
            mod = hex - ((hex >> 4) << 4);
            if (mod <= 9) {
                result = mod + result;
            } else {
                result = (char) (mod + 55) + result;
            }
            hex = hex >> 4;
        }
        if (result.length() == 0) {
            return "0";
        }
        return result;
    }

    /**
     * Convert a String containing ASCII characters representing a number in
     * octal into a String containing ASCII characters that represent that same
     * value in binary.
     *
     * The output string should only contain numbers.
     * You do not need to handle negative numbers.
     * The length of all the octal strings passed in will be of size 10.
     * The binary string returned should contain 32 characters.
     *
     * Example: octalStringToBinaryString("0276415470"); // => 00000010111110100001101100111000
     *
     * You may declare one String variable in this method.
     */
    public static String octalStringToBinaryString(String octal)
    {
        String output = "";
        int result = 0;
        int curr;
        int b;
        for (int i = 0; i < octal.length(); i++) {
            curr = ((int)(octal.charAt(i))) - 48;
            result = result << 3;
            result += curr;
        }
        for (b = 31; b >= 0; b--) {
            if (((result >> b) & (1)) == 1) {
                output += "1";
            } else {
                output += "0";
            }
        }
        return output;
    }    
}
