### Main ###
print(" *** BMI ***")
weight,height = map(float,input("Enter your weight(kg) and height(m) : ").split())

BMI = weight/(height*height)

print("Your status is : ",end='')
if BMI>=40:
    print("Case III Obesity.")
elif BMI>=35:
    print("Case II Obesity.")
elif BMI>=30:
    print("Case I Obesity.")
elif BMI>=25:
    print("Overweight.")
elif BMI>=18.5:
    print("Normal weight.")
else:
    print("Below normal weight.")