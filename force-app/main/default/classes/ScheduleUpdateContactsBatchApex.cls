public class ScheduleUpdateContactsBatchApex implements Schedulable {
    public void execute(SchedulableContext SC) {
        NoOfContactsOnAccount b = new NoOfContactsOnAccount();
        Database.executeBatch(b);
    }
}