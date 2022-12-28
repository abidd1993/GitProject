public class ScheduleBatchApex implements Schedulable {
    public void execute(SchedulableContext SC) {
        AddAbsyzToAccount b = new AddAbsyzToAccount();
        Database.executeBatch(b,10);
    }
}