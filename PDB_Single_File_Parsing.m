
function PDB_Single_File_Parsing(raw_file,output_file_path)

query_string = "python PDB_Single_File_Parsing.py " + raw_file + " " + output_file_path;
system(query_string);

disp("Single PDB File Breaking Executed Successfully!!")

end
