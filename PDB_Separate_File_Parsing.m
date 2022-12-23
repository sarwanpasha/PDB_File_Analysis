
function PDB_Separate_File_Parsing(output_file_path,Model_Number)

single_pdb_file_name = output_file_path + "pdb_complete_Model_" + string(Model_Number) + ".pdb";
query_string_2 = "python PDB_Separate_File_Parsing.py " + single_pdb_file_name + " " + output_file_path + " " + Model_Number;
system(query_string_2);

disp("Separate PDB File Breaking Executed Successfully!!")

end
