# Create: event_log.txt

# 47. Write three event-processing messages.
with open("event_log.txt", "w") as file:
    file.write("Registration file loaded.\nEvent details validated.\nBooking amounts calculated.\n")

# 48. Append two more messages.
with open("event_log.txt", "a") as file:
    file.write("Staff data processed.\nEvent report completed.\n")

# 49. Read the complete file.
with open("event_log.txt", "r") as file:
    print(file.read())

# 50. Read the file line by line.
with open("event_log.txt", "r") as file:
    for line in file:
        print(line)

# 51. Display every line without additional blank lines.
# 52. Use with open() rather than manually closing the file.
with open("event_log.txt", "r") as file:
    for line in file:
        # Way 1
        print(line, end="")

        # Way 2
        # print(line.strip())

