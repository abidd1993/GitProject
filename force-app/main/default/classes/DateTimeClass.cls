public class DateTimeClass {
    
    public void timeMethod(){
        datetime x = datetime.now();
        system.debug(x);
        system.debug('Date and Time 5 days from now is '+x.addDays(5));
        system.debug('Date and Time 5 months from now is '+x.addMonths(5));
    }

}