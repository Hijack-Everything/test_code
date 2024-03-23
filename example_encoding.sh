import base64
input_unknown_file_path = 'anyfiletype.filetype'
new_a_file_path = 'a.outtype'
with open(input_unknown_file_path, 'r') as unknown_file:
    base64_string = unknown_file.read()
with open(new_a_file_path, 'wb') as a_file:
    a_file.write(base64.b64decode(base64_string))
print(f' file has been created at {new_a_file_path} from base64 string in {input_unknown_file_path}')
