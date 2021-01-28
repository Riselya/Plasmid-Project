

############################### plasflow ########################
############################ plasflow ########################

# follow setup instructions


conda config --add channels bioconda

conda config --add channels conda-forge

conda create --name plasflow python=3.5

source activate plasflow

conda install plasflow -c smaegol

conda install -c jjhelmus tensorflow=0.10.0rc0

conda install -c bioconda perl -bioperl perl-getopt-long
cpan -i Bio::Perl Getopt::longer

#test
PlasFlow.py --input Citrobacter_freundii_strain_CAV1321_scaffolds.fasta --output test.plasflow_predictions.tsv --threshold 0.7

## error with tensorflow. This was the solution 

conda install protobuf==3.0.0b2




################################## code ##########

##make sure all cluster fasta files are within working directory file



PlasFlow.py --input  cluster.1.fasta --output plasflow.cluster.1.tsv --threshold 0.99
PlasFlow.py --input  cluster.2.fasta --output plasflow.cluster.2.tsv --threshold 0.99
PlasFlow.py --input  cluster.3.fasta --output plasflow.cluster.3.tsv --threshold 0.99
PlasFlow.py --input  cluster.4.fasta --output plasflow.cluster.4.tsv --threshold 0.99
PlasFlow.py --input  cluster.5.fasta --output plasflow.cluster.5.tsv --threshold 0.99
PlasFlow.py --input  cluster.6.fasta --output plasflow.cluster.6.tsv --threshold 0.99
PlasFlow.py --input  cluster.7.fasta --output plasflow.cluster.7.tsv --threshold 0.99
PlasFlow.py --input  cluster.8.fasta --output plasflow.cluster.8.tsv --threshold 0.99
PlasFlow.py --input  cluster.9.fasta --output plasflow.cluster.9.tsv --threshold 0.99
PlasFlow.py --input  cluster.10.fasta --output plasflow.cluster.10.tsv --threshold 0.99
PlasFlow.py --input  cluster.11.fasta --output plasflow.cluster.11.tsv --threshold 0.99
PlasFlow.py --input  cluster.12.fasta --output plasflow.cluster.12.tsv --threshold 0.99
PlasFlow.py --input  cluster.13.fasta --output plasflow.cluster.13.tsv --threshold 0.99
PlasFlow.py --input  cluster.14.fasta --output plasflow.cluster.14.tsv --threshold 0.99
PlasFlow.py --input  cluster.15.fasta --output plasflow.cluster.15.tsv --threshold 0.99
PlasFlow.py --input  cluster.16.fasta --output plasflow.cluster.16.tsv --threshold 0.99
PlasFlow.py --input  cluster.17.fasta --output plasflow.cluster.17.tsv --threshold 0.99
PlasFlow.py --input  cluster.18.fasta --output plasflow.cluster.18.tsv --threshold 0.99
PlasFlow.py --input  cluster.19.fasta --output plasflow.cluster.19.tsv --threshold 0.99
PlasFlow.py --input  cluster.20.fasta --output plasflow.cluster.20.tsv --threshold 0.99
PlasFlow.py --input  cluster.21.fasta --output plasflow.cluster.21.tsv --threshold 0.99
PlasFlow.py --input  cluster.22.fasta --output plasflow.cluster.22.tsv --threshold 0.99
PlasFlow.py --input  cluster.23.fasta --output plasflow.cluster.23.tsv --threshold 0.99
PlasFlow.py --input  cluster.24.fasta --output plasflow.cluster.24.tsv --threshold 0.99
PlasFlow.py --input  cluster.25.fasta --output plasflow.cluster.25.tsv --threshold 0.99
PlasFlow.py --input  cluster.26.fasta --output plasflow.cluster.26.tsv --threshold 0.99
PlasFlow.py --input  cluster.27.fasta --output plasflow.cluster.27.tsv --threshold 0.99
PlasFlow.py --input  cluster.28.fasta --output plasflow.cluster.28.tsv --threshold 0.99
PlasFlow.py --input  cluster.29.fasta --output plasflow.cluster.29.tsv --threshold 0.99
PlasFlow.py --input  cluster.30.fasta --output plasflow.cluster.30.tsv --threshold 0.99
PlasFlow.py --input  cluster.31.fasta --output plasflow.cluster.31.tsv --threshold 0.99
PlasFlow.py --input  cluster.32.fasta --output plasflow.cluster.32.tsv --threshold 0.99
PlasFlow.py --input  cluster.33.fasta --output plasflow.cluster.33.tsv --threshold 0.99
PlasFlow.py --input  cluster.34.fasta --output plasflow.cluster.34.tsv --threshold 0.99
PlasFlow.py --input  cluster.35.fasta --output plasflow.cluster.35.tsv --threshold 0.99
PlasFlow.py --input  cluster.36.fasta --output plasflow.cluster.36.tsv --threshold 0.99
PlasFlow.py --input  cluster.37.fasta --output plasflow.cluster.37.tsv --threshold 0.99
PlasFlow.py --input  cluster.38.fasta --output plasflow.cluster.38.tsv --threshold 0.99
PlasFlow.py --input  cluster.39.fasta --output plasflow.cluster.39.tsv --threshold 0.99
PlasFlow.py --input  cluster.40.fasta --output plasflow.cluster.40.tsv --threshold 0.99
PlasFlow.py --input  cluster.41.fasta --output plasflow.cluster.41.tsv --threshold 0.99
PlasFlow.py --input  cluster.42.fasta --output plasflow.cluster.42.tsv --threshold 0.99
PlasFlow.py --input  cluster.43.fasta --output plasflow.cluster.43.tsv --threshold 0.99
PlasFlow.py --input  cluster.44.fasta --output plasflow.cluster.44.tsv --threshold 0.99
PlasFlow.py --input  cluster.45.fasta --output plasflow.cluster.45.tsv --threshold 0.99
PlasFlow.py --input  cluster.46.fasta --output plasflow.cluster.46.tsv --threshold 0.99
PlasFlow.py --input  cluster.47.fasta --output plasflow.cluster.47.tsv --threshold 0.99
PlasFlow.py --input  cluster.48.fasta --output plasflow.cluster.48.tsv --threshold 0.99
PlasFlow.py --input  cluster.49.fasta --output plasflow.cluster.49.tsv --threshold 0.99
PlasFlow.py --input  cluster.50.fasta --output plasflow.cluster.50.tsv --threshold 0.99
PlasFlow.py --input  cluster.51.fasta --output plasflow.cluster.51.tsv --threshold 0.99
PlasFlow.py --input  cluster.52.fasta --output plasflow.cluster.52.tsv --threshold 0.99
PlasFlow.py --input  cluster.53.fasta --output plasflow.cluster.53.tsv --threshold 0.99
PlasFlow.py --input  cluster.54.fasta --output plasflow.cluster.54.tsv --threshold 0.99
PlasFlow.py --input  cluster.55.fasta --output plasflow.cluster.55.tsv --threshold 0.99
PlasFlow.py --input  cluster.56.fasta --output plasflow.cluster.56.tsv --threshold 0.99
PlasFlow.py --input  cluster.57.fasta --output plasflow.cluster.57.tsv --threshold 0.99
PlasFlow.py --input  cluster.58.fasta --output plasflow.cluster.58.tsv --threshold 0.99
PlasFlow.py --input  cluster.59.fasta --output plasflow.cluster.59.tsv --threshold 0.99
PlasFlow.py --input  cluster.60.fasta --output plasflow.cluster.60.tsv --threshold 0.99
PlasFlow.py --input  cluster.61.fasta --output plasflow.cluster.61.tsv --threshold 0.99
PlasFlow.py --input  cluster.62.fasta --output plasflow.cluster.62.tsv --threshold 0.99
PlasFlow.py --input  cluster.63.fasta --output plasflow.cluster.63.tsv --threshold 0.99
PlasFlow.py --input  cluster.64.fasta --output plasflow.cluster.64.tsv --threshold 0.99
PlasFlow.py --input  cluster.65.fasta --output plasflow.cluster.65.tsv --threshold 0.99
PlasFlow.py --input  cluster.66.fasta --output plasflow.cluster.66.tsv --threshold 0.99
PlasFlow.py --input  cluster.67.fasta --output plasflow.cluster.67.tsv --threshold 0.99
PlasFlow.py --input  cluster.68.fasta --output plasflow.cluster.68.tsv --threshold 0.99
PlasFlow.py --input  cluster.69.fasta --output plasflow.cluster.69.tsv --threshold 0.99
PlasFlow.py --input  cluster.70.fasta --output plasflow.cluster.70.tsv --threshold 0.99
PlasFlow.py --input  cluster.71.fasta --output plasflow.cluster.71.tsv --threshold 0.99
PlasFlow.py --input  cluster.72.fasta --output plasflow.cluster.72.tsv --threshold 0.99
PlasFlow.py --input  cluster.73.fasta --output plasflow.cluster.73.tsv --threshold 0.99
PlasFlow.py --input  cluster.74.fasta --output plasflow.cluster.74.tsv --threshold 0.99
PlasFlow.py --input  cluster.75.fasta --output plasflow.cluster.75.tsv --threshold 0.99
PlasFlow.py --input  cluster.76.fasta --output plasflow.cluster.76.tsv --threshold 0.99
PlasFlow.py --input  cluster.77.fasta --output plasflow.cluster.77.tsv --threshold 0.99
PlasFlow.py --input  cluster.78.fasta --output plasflow.cluster.78.tsv --threshold 0.99
PlasFlow.py --input  cluster.79.fasta --output plasflow.cluster.79.tsv --threshold 0.99
PlasFlow.py --input  cluster.80.fasta --output plasflow.cluster.80.tsv --threshold 0.99
PlasFlow.py --input  cluster.81.fasta --output plasflow.cluster.81.tsv --threshold 0.99
PlasFlow.py --input  cluster.82.fasta --output plasflow.cluster.82.tsv --threshold 0.99
PlasFlow.py --input  cluster.83.fasta --output plasflow.cluster.83.tsv --threshold 0.99
PlasFlow.py --input  cluster.84.fasta --output plasflow.cluster.84.tsv --threshold 0.99
PlasFlow.py --input  cluster.85.fasta --output plasflow.cluster.85.tsv --threshold 0.99
PlasFlow.py --input  cluster.86.fasta --output plasflow.cluster.86.tsv --threshold 0.99
PlasFlow.py --input  cluster.87.fasta --output plasflow.cluster.87.tsv --threshold 0.99
PlasFlow.py --input  cluster.88.fasta --output plasflow.cluster.88.tsv --threshold 0.99
PlasFlow.py --input  cluster.89.fasta --output plasflow.cluster.89.tsv --threshold 0.99
PlasFlow.py --input  cluster.90.fasta --output plasflow.cluster.90.tsv --threshold 0.99
PlasFlow.py --input  cluster.91.fasta --output plasflow.cluster.91.tsv --threshold 0.99
PlasFlow.py --input  cluster.92.fasta --output plasflow.cluster.92.tsv --threshold 0.99
PlasFlow.py --input  cluster.93.fasta --output plasflow.cluster.93.tsv --threshold 0.99
PlasFlow.py --input  cluster.94.fasta --output plasflow.cluster.94.tsv --threshold 0.99
PlasFlow.py --input  cluster.95.fasta --output plasflow.cluster.95.tsv --threshold 0.99
PlasFlow.py --input  cluster.96.fasta --output plasflow.cluster.96.tsv --threshold 0.99
PlasFlow.py --input  cluster.97.fasta --output plasflow.cluster.97.tsv --threshold 0.99
PlasFlow.py --input  cluster.98.fasta --output plasflow.cluster.98.tsv --threshold 0.99
PlasFlow.py --input  cluster.99.fasta --output plasflow.cluster.99.tsv --threshold 0.99
PlasFlow.py --input  cluster.100.fasta --output plasflow.cluster.100.tsv --threshold 0.99
PlasFlow.py --input  cluster.101.fasta --output plasflow.cluster.101.tsv --threshold 0.99
PlasFlow.py --input  cluster.102.fasta --output plasflow.cluster.102.tsv --threshold 0.99
PlasFlow.py --input  cluster.103.fasta --output plasflow.cluster.103.tsv --threshold 0.99
PlasFlow.py --input  cluster.104.fasta --output plasflow.cluster.104.tsv --threshold 0.99
PlasFlow.py --input  cluster.105.fasta --output plasflow.cluster.105.tsv --threshold 0.99
PlasFlow.py --input  cluster.106.fasta --output plasflow.cluster.106.tsv --threshold 0.99
PlasFlow.py --input  cluster.107.fasta --output plasflow.cluster.107.tsv --threshold 0.99
PlasFlow.py --input  cluster.108.fasta --output plasflow.cluster.108.tsv --threshold 0.99
PlasFlow.py --input  cluster.109.fasta --output plasflow.cluster.109.tsv --threshold 0.99
PlasFlow.py --input  cluster.110.fasta --output plasflow.cluster.110.tsv --threshold 0.99
PlasFlow.py --input  cluster.111.fasta --output plasflow.cluster.111.tsv --threshold 0.99
PlasFlow.py --input  cluster.112.fasta --output plasflow.cluster.112.tsv --threshold 0.99
PlasFlow.py --input  cluster.113.fasta --output plasflow.cluster.113.tsv --threshold 0.99
PlasFlow.py --input  cluster.114.fasta --output plasflow.cluster.114.tsv --threshold 0.99
PlasFlow.py --input  cluster.115.fasta --output plasflow.cluster.115.tsv --threshold 0.99
PlasFlow.py --input  cluster.116.fasta --output plasflow.cluster.116.tsv --threshold 0.99
PlasFlow.py --input  cluster.117.fasta --output plasflow.cluster.117.tsv --threshold 0.99
PlasFlow.py --input  cluster.118.fasta --output plasflow.cluster.118.tsv --threshold 0.99
PlasFlow.py --input  cluster.119.fasta --output plasflow.cluster.119.tsv --threshold 0.99
PlasFlow.py --input  cluster.120.fasta --output plasflow.cluster.120.tsv --threshold 0.99
PlasFlow.py --input  cluster.121.fasta --output plasflow.cluster.121.tsv --threshold 0.99
PlasFlow.py --input  cluster.122.fasta --output plasflow.cluster.122.tsv --threshold 0.99
PlasFlow.py --input  cluster.123.fasta --output plasflow.cluster.123.tsv --threshold 0.99
PlasFlow.py --input  cluster.124.fasta --output plasflow.cluster.124.tsv --threshold 0.99
PlasFlow.py --input  cluster.125.fasta --output plasflow.cluster.125.tsv --threshold 0.99
PlasFlow.py --input  cluster.126.fasta --output plasflow.cluster.126.tsv --threshold 0.99
PlasFlow.py --input  cluster.127.fasta --output plasflow.cluster.127.tsv --threshold 0.99
PlasFlow.py --input  cluster.128.fasta --output plasflow.cluster.128.tsv --threshold 0.99
PlasFlow.py --input  cluster.129.fasta --output plasflow.cluster.129.tsv --threshold 0.99
PlasFlow.py --input  cluster.130.fasta --output plasflow.cluster.130.tsv --threshold 0.99
PlasFlow.py --input  cluster.131.fasta --output plasflow.cluster.131.tsv --threshold 0.99
PlasFlow.py --input  cluster.132.fasta --output plasflow.cluster.132.tsv --threshold 0.99
PlasFlow.py --input  cluster.133.fasta --output plasflow.cluster.133.tsv --threshold 0.99
PlasFlow.py --input  cluster.134.fasta --output plasflow.cluster.134.tsv --threshold 0.99
PlasFlow.py --input  cluster.135.fasta --output plasflow.cluster.135.tsv --threshold 0.99
PlasFlow.py --input  cluster.136.fasta --output plasflow.cluster.136.tsv --threshold 0.99
PlasFlow.py --input  cluster.137.fasta --output plasflow.cluster.137.tsv --threshold 0.99
PlasFlow.py --input  cluster.138.fasta --output plasflow.cluster.138.tsv --threshold 0.99
PlasFlow.py --input  cluster.139.fasta --output plasflow.cluster.139.tsv --threshold 0.99
PlasFlow.py --input  cluster.140.fasta --output plasflow.cluster.140.tsv --threshold 0.99
PlasFlow.py --input  cluster.141.fasta --output plasflow.cluster.141.tsv --threshold 0.99
PlasFlow.py --input  cluster.142.fasta --output plasflow.cluster.142.tsv --threshold 0.99
PlasFlow.py --input  cluster.143.fasta --output plasflow.cluster.143.tsv --threshold 0.99
PlasFlow.py --input  cluster.144.fasta --output plasflow.cluster.144.tsv --threshold 0.99
PlasFlow.py --input  cluster.145.fasta --output plasflow.cluster.145.tsv --threshold 0.99
PlasFlow.py --input  cluster.146.fasta --output plasflow.cluster.146.tsv --threshold 0.99
PlasFlow.py --input  cluster.147.fasta --output plasflow.cluster.147.tsv --threshold 0.99
PlasFlow.py --input  cluster.148.fasta --output plasflow.cluster.148.tsv --threshold 0.99
PlasFlow.py --input  cluster.149.fasta --output plasflow.cluster.149.tsv --threshold 0.99
PlasFlow.py --input  cluster.150.fasta --output plasflow.cluster.150.tsv --threshold 0.99
PlasFlow.py --input  cluster.151.fasta --output plasflow.cluster.151.tsv --threshold 0.99
PlasFlow.py --input  cluster.152.fasta --output plasflow.cluster.152.tsv --threshold 0.99
PlasFlow.py --input  cluster.153.fasta --output plasflow.cluster.153.tsv --threshold 0.99
PlasFlow.py --input  cluster.154.fasta --output plasflow.cluster.154.tsv --threshold 0.99
PlasFlow.py --input  cluster.155.fasta --output plasflow.cluster.155.tsv --threshold 0.99
PlasFlow.py --input  cluster.156.fasta --output plasflow.cluster.156.tsv --threshold 0.99
PlasFlow.py --input  cluster.157.fasta --output plasflow.cluster.157.tsv --threshold 0.99
PlasFlow.py --input  cluster.158.fasta --output plasflow.cluster.158.tsv --threshold 0.99
PlasFlow.py --input  cluster.159.fasta --output plasflow.cluster.159.tsv --threshold 0.99
PlasFlow.py --input  cluster.160.fasta --output plasflow.cluster.160.tsv --threshold 0.99
PlasFlow.py --input  cluster.161.fasta --output plasflow.cluster.161.tsv --threshold 0.99
PlasFlow.py --input  cluster.162.fasta --output plasflow.cluster.162.tsv --threshold 0.99
PlasFlow.py --input  cluster.163.fasta --output plasflow.cluster.163.tsv --threshold 0.99
PlasFlow.py --input  cluster.164.fasta --output plasflow.cluster.164.tsv --threshold 0.99
PlasFlow.py --input  cluster.165.fasta --output plasflow.cluster.165.tsv --threshold 0.99
PlasFlow.py --input  cluster.166.fasta --output plasflow.cluster.166.tsv --threshold 0.99
PlasFlow.py --input  cluster.167.fasta --output plasflow.cluster.167.tsv --threshold 0.99
PlasFlow.py --input  cluster.168.fasta --output plasflow.cluster.168.tsv --threshold 0.99
PlasFlow.py --input  cluster.169.fasta --output plasflow.cluster.169.tsv --threshold 0.99
PlasFlow.py --input  cluster.170.fasta --output plasflow.cluster.170.tsv --threshold 0.99
PlasFlow.py --input  cluster.171.fasta --output plasflow.cluster.171.tsv --threshold 0.99
PlasFlow.py --input  cluster.172.fasta --output plasflow.cluster.172.tsv --threshold 0.99
PlasFlow.py --input  cluster.173.fasta --output plasflow.cluster.173.tsv --threshold 0.99
PlasFlow.py --input  cluster.174.fasta --output plasflow.cluster.174.tsv --threshold 0.99
PlasFlow.py --input  cluster.175.fasta --output plasflow.cluster.175.tsv --threshold 0.99
PlasFlow.py --input  cluster.176.fasta --output plasflow.cluster.176.tsv --threshold 0.99
PlasFlow.py --input  cluster.177.fasta --output plasflow.cluster.177.tsv --threshold 0.99
PlasFlow.py --input  cluster.178.fasta --output plasflow.cluster.178.tsv --threshold 0.99
PlasFlow.py --input  cluster.179.fasta --output plasflow.cluster.179.tsv --threshold 0.99
PlasFlow.py --input  cluster.180.fasta --output plasflow.cluster.180.tsv --threshold 0.99
PlasFlow.py --input  cluster.181.fasta --output plasflow.cluster.181.tsv --threshold 0.99
PlasFlow.py --input  cluster.182.fasta --output plasflow.cluster.182.tsv --threshold 0.99
PlasFlow.py --input  cluster.183.fasta --output plasflow.cluster.183.tsv --threshold 0.99
PlasFlow.py --input  cluster.184.fasta --output plasflow.cluster.184.tsv --threshold 0.99
PlasFlow.py --input  cluster.185.fasta --output plasflow.cluster.185.tsv --threshold 0.99
PlasFlow.py --input  cluster.186.fasta --output plasflow.cluster.186.tsv --threshold 0.99
PlasFlow.py --input  cluster.187.fasta --output plasflow.cluster.187.tsv --threshold 0.99
PlasFlow.py --input  cluster.188.fasta --output plasflow.cluster.188.tsv --threshold 0.99
PlasFlow.py --input  cluster.189.fasta --output plasflow.cluster.189.tsv --threshold 0.99
PlasFlow.py --input  cluster.190.fasta --output plasflow.cluster.190.tsv --threshold 0.99
PlasFlow.py --input  cluster.191.fasta --output plasflow.cluster.191.tsv --threshold 0.99
PlasFlow.py --input  cluster.192.fasta --output plasflow.cluster.192.tsv --threshold 0.99
