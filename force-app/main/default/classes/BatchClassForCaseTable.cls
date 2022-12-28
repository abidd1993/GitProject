global class BatchClassForCaseTable implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, CaseNumber, Origin, Reason, Subtype__c, Owner.Name, Description, Priority, Status FROM Case WHERE Status = \'Completed\'';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext bc, List<Case> scope) {

        String htmlBody = '';

        //open table
        htmlBody = '<table border="1" style="border-collapse: collapse"><caption>Request Summary Data</caption><tr><th>Case Number</th><th>Origin</th><th>Reason</th><th>Sub Type</th><th>Owner Id</th><th>Description</th><th>Priority</th><th>Status</th></tr>';

        for (Case c : scope) {
            String myCaseNumber = c.CaseNumber; if(c.CaseNumber == null){ myCaseNumber = 'No Data'; }
            String myOrigin = c.Origin; if(c.Origin == null){ myOrigin = 'No Data'; }
            String myReason = c.Reason; if(c.Reason == null){ myReason = 'No Data'; }
            String mySubType = c.Subtype__c; if(c.Subtype__c == null){ mySubType = 'No Data'; }
            String myOwnerId = c.Owner.Name; if(c.Owner.Name == null){ myOwnerId = 'No Data'; }
            String myDescription = c.Description; if(c.Description == null){ myDescription = 'No Data'; }
            String myPriority = c.Priority; if(c.Priority == null){ myPriority = 'No Data'; }
            String myStatus = c.Status; if(c.Status == null){ myStatus = 'No Data'; }

            htmlBody += '<tr><td>' + myCaseNumber + '</td><td>' + myOrigin + '</td><td>' + myReason + '</td><td>' + mySubType + '</td><td>' + myOwnerId + '</td><td>' + myDescription + '</td><td>' + myPriority + '</td><td>' + myStatus + '</td></tr>';
        }

        //close table
        htmlBody += '</table>';
        System.debug(htmlBody);
        

        // // Get Case Manager Id
        String caseManagerEmail = [SELECT Id, Profile.Name, Email FROM User WHERE Profile.Name = 'Case Manager' LIMIT 1].Email;

        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
        // mail.setTargetObjectId(caseManagerId);
        // String[] toAddresses = new String[]{''};

        List<String> sendTo = new List<String>();
        sendTo.add(caseManagerEmail);
        sendTo.add('shameel.ahmed@absyz.com');

        mail.setToAddresses(sendTo);
        
        mail.setReplyTo('mohammed.hussain.ext@absyz.com');
        mail.setSenderDisplayName('Mohammed Hussain');

        mail.setSubject('Completed Case Report');
        mail.setHtmlBody(htmlBody);
        
        mails.add(mail);
        Messaging.sendEmail(mails);
    }

    global void finish(Database.BatchableContext bc) {
        // Do something when the job is complete
    }
}