



%%%%% Step 1 %%%%% 
%%%%% Read raw pdb file and extract single file for each model
raw_file = "/data/hummels/digitalSELEX-2/1wwf.ent.pdb"; %example pdb file
output_file_path = "/data/hummels/digitalSELEX-2/PDB_Output_files/";
query_string = "python PDB_Single_File_Parsing.py " + raw_file + " " + output_file_path;
system(query_string);

%%
%%%%% Step 2 %%%%% 
%%%%% Now, we will read one of those pdb files from a single model and
%%%%% break them into protein and aptamer files
Model_Number = 2; % need to mention the model number that we want to parse

single_pdb_file_name = output_file_path + "pdb_complete_Model_" + string(Model_Number) + ".pdb";
query_string_2 = "python PDB_Separate_File_Parsing.py " + single_pdb_file_name + " " + output_file_path + " " + Model_Number;
system(query_string_2);

%%
%%%%% Step 3 %%%%% 
%%%%% Now, since we have created single and separate protein-Aptamer files,
%%%%% Lets use them to compute goodness score using a flag

first_protein_file_model = 1;
second_protein_file_model = 2;

%variables for two separate protein-aptamer files for comparison
separate_first_protein_file = output_file_path + "pdb_subset_Model_" + string(first_protein_file_model) + "_ter_1.pdb";
separate_first_aptamer_file = output_file_path + "pdb_subset_Model_" + string(first_protein_file_model) + "_ter_2.pdb";
separate_second_protein_file = output_file_path + "pdb_subset_Model_" + string(second_protein_file_model) + "_ter_1.pdb";
separate_second_aptamer_file = output_file_path + "pdb_subset_Model_" + string(second_protein_file_model) + "_ter_2.pdb";

%variables for two combined protein-aptamer files for comparison
combines_first_protein_file = output_file_path + "pdb_complete_Model_" + string(first_protein_file_model) + ".pdb";
combines_second_protein_file = output_file_path + "pdb_complete_Model_" + string(second_protein_file_model) + ".pdb";

ccfit_path = "/data/hummels/ITScorePR1.0/";

flag = 'CCFIT'; %RMSD or CCFIT

if isequal(flag,'RMSD')
    disp("RMSD Setting")
    [status,rmsd_result] = system("python calculate_rmsd.py " + combines_first_protein_file + " " + combines_second_protein_file);
    disp("RMSD Score is: " + rmsd_result);
else
    disp("CCFIT Setting")
    [Lrmsd,Irmsd, Fnat, Accuracy] = CCFIT_Matlab_Wrapper(ccfit_path,separate_first_protein_file,separate_first_aptamer_file,...
    separate_second_protein_file,separate_second_aptamer_file);
    disp("Lrmsd: " + Lrmsd + ", Irmsd:" + Irmsd + ", Fnat: " + Fnat + ", Accuracy: " + Accuracy);
end





