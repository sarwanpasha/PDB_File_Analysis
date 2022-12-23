# Single Matlab Script
To get the taste of all tasks, use the matlab script `PDB_Test_Script.m`.
In that code, you need to change the path of input raw pdb file and the path to output file where the breaked pdb files will be stored.

All the three steps defined below are included in this single script with comments for better understanding.

In step 3, there is a flag to compute either RMSD or CCFIT score between pdb files.

This repository performs 3 tasks.

## Break PDB File
To break the raw PDB file to get the proteins and aptamers, use the function
```
PDB_file_parsing_matlab_wrapper.m
```
It calls two python files, namely `PDB_Separate_File_Parsing.py` and `PDB_Single_File_Parsing.py` python script that takes takes three arguments as input `input_data_path`, `file_name`, `output_path`. For example:

```
input_data_path = "Sample_Data/";
file_name = "1wwf.ent.pdb";
output_path = "Sample_Data/";
```
if you want single file including protein and aptamers, run this line
```
system("python PDB_Single_File_Parsing.py " + input_file_path + " " + input_file_name + " " + output_file_path);
```
if you want two separate files for protein and aptamers, run this line
```
system("python PDB_Separate_File_Parsing.py " + input_file_path + " " + input_file_name + " " + output_file_path);
```
This matlab wrapper in `PDB_file_parsing_matlab_wrapper.m` will then write the new files in the output folder mentioned in the matlab script

## Comparison Using CCFIT
To compare two pdb files and their respective aptamers, use `CCFIT_Matlab_Wrapper.m` function. It takes the input file path, first protein file name, its aptamer file name, second protein file name, and its aptamer file name as input. An example matlab script regarding how to run it is given in `ccfit_function_check.m` code. It works as follows:
```
path = "Sample_Data/"
ccfit_path = "CCFIT_Compileable/";
first_protein_file = '1C0A_bprotein.pdb';
first_rna_file = '1C0A_brna.pdb';
second_protein_file = '1C0A_protein.pdb';
second_rna_file = '1C0A_rna.pdb';
[Lrmsd,Irmsd, Fnat, Accuracy] = CCFIT_Matlab_Wrapper(ccfit_path,path,first_protein_file,first_rna_file,second_protein_file,second_rna_file);
```
It calls ``ccfit`` function and gives Lrmsd,Irmsd, Fnat, Accuracy as output. All these system calls are included in `CCFIT_Matlab_Wrapper.m` matlab wrapper.

## Comparison Using RMSD
To compute RMSD value between two pdb files, use the following matlab wrapper 
```
Calculate_RMSD_Matlab_Wrapper.m
```

It calls `calculate_rmsd.py` python script, which takes two pdb files (combined files including proteins and aptamers) as input and gives the RMSD values after appropriate rotations.

The idea to calculate the RMSD using rotation is taken from the following repository
[https://github.com/charnley/rmsd]
