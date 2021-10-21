package edu.parinya.softarchdesign.structural;

/*
* ใช้การ implements HealthcareServiceable น่าจะเหมาะสมกว่า extends HealthcareWorker (ถ้าตาม https://refactoring.guru/)
* [แต่ file นี้ implement ตาม HealthcareWorker.svg ไปก่อน]
*/

public abstract class HealthcareWorkerDecorator extends HealthcareWorker{
    private HealthcareWorker worker;  // ขออนุญาต เเก้ไขจาก protected (HealthcareWorker.svg) ไปเป็น private เนื่องจากไม่เห็นถึงความจำเป็นที่ sub class จะต้อง สืบทอด/เข้าถึง data field นี้โดยตรง

    public HealthcareWorkerDecorator(HealthcareWorker worker){
        super(worker);  // ถ้าใช้การ implements HealthcareServiceable เเทน extends HealthcareWorker จะไม่จำเป็นต้องมี บรรทัดนี้

        this.worker = worker;
    }

    public void service(){
        this.worker.service();
    }

    public double getPrice(){
        return this.worker.getPrice();
    }
}
