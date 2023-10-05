# Convert .bb (bigbed) file to .bed file format
# bigBedToBed — converts a bigBed file to ASCII BED format.
# Extracting Data from the bigBed Format
# Because the bigBed files are indexed binary files, it can be difficult to extract data from them. 
# Reference page > (http://genome-euro.ucsc.edu/goldenPath/help/bigBed.html)

# To execute the contents of the .bashrc file in the current shell session (necessary to start conda)
    source ~/.bashrc

# install the ucsc-bigbedtobed
    cd anaconda3/envs/                          # go to your anaconda3 directory

    conda create --name ucsc-bigbedtobed        # create your ucsc-bigbedtobed environment
    
    cd anaconda3/envs/ucsc-bigbedtobed/         #go to your working directory
    
    conda activate ucsc-bigbedtobed             #activate conda environment
    
    conda install -c bioconda ucsc-bigbedtobed  #install ucsc-bedgraphtobigwig
    
# create your working directory for your ucsc-bedgraphtobigwig environment
    mkdir ucsc-bigbedtobed_mm10_enhancers       # working directory should be outside the anaconda3 directory
    cd ucsc-bigbedtobed_mm10_enhancers          # go to your ucsc-bedgraphtobigwig working directory

# activate the ucsc-bigbedtobed environment in your working directory
    conda activate ucsc-bigbedtobed             #activate conda environment

# ready to generate .bed (bed file)
    bigBedToBed mm10_ext_latest.bb mm10_ext_latest.bed

# bed file should contain just 4 columns; chromA  chromStartA  chromEndA  dataValueA
# this is the command to modify and print my desired file
    awk -v FS='\t' -v OFS='\t' '{print $1, $2, $3}' mm10_ext_latest.bed | head

# the command worked, now I will make the output file inclusing desired columns 
    awk -v FS='\t' -v OFS='\t' '{print $1, $2, $3}' mm10_ext_latest.bed > E4_coord_enhancers.bed
