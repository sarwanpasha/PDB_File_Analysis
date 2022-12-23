
function [Lrmsd,Irmsd, Fnat, Accuracy] = CCFIT_Matlab_Wrapper(ccfit_path,output_file_path,pr_1,pr_2)

% path = "/data/hummels/ITScorePR1.0/";
% path = file_path;

first_protein_file = output_file_path + "pdb_subset_Model_" + string(pr_1) + "_ter_1.pdb";
first_rna_file = output_file_path + "pdb_subset_Model_" + string(pr_1) + "_ter_2.pdb";
second_protein_file = output_file_path + "pdb_subset_Model_" + string(pr_2) + "_ter_1.pdb";
second_rna_file = output_file_path + "pdb_subset_Model_" + string(pr_2) + "_ter_2.pdb";

% first_protein_file = '1C0A_bprotein.pdb';
% first_protein_file = pr_1;

% first_rna_file = '1C0A_brna.pdb';
% first_rna_file = rna_1;

% second_protein_file = '1C0A_protein.pdb';
% second_protein_file = pr_2;

% second_rna_file = '1C0A_rna.pdb';
% second_rna_file = rna_2;


%Command to compile the ccfit fortran code
% unix('gfortran /data/hummels/ITScorePR1.0/ccfit.for -o ccfit')

%command to execute ccfit and get the resultant numbers
% string_command = path + 'ccfit ' + path + '1C0A_bprotein.pdb ' + path + '1C0A_brna.pdb ' + path + '1C0A_protein.pdb ' + path + '1C0A_rna.pdb';
string_command = ccfit_path + 'ccfit ' + first_protein_file + ' ' + first_rna_file + ' ' + ...
    second_protein_file + ' ' + second_rna_file;

% disp("command check: " + string_command)
% unix(string_command)
[status,results_numbers] = unix(string_command);
disp("CCFIT Output: " + results_numbers);
values = split(results_numbers," ");
values = values(~cellfun('isempty',values));
values(ismember(values,"=")) = [];
values(ismember(values,"Lrmsd")) = [];
values(ismember(values,"Irmsd")) = [];
values(ismember(values,"Fnat")) = [];
values(ismember(values,"Accuracy")) = [];
% values(ismember(values,"%")) = [];
% disp("Raw Output: " + values);

% Lrmsd_1 = split(values{1},"  ");
Lrmsd = cell2mat(split([values{1},values{2}],"'"));

% Irmsd_1 = split(values{2},"   ");
Irmsd = cell2mat(split([values{3},values{4}],"'"));

% Fnat_1 = split(values{3},"  ");
% disp("Fnat_1: " + Fnat_1)
Fnat = cell2mat(split([values{5},values{6}],"'"));

% Accuracy_1 = split(values{4},"   ");
Accuracy_2 = cell2mat(split(values{7},"\n"));
Accuracy = Accuracy_2(1);

% disp("Lrmsd: " + Lrmsd + ", Irmsd:" + Irmsd + ", Fnat: " + Fnat + ", Accuracy: " + Accuracy);

end
