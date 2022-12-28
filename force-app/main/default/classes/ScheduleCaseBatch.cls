global class ScheduleCaseBatch implements Schedulable {
    global void execute(SchedulableContext sc) {
        BatchClassForCaseTable b = new BatchClassForCaseTable();
        database.executeBatch(b);
    }
}