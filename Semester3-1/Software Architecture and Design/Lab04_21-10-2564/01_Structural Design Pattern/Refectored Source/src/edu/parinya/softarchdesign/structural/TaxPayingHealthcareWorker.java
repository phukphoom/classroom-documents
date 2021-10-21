package edu.parinya.softarchdesign.structural;

public class TaxPayingHealthcareWorker extends HealthcareWorkerDecorator{

    public TaxPayingHealthcareWorker(HealthcareWorker worker){
        super(worker);
        System.out.println("Decorate " +  worker.getName() +" with TaxPaying.");
    }

    @Override
    public double getPrice(){
        final double tax = 0.1;

        return super.getPrice() * (1.0 + tax);
    }
}
