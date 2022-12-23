%%%%% Step 1 %%%%% 
%%%%% Read raw pdb file and extract single file for each model
raw_file = "/data/hummels/digitalSELEX-2/1wwf.ent.pdb"; %example pdb file
output_file_path = "/data/hummels/digitalSELEX-2/PDB_Output_files/";
PDB_Single_File_Parsing(raw_file,output_file_path);


%%
%%%%% Step 2 %%%%% 
%%%%% Now, we will read one of those pdb files from a single model and
%%%%% break them into protein and aptamer files
Model_Number = 2; % need to mention the model number that we want to parse
PDB_Separate_File_Parsing(output_file_path,Model_Number);

%%
%%%%% Step 3 %%%%% 
%%%%% Now, since we have created single and separate protein-Aptamer files,
%%%%% Lets use them to compute goodness score using a flag

first_protein_file_model = 1;
second_protein_file_model = 2;

%variables for two combined protein-aptamer files for comparison
combines_first_protein_file = output_file_path + "pdb_complete_Model_" + string(first_protein_file_model) + ".pdb";
combines_second_protein_file = output_file_path + "pdb_complete_Model_" + string(second_protein_file_model) + ".pdb";

ccfit_path = "/data/hummels/ITScorePR1.0/";

flag = 'RMSD'; %RMSD or CCFIT

if isequal(flag,'RMSD')
    disp("RMSD Results")
    rmsd_result = Calculate_RMSD_Matlab_Wrapper(combines_first_protein_file,combines_second_protein_file);
    disp("RMSD Score is: " + rmsd_result);
else
    disp("CCFIT Results")
    [Lrmsd,Irmsd, Fnat, Accuracy] = CCFIT_Matlab_Wrapper(ccfit_path,output_file_path,first_protein_file_model,second_protein_file_model);
    disp("Lrmsd: " + Lrmsd + ", Irmsd:" + Irmsd + ", Fnat: " + Fnat + ", Accuracy: " + Accuracy);
end





