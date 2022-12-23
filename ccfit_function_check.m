path = "/data/hummels/ITScorePR1.0/Temporary_files/";
ccfit_path = "/data/hummels/ITScorePR1.0/";

% first_protein_file = '1C0A_protein.pdb';
% first_rna_file = '1C0A_rna.pdb';
% second_protein_file = '1C0A_bprotein.pdb';
% second_rna_file = '1C0A_brna.pdb';


first_protein_file = 'pdb_subset_Model_19_ter_1.pdb';
first_rna_file = 'pdb_subset_Model_19_ter_2.pdb';
second_protein_file = 'pdb_subset_Model_2_ter_1.pdb';
second_rna_file = 'pdb_subset_Model_2_ter_2.pdb';

[Lrmsd,Irmsd, Fnat, Accuracy] = CCFIT_Matlab_Wrapper(ccfit_path,path,first_protein_file,first_rna_file,second_protein_file,second_rna_file);

disp("Lrmsd: " + Lrmsd + ", Irmsd:" + Irmsd + ", Fnat: " + Fnat + ", Accuracy: " + Accuracy);

