### Main ###
print("*** Converting hh.mm.ss to seconds ***")
hour, minute, second = map(int, input("Enter hh mm ss : ").split())

if(hour < 0 or minute < 0 or minute > 59 or second < 0 or second > 59):
    if(hour < 0):
        alert = 'hh({}) is invalid!'.format(hour)
    elif(minute < 0 or minute > 59):
        alert = 'mm({}) is invalid!'.format(minute)
    elif(second < 0 or second > 59):
        alert = 'ss({}) is invalid!'.format(second)
    print(alert)
else:
    print('{:02d}:{:02d}:{:02d} = {:,} seconds'.format(hour, minute, second, second+(minute*60)+(hour*60*60)))