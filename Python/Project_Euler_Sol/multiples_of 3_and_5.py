def multiples_of_3_and_5(number):
    #Initializing running sum variable to 0
    sum = 0
    for i in range(1,number):
        #include i in the running sum if i is divisible by 3 or 5
        if i%3 == 0 or i%5 ==0:
            sum = sum + i
    return sum

print(multiples_of_3_and_5(int(input("Enter the Range :"))))