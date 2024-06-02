def read_txt_file(file_path):
    with open(file_path, 'r') as file:
        return file.readlines()

def write_mif_file(config_buttons, binary_identifiers, output_file):
    with open(output_file, 'w') as file:
        file.write("DEPTH = {};\n".format(len(config_buttons) * 6))
        file.write("WIDTH = 16;\n")
        file.write("ADDRESS_RADIX = UNS;\n")
        file.write("DATA_RADIX = BIN;\n")
        file.write("CONTENT\n")
        file.write("BEGIN\n")
        for i in range(len(config_buttons)):
            config_button = config_buttons[i].strip()
            binary_identifier = binary_identifiers[i].strip()
            first_16_bits = binary_identifier[:16]
            last_16_bits = binary_identifier[16:]
            file.write("{} : {};\n".format(6*i + 1, config_button))
            file.write("{} : {};\n".format(6*i + 2, first_16_bits))
            file.write("{} : {};\n".format(6*i + 3, last_16_bits))
            file.write("{} : {};\n".format(6*i + 4, config_button))
            file.write("{} : {};\n".format(6*i + 5, first_16_bits))
            file.write("{} : {};\n".format(6*i + 6, last_16_bits))
            
        file.write("END;\n")

def main():
    config_buttons_file = "configurations_min.txt"
    binary_identifiers_file = "identifiers_min.txt"
    output_file = "data_mem.mif"

    config_buttons = read_txt_file(config_buttons_file)
    binary_identifiers = read_txt_file(binary_identifiers_file)

    # if len(config_buttons) != len(binary_identifiers):
    #     print("Error: The number of config buttons and binary identifiers must be the same.")
    #     return

    write_mif_file(config_buttons, binary_identifiers, output_file)
    print("MIF file generated successfully.")

if __name__ == "__main__":
    main()
