package edu.parinya.softarchdesign.structural;

import java.util.Date;

public class TimeLoggingHealthcareWorker extends HealthcareWorkerDecorator{

    public TimeLoggingHealthcareWorker(HealthcareWorker worker){
        super(worker);
        System.out.println("Decorate " +  worker.getName() +" with TimeLogging.");
    }

    @Override
    public void service(){
        Date now = new Date();

        System.out.print(now + ": ");
        super.service();
    }
}