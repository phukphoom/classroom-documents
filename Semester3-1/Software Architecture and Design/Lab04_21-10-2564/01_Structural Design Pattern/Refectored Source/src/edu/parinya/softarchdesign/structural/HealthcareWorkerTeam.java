package edu.parinya.softarchdesign.structural;

import java.util.Set;
import java.util.HashSet;

public class HealthcareWorkerTeam implements HealthcareServiceable{
    private Set<HealthcareServiceable> members = new HashSet<>();

    public void addMember(HealthcareServiceable member){
        this.members.add(member);
    }

    public void removeMember(HealthcareServiceable member){
        this.members.remove(member);
    }

    public void service(){
        this.members.forEach((member)->{
            member.service();
        });
    }

    public double getPrice() {
        double totalPrice = 0;
        for (HealthcareServiceable member:this.members) {
            totalPrice += member.getPrice();
        }

        return totalPrice;
    }
}
