function [rmsd_result] = Calculate_RMSD_Matlab_Wrapper(combines_first_protein_file,combines_second_protein_file)

[status,rmsd_result] = system("python calculate_rmsd.py " + combines_first_protein_file + " " + combines_second_protein_file);

% disp("RMSD: " + rmsd_result);

end
