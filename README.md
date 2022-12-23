# Single Matlab Script
To get the taste of all tasks, use the matlab script `PDB_Test_Script.m`.
In that code, you need to change the path of input raw pdb file and the path to output file where the breaked pdb files will be stored.

All the three steps defined below are included in this single script with comments for better understanding.

## Step 1: Break PDB File into single protein-aptamer file
To break the raw PDB file to get the proteins and aptamers combined in a single file, use the function
```
PDB_Single_File_Parsing.m
```
It takes two arguments as input `file_name`, `output_path`.

## Step 2: Break PDB File into separate protein-aptamer file
To break the raw PDB file to get the proteins and aptamers as separate files, use the function
```
PDB_Separate_File_Parsing.m
```
It takes two arguments as input `output_path` and `Model_number`.

## Step 3: Compare pdb files
In this step, we use a flag to compute either RMSD score using scripts `Calculate_RMSD_Matlab_Wrapper.m` and CCFIT score using `CCFIT_Matlab_Wrapper.m`

The detail for other functions is described below.

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
