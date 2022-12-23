input_file_path = "/data/hummels/digitalSELEX-2/pdbfiles/";
input_file_name = "1wwf.ent.pdb";
output_file_path = "/data/hummels/digitalSELEX-2/pdbfiles/Temporary_output/";


system("python PDB_File_Parsing_All_Models.py " + input_file_path + " " + input_file_name + " " + output_file_path);