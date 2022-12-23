% clc;


pdb_file_1 = "./pdbfiles/proteins/1r42.pdb";
pdb_file_2 = "./pdbfiles/proteins/1r42.pdb";

[status,rmsd_result] = system("python calculate_rmsd.py " + pdb_file_1 + " " + pdb_file_2);

disp("RMSD: " + rmsd_result);
