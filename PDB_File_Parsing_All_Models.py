import numpy as np
import sys

def PDB_file_parsing(input_data_path,file_name,output_path):
#     data_path = "E:/RA/BC_Project/Data/"
    data_path = input_data_path
    
#     input_file_name = "1wwf.ent.pdb"
    input_file_name = file_name

    #output file path
#     store_path = "E:/RA/BC_Project/Data/stored/"
    store_path = output_path

    model_number = 2

    visited = {}
    id_arr = []
    types_arr = []
    store_all_atoms = []
    model_holder = 0
    ter_counter = 0
    for line in open(data_path + input_file_name):
        # read line by line and split each row
        list = line.split()
        # get the first column
        id = list[0]
        if id == 'MODEL':
            model_holder = list[1]
            ter_counter = 0
    #     for model_holder in model_number:
    #     if model_holder == str(model_number):
        id_arr.append(id)

        #working with only ATOM
        if id == 'ATOM':
            list_new = [line[:6], line[7:11], line[12:16], line[17:20], line[21], line[23:26], line[27:38], line[39:46], line[47:54], line[55:60], line[61:66], line[67:78]]
    #             aa = str(list_new).replace("\'","")
            aa = str(list_new)
            aa = aa.replace("[","")
            aa = aa.replace("]","")
            aa = aa.split(",")
            store_all_atoms.append(aa)
        elif id == 'TER':
    #         print(id)
            ter_counter = ter_counter+1
            with open(store_path + 'pdb_subset_Model_' + model_holder + '_ter_' + str(ter_counter) + '.pdb', 'w') as f:
    #                 for line in store_all_atoms:
                for i in range(len(store_all_atoms)):
                    aa = store_all_atoms[i]
                    aa = str(aa)
                    aa = aa.replace("\'ATOM","ATOM")
                    aa = aa.replace("[","")
                    aa = aa.replace("]","")
                    aa = aa.replace(", ","")
                    aa = aa.replace("\'","")
                    aa = aa.replace('\"',"")
                    aa = aa.replace('\\',"\'")
                    f.write(aa)
                    f.write('\n')

            store_all_atoms = []
    print("PDB file parsed")


if __name__ == '__main__':
    
    input_data_path = sys.argv[1]
    file_name = sys.argv[2]
    output_path = sys.argv[3]
    
    PDB_file_parsing(input_data_path,file_name,output_path)

