import numpy as np


def PDB_Single_File_Parsing(input_data_path,file_name,output_path):
    data_path = input_data_path
    input_file_name = file_name
    store_path = output_path

    id_arr = []
    types_arr = []
    store_all_atoms = []
    model_holder = 0
    for line in open(data_path + input_file_name):
        # read line by line and split each row
        list = line.split()
        # get the first column
        id = list[0]
        if id == 'MODEL':
            model_holder = list[1]
            store_all_atoms = []
        id_arr.append(id)

        #working with only ATOM, TER, and HETATM
        if id == 'ATOM' or id == 'TER' or id == 'HETATM':
            list_new = [line[:6], line[7:11], line[12:16], line[17:20], line[21], line[23:26], line[27:38], line[39:46], line[47:54], line[55:60], line[61:66], line[67:78]]
            aa = str(list_new)
            aa = aa.replace("[","")
            aa = aa.replace("]","")
            aa = aa.split(",")
            store_all_atoms.append(aa)
        if model_holder!=0:
            with open(store_path + 'pdb_complete_Model_' + str(model_holder) + '.pdb', 'w') as f:
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
    print("Complete PDB files parsed")




#input_data_path = "E:/RA/BC_Project/Data/"
#file_name = "1wwf.ent.pdb"
#output_path = "E:/RA/BC_Project/Data/stored/"

#PDB_Separate_File_Parsing(input_data_path,file_name,output_path)

