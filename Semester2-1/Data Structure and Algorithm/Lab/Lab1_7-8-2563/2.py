### Main ###
print(" *** Wind classification ***")
speed = float(input("Enter wind speed (km/h) : "))

if(speed>=209):
    print("Wind classification is Super Typhoon.")
elif(speed>=102.00):
    print("Wind classification is Typhoon.")
elif(speed>=56.00):
    print("Wind classification is Tropical Storm.")
elif(speed>=52.00):
    print("Wind classification is Depression.")
else: 
    print("Wind classification is Breeze.")