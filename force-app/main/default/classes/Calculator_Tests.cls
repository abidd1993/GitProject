@isTest
public class Calculator_Tests {
    @isTest
    public static void addition(){
        Calculator.addition(1, 0);
    }
    
    @isTest
    public static void subtraction(){
        Calculator.subtraction(1, 0);
    }
    
    @isTest
    public static void divisionByZero(){
        Boolean caught = False;
        try{
            Calculator.divide(1, 0);
        } catch (Calculator.CalculatorException e) {
            System.assertEquals('you still can\'t divide by zero', e.getMessage(), 'caught the right exception');
            caught = true;
        }
        System.Assert(caught, 'threw expected exception');
    }
    
    @isTest
    public static void divisionByTwo(){
        Boolean caught = True;
        try{
            Calculator.divide(1, 2);
        } catch (Calculator.CalculatorException e) {
            System.assertEquals('you still can\'t divide by zero', e.getMessage(), 'caught the right exception');
            caught = true;
        }
        System.Assert(caught, 'threw expected exception');
    }
    
    @isTest
    public static void divisionByNegTwo(){
        Boolean caught = False;
        try{
            Calculator.divide(-2, 2);
        } catch (Calculator.CalculatorException e) {
            System.assertEquals('Division returned a negative value.-1', e.getMessage(), 'caught the right exception');
            caught = true;
        }
        System.Assert(caught, 'threw expected exception');
    }
    
    @isTest
    public static void multiplyByZero(){
        Boolean caught = False;
        try {
            Calculator.multiply(1, 0);
        } catch (Calculator.CalculatorException e) {
            System.assertEquals('It doesn\'t make sense to multiply by zero', e.getMessage(), 'caught the right exception');
            caught = true;
        }
        system.Assert(caught, 'threw expected exception');
    }
    
    @isTest
    public static void multiplyByTwo(){
        Boolean caught = True;
        try {
            Calculator.multiply(1, 2);
        } catch (Calculator.CalculatorException e) {
            System.assertEquals('It doesn\'t make sense to multiply by zero', e.getMessage(), 'caught the right exception');
            caught = True;
        }
        system.Assert(caught, 'threw expected exception');
    }

}