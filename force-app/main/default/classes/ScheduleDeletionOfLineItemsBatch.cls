public class ScheduleDeletionOfLineItemsBatch implements Schedulable {
    public void execute(SchedulableContext SC) {
        DeleteLineItemBatchApex b = new DeleteLineItemBatchApex();
        Database.executeBatch(b);
    }
}