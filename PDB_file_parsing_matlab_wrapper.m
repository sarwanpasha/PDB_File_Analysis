input_file_path = "/data/hummels/digitalSELEX-2/pdbfiles/";
input_file_name = "1wwf.ent.pdb";

output_file_path = "/data/hummels/digitalSELEX-2/pdbfiles/Temporary_output/";

%if you want single file including protein and aptamers, run this line and comment the next one
system("python PDB_Single_File_Parsing.py " + input_file_path + " " + input_file_name + " " + output_file_path);

%if you want two separate files for protein and aptamers, run this line and comment the above one
system("python PDB_Separate_File_Parsing.py " + input_file_path + " " + input_file_name + " " + output_file_path);