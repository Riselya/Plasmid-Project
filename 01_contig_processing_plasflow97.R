############################## assign contigs to plasmids based on Plasflow output ##########
############################## assign contigs to plasmids based on Plasflow output ##########
############################## assign contigs to plasmids based on Plasflow output ##########
############################## assign contigs to plasmids based on Plasflow output ##########
############################## assign contigs to plasmids based on Plasflow output ##########

setwd("C:\\Users\\risel\\Dropbox\\Sommer postdoc\\Plasmid project\\Plasflow\\Plasflow0.97\\PlasmidsFastaFiles") #plasflow output



library(data.table)
library(stringr)
library(expss)
library(tidyr)
#####

### plasmid fasta files for clusters with over 50% completeness (n = 192)

myfiles<-list.files("C:\\Users\\risel\\Dropbox\\Sommer postdoc\\Plasmid project\\Plasflow\\Plasflow0.97\\PlasmidsFastaFiles")

head(myfiles)


#dataFiles <- lapply(myfiles, read.table, sep="\t")

dataFiles <- lapply(myfiles, function(x) {
  tryCatch(read.table(x, header = FALSE, sep = '\t'), error=function(e) NULL)
})

head(dataFiles, 2)

myfiles<-str_remove(myfiles, ".tsv_plasmids.fasta")
myfiles<-str_remove(myfiles, "plasflow.")


length(dataFiles) #1146 files WWEC / #1307 for WW

#filenames<- paste("File", 1:length(dataFiles), sep = "") #change names

names(dataFiles)<-myfiles

### loop to extract contigs per cluster data 

cluster_list<-list()

### use trycatch the make it skip any errors (which come up for clusters with no plasmids)

for (i in 1:length(dataFiles)){
  
  tryCatch({
    
    cluster_x<-dataFiles[[i]]
    #cluster_x<-dataFiles[[2]]
    
    selectedRows <- cluster_x[grep(">k141_", cluster_x$V1), ]
    contigs<-substring(selectedRows, 2)
    
    df<-data.frame(contigs)
    df$cluster<-myfiles[i]
    # df$cluster<-myfiles[2]
    
    cluster_list[[i]]<-df
  }, error=function(e){})
}

#names(cluster_list)<-myfiles

cluster_data<-do.call(rbind, cluster_list)

head(cluster_data)


############################ edit names etc


cluster_data<-data.frame(str_split_fixed(cluster_data$contigs, " ", 3))
names(cluster_data)<-c("contig_id", "Origin", "class")

cluster_data$class<-"Plasmid"

head(cluster_data)

subset(cluster_data, contig_id == "k141_2050088")

setwd("C:/Users/risel/Dropbox/Sommer postdoc/Plasmid project/PlasmidProjectAnalysis/Final Anslysis Plasflow0.97")

Mobile_element_metadata_WW <- read.csv("DATA/Mobile_element_metadata_WW.csv")

head(Mobile_element_metadata_WW)

thalder_plasmid_metadata<-subset(Mobile_element_metadata_WW, class == "Plasmid")

cluster_data$Plasmid_ID<-vlookup(cluster_data$contig_id, thalder_plasmid_metadata, lookup_column = "contig_id", result_column = "group")
cluster_data$Plasmid_ID<-factor(cluster_data$Plasmid_ID)

table(cluster_data$Plasmid_ID)

plasmid_metadata<-cluster_data #make name more meaningful

head(plasmid_metadata)


plasmid_metadata$Identification<-"Plasflow"


thalder_plasmid_metadata<-thalder_plasmid_metadata[,c(1,7,9)]

head(thalder_plasmid_metadata)

thalder_plasmid_metadata$Identification<-"MEGARes/PlasmidFinder"
thalder_plasmid_metadata$Origin<-NA


thalder_plasmid_metadata<-thalder_plasmid_metadata[,c(1,5,2,3,4)]
#
names(thalder_plasmid_metadata)[4]<-"Plasmid_ID"


plasmid_metadata1<-rbind(plasmid_metadata, thalder_plasmid_metadata)

freq<-data.frame(table(plasmid_metadata1$contig_id))

head(freq)

freq<-freq[order(-freq$Freq),]

##two contigs identified by both methods

#   k141_65601    2
#  k141_808085    2

subset(plasmid_metadata1, contig_id == "k141_65601")
subset(plasmid_metadata1, contig_id == "k141_808085")

## remove 

################################################################## assign contigs to their genome clusters ############
################################################################## assign cootigs to their genome clusters ############
################################################################## assign contigs to their genome clusters ############



library(data.table)
library(stringr)

############



#laptop WWEC
setwd("C:/Users/risel/Dropbox/Sommer postdoc/Plasmid project/PlasmidProjectAnalysis/Plasflow90/Clusters")
myfiles<-list.files("C:/Users/risel/Dropbox/Sommer postdoc/Plasmid project/PlasmidProjectAnalysis/Plasflow90/Clusters")

###############


dataFiles <- lapply(myfiles, read.table)

myfiles<-str_remove(myfiles, ".fasta")


length(dataFiles) #1146 files WWEC / #1307 for WW

#filenames<- paste("File", 1:length(dataFiles), sep = "") #change names

names(dataFiles)<-myfiles

### loop to extract contigs per cluster data 

cluster_list<-list()

for (i in 1:length(myfiles)){
  
  cluster_x<-dataFiles[[i]]
  #cluster_x<-dataFiles[[1]]
  
  selectedRows <- cluster_x[grep(">k141_", cluster_x$V1), ]
  contigs<-substring(selectedRows, 2)
  
  df<-data.frame(contigs)
  df$cluster<-myfiles[i]
  
  cluster_list[[i]]<-df
}

names(cluster_list)<-myfiles

cluster_data<-do.call(rbind, cluster_list)

head(cluster_data)


cluster_assignment<-cluster_data





##################################################### generate count table ##################
##################################################### generate count table ##################
##################################################### generate count table ##################
##################################################### generate count table ##################
##################################################### generate count table ##################

setwd("C:\\Users\\risel\\Dropbox\\Sommer postdoc\\Plasmid project\\PlasmidProjectAnalysis\\Final anslysis Plasflow0.97")


WW_links <- read.delim("DATA/WW_links.txt", header=FALSE)


Cluster_metadata_WW <- read.csv("DATA/Cluster_metadata_WW.csv")

## only first 192 clusters

head(Cluster_metadata_WW)

Cluster_metadata_WW<-subset(Cluster_metadata_WW, completeness > 50)
tail(Cluster_metadata_WW)

Cluster_metadata_WW<- Cluster_metadata_WW[,c(1:18)]

#########################

head(WW_links)
names(WW_links)<-c("contig_from", "contig_to", "Count")

head(cluster_assignment)

length(unique(cluster_assignment$contigs)) # 101993
length(unique(cluster_assignment$cluster)) #192


head(plasmid_metadata)
head(Cluster_metadata_WW)


## list contigs for mobile elements

## for now use both methods for plasmid identification 

ME<-unique(plasmid_metadata1$contig_id)
length(ME)



######## sort out links file

WW_links$SelfLink<-ifelse(WW_links$contig_from == WW_links$contig_to, TRUE, FALSE)

table(WW_links$SelfLink)

## remove any links between same contigs

WW_links<-subset(WW_links, SelfLink == FALSE)

# add columns showing which clusters each contig is assigned to

WW_links$Cluster_from<-vlookup(WW_links$contig_from, cluster_assignment, lookup_column = "contigs", result_column = "cluster")
WW_links$Cluster_to<-vlookup(WW_links$contig_to, cluster_assignment, lookup_column = "contigs", result_column = "cluster")



#table(is.na(WW_links$Cluster_from))
##table(is.na(WW_links$Cluster_to))

## lots of NAs. I guess that means that contig wasn't able to be assigned to a particular cluster?
#remove any links that are to an NA 
memory.limit(size = 30000)

WW_links<-na.omit(WW_links)

### add columns assigning contig to either mobile element or normal genome

WW_links$ME_from<-ifelse(WW_links$contig_from %in% ME, "MOBILE_ELEMENT", "NORMAL_GENOME")
WW_links$ME_to<-ifelse(WW_links$contig_to %in% ME, "MOBILE_ELEMENT", "NORMAL_GENOME")

#table(WW_links$ME_from)
#table(WW_links$ME_to)

head(WW_links)

## subset if the link between two mobile elements?

plasmid_links<-subset(WW_links, ME_from == "MOBILE_ELEMENT" & ME_to == "MOBILE_ELEMENT")

head(plasmid_links)

write.csv(plasmid_links, "HiC_plasmid_links.csv")


### keep only rows between mobile element and genomic element

WW_links$Same<-ifelse(WW_links$ME_from == WW_links$ME_to,TRUE, FALSE)


WW_links_ME<-subset(WW_links, Same == FALSE)
head(WW_links_ME)




#table(WW_links_ME$ME_from)
#table(WW_links_ME$ME_to)

##manually check a few rows for duplication

subset(WW_links_ME, contig_from == "k141_3592337")
subset(WW_links_ME, contig_to == "k141_3592337")


##links are duplicated, so a row for conting 1 x contig 2, and for contig 2 x contig 1.

##since all rows sould be [mobile element x normal genome,] just subsetting for mobile element in first column should remove all duplications.
# if all mobile elements are in one column then can easily convert to site x species matrix.

WW_links_final<- subset(WW_links_ME, ME_from =="MOBILE_ELEMENT")

subset(WW_links_final, contig_from == "k141_3525698")
subset(WW_links_final, contig_to == "k141_3525698")


head(WW_links_final)
tail(WW_links_final)

WW_links_final$contig_from<-factor(WW_links_final$contig_from)
WW_links_final$contig_to<-factor(WW_links_final$contig_to)

length(unique(WW_links_final$contig_from)) #6915


#save file 

write.csv(WW_links_final, "HiC_links_final.csv")


ME_freq<-data.frame(table(WW_links_final$contig_from))
#ME_freq<-data.frame(table(WW_links_min50$contig_from))
head(ME_freq)
hist(log10(ME_freq$Freq), breaks = 100)



#############################################################################
#############################################################################
#############################################################################
#############################################################################


WW_links_final<-WW_links_final[,c(1:3)]

length(unique(WW_links_final$contig_from))
length(unique(WW_links_final$contig_to))



## turn into count table with mobile elements as columns and genome clusters as rows 
#(this way round calculations are much quicker - better to have as few cols as possible)

memory.limit(size = 30000)


count_table<- pivot_wider( WW_links_final, names_from = contig_from, values_from = Count)

dim(count_table)
str(count_table)
head(count_table)

##turn NAs to zeros


count_table_dt<-as.data.table(count_table)

count_table_dt[is.na(count_table_dt)] <- 0


count_table_df<-data.frame(count_table_dt)
head(count_table_df)
str(count_table_df)


#make first col row names
row.names(count_table_df)<-count_table_df$contig_to

# remove first column

count_table_df<-count_table_df[,-1]
head(count_table_df)

dim(count_table_df)

## transpose so mobile elements are as rows

#count_table_df<-data.frame(t(count_table_df)) #not enough memory grrrr

#########################################################

library(phyloseq)


#OTU = otu_table(count_table_df, taxa_are_rows = TRUE)
OTU = otu_table(count_table_df, taxa_are_rows = FALSE)

##list contigs remaining after all the above filtering

#contigs<-names(count_table_df)
contigs<-row.names(count_table_df)

cluster_assignment$Include_contig<- cluster_assignment$contigs %in% contigs

metadata<-subset(cluster_assignment, Include_contig == TRUE)

head(metadata)
dim(metadata)
dim(OTU)

## ok now count table and metadata matching 

names(metadata)[1]<-"feature.id"
row.names(metadata)<-metadata$feature.id

metadata<-sample_data(metadata)

physeq = phyloseq(OTU, metadata)

## merge by cluster, so that contigs all belonging to the same cell/genome cluster are merged (links will be summed)

physeq_merged<-merge_samples(physeq, "cluster")


physeq_merged # taxa = mobile elements, 'samples' = bacterial hosts

head(sample_data(physeq_merged)) #this messed up the sample data a bit

sample_data(physeq_merged)$feature.id<-row.names(sample_data(physeq_merged))

sample_data(physeq_merged)<-sample_data(physeq_merged)[,1]  ## only metadata we have left is the cluster number.

length(unique(sample_data(physeq_merged)$feature.id))

## add more metadata, now we have the count table in the right format (ie at cluster level, not contig level)

head(Cluster_metadata_WW)
head(sample_data(physeq_merged))

tail(Cluster_metadata_WW)
tail(sample_data(physeq_merged))

nrow(Cluster_metadata_WW)
nrow(sample_data(physeq_merged))

#Cluster_metadata_WW$Include<-Cluster_metadata_WW$cluster_id %in% sample_data(physeq_merged)$feature.id

#table(Cluster_metadata_WW$Include)

#Cluster_metadata<-subset(Cluster_metadata_WW, Include == T)

Cluster_metadata<-Cluster_metadata_WW

names(Cluster_metadata)[1]<-"feature.id"

Cluster_metadata$feature.id<-as.character(Cluster_metadata$feature.id)

row.names(Cluster_metadata)<-Cluster_metadata$feature.id # phyloseq matches info between elements by row names, so the row name needs to indicate the cluster ID

Cluster_metadata<-sample_data(Cluster_metadata)

sample_data(physeq_merged)<-Cluster_metadata

##################################### add mobile element metadata

head(plasmid_metadata)
nrow(plasmid_metadata)

dim(otu_table(physeq_merged))

otutable<- data.frame(physeq_merged@otu_table@.Data)
plasmid_metadata$Include<-plasmid_metadata$contig_id %in% names(otutable)

table(plasmid_metadata$Include)

tax<-subset(plasmid_metadata, Include == T)

table(tax$contig_id)

tax$contig_id<-factor(tax$contig_id)

tax$assigned_cluster<-vlookup(tax$contig_id, cluster_assignment, lookup_column = "contigs", result_column = "cluster")

row.names(tax)<-tax$contig_id

tax<-tax[,-5]

TAX = tax_table(tax)

taxa_names(TAX)<-tax$contig_id

tax_table(physeq_merged)<-TAX

physeq_merged

physeq_plasflow_50pc<-physeq_merged

#####################

#saveRDS(physeq_plasflow_50pc, "physeq_plasflow_50pc.RDS")
#physeq_plasflow_50pc<-readRDS("physeq_plasflow_50pc.RDS")

#plasflow_count_table<-data.frame(otu_table(physeq_plasflow_50pc))
#plasflow_host_metadata<-data.frame(sample_data(physeq_plasflow_50pc))
#plasflow_metadata<-data.frame(tax_table(physeq_plasflow_50pc))
#names(plasflow_metadata)<-c("contig_id" ,"PredictedOrigin", "Class" , "Plasmid_ID" ,"Assigned_cluster")

#write.csv(plasflow_count_table, "OUTPUT/plasflow_count_table_50pc.csv")
#write.csv(plasflow_host_metadata, "OUTPUT/plasflow_host_metadata_50pc.csv")
#write.csv(plasflow_metadata, "OUTPUT/plasflow_plasmid_metadata_50pc.csv")

#plot_richness(physeq_plasflow_50pc, measures=c("Observed"))
#sample_data(physeq_plasflow_50pc)$Observed<-phyloseq::estimate_richness(physeq_plasflow_50pc, measures="Observed")
#sample_data(physeq_plasflow_50pc)$Observed<-sample_data(physeq_plasflow_50pc)$Observed$Observed

#hist(sample_data(physeq_plasflow_50pc)$Observed, breaks = 50, main = "Histogram: Number of plasmids associated with each bacterial species")


########### plasmid-plasmid links #################
########### plasmid-plasmid links #################
########### plasmid-plasmid links #################
########### plasmid-plasmid links #################
########### plasmid-plasmid links #################
########### plasmid-plasmid links #################
########### plasmid-plasmid links #################
########### plasmid-plasmid links #################
########### plasmid-plasmid links #################
########### plasmid-plasmid links #################
########### plasmid-plasmid links #################
########### plasmid-plasmid links #################
########### plasmid-plasmid links #################

head(plasmid_links)
row.names(plasmid_links)<-1:nrow(plasmid_links)
subset(plasmid_links, contig_from == "k141_3525698")
subset(plasmid_links, contig_to == "k141_3525698")


cols = c(1,2)
newdf = plasmid_links[,cols]
for (i in 1:nrow(plasmid_links)){
  newdf[i, ] = sort(plasmid_links[i,cols])
}

head(newdf)

plasmid_links1<-plasmid_links[!duplicated(newdf),]
head(plasmid_links1)

subset(plasmid_links1, contig_from == "k141_3525698")
subset(plasmid_links1, contig_to == "k141_3525698")


plasmid_links1<-plasmid_links1[order(-plasmid_links1$Count),]

head(plasmid_links1, 30)
tail(plasmid_links1, 30)

hist(plasmid_links1$Count, 100)

ggplot(plasmid_links1, aes(x = Count))+geom_histogram(col = "grey", binwidth = 1)

#write.csv(plasmid_links1, "plasmid_links.csv")


### make plasmid-plasmid network
### make plasmid-plasmid network
### make plasmid-plasmid network
### make plasmid-plasmid network
### make plasmid-plasmid network
### make plasmid-plasmid network
### make plasmid-plasmid network
### make plasmid-plasmid network
### make plasmid-plasmid network

setwd("C:\\Users\\risel\\Dropbox\\Sommer postdoc\\Plasmid project\\PlasmidProjectAnalysis\\Final Anslysis Plasflow0.99")


#physeq_plasflow_50pc<-readRDS("physeq_plasflow_50pc.RDS")
#plasmid_links1 <- read.csv("C:/Users/Alice_R/Dropbox/Sommer postdoc/Plasmid project/PlasmidProjectAnalysis/Final analysis/plasmid_links.csv", row.names=1)



library(tidyverse)
library(igraph)
library(intergraph)
library(qgraph)

plasmid_links1<-plasmid_links1[,c(-4)]

str(plasmid_links1)

plasmid_links1$Cluster_to<-as.character(plasmid_links1$Cluster_to)
plasmid_links1$Cluster_from<-as.character(plasmid_links1$Cluster_from)

plasmid_links1$SameCluster<-ifelse(plasmid_links1$Cluster_from == plasmid_links1$Cluster_to, TRUE, FALSE)

table(plasmid_links1$SameCluster)

plasmid_links2<-subset(plasmid_links1, SameCluster==TRUE)
plasmid_links2<-subset(plasmid_links2, Count > 1) ### only include associations that occurred more than x
#plasmid_links2<-subset(plasmid_links1, Count > 0)

### nodes

sources <- plasmid_links2 %>%
  distinct(contig_from) %>%
  rename(label = contig_from)

destinations <- plasmid_links2%>%
  distinct(contig_to) %>%
  rename(label = contig_to)

nodes <- full_join(sources, destinations, by = "label")
head(nodes)

nodes <- nodes %>% rowid_to_column("id")
head(nodes)


##edges

per_route <- plasmid_links2[,c(1:3)]
head(per_route)
names(per_route)[3]<-"weight" 

edges <- per_route %>% 
  left_join(nodes, by = c("contig_from" = "label")) %>% 
  rename(from = id)

edges <- edges %>% 
  left_join(nodes, by = c("contig_to" = "label")) %>% 
  rename(to = id)
head(edges)

edges <- select(edges, from, to, weight)
head(edges)


library(network)

str(nodes)

nodes$label<-as.character(nodes$label)

routes_network <- network(edges, vertex.attr = nodes, matrix.type = "edgelist", ignore.eval = FALSE)
class(routes_network)
routes_network

plot(routes_network, vertex.cex = 0.5, main = "Plasmid-Plasmid network")

############ as igraph

igraph_net<-asIgraph(routes_network)

E(igraph_net)$weight

igraph_net<-as.undirected(igraph_net)

net.deg<-degree(igraph_net)

#######plot

plot.net.cls <- function(net, scores, outfile, title) {
  
  
  # Convert node label from names to numerical IDs.
  # node.names <- V(net)$id
  #col_ids <- seq(1, length(node.names))
  #V(net)$name <- col_ids
  
  
  
  # Define output image file.
  outfile <- paste(outfile, "jpg", sep=".")
  # Image properties.
  jpeg(outfile, width = 5000, height = 5000, res = 300, quality = 100)
  par(oma = c(1, 1, 1, 1))
  
  # Customized layout to avoid nodes overlapping.
  e <- get.edgelist(net)
  class(e) <- "numeric"
  l <- qgraph.layout.fruchtermanreingold(e, vcount=vcount(net),
    area=8*(vcount(net)^2),
    repulse.rad=(vcount(net)^3.1))
  
  # Main plot function.
  plot(net, vertex.size = (scores)+1, vertex.label=NA,
    vertex.label.dist = 0.6,
    vertex.label.cex = 2,
    vertex.label.font = 2,
    vertex.color="blue",
    vertex.label.color = "black",
    vertex.frame.color = "black",
    # vertex.shape = my_shapes,
    #mark.border= 2,
    mark.expand = 10,
    mark.shape = 1,
    layout=l,
    edge.width=E(net)$weight/2)
  
  title(title, cex.main=4)
  
  
  dev.off()
}

# Execute this command after running Function 3
#it will save in your working directory




plot.net.cls(igraph_net, net.deg,
  outfile = "plsmid network2", title = "")

########################### clusetrs ##########
########################### clusetrs ##########
########################### clusetrs ##########
########################### clusetrs ##########


# Get clusters
wt <- walktrap.community(igraph_net)
ml <- multilevel.community(igraph_net)
# Get membership of walktrap clusters
unique(membership(wt))
unique(membership(ml))
cluster.membership<-membership(wt)
#cluster.membership<-membership(ml)
str(cluster.membership)
table(cluster.membership)

nodes$ClusterMembership<-membership(wt)



plot.net.cls <- function(net, scores, cls, outfile, title) {
  # Get size of clusters to find isolated nodes.
  cls_sizes <- sapply(groups(cls), length)
  # Randomly choosing node colors. Users can provide their own vector of colors.
  colors <-c("forestgreen", "darkorange","bisque","purple","turquoise", "grey", "deeppink", "plum1","skyblue","dodgerblue","navyblue", 
    "forestgreen", "darkorange","bisque","purple","turquoise", "grey", "deeppink", "plum1","skyblue","dodgerblue","navyblue", 
    "forestgreen", "darkorange","bisque","purple","turquoise", "grey", "deeppink", "plum1","skyblue","dodgerblue","navyblue", 
    "forestgreen", "darkorange","bisque","purple","turquoise", "grey", "deeppink", "plum1","skyblue","dodgerblue","navyblue", 
    "green","cyan","darkred","brown","darkolivegreen","red","white")
  # Nodes in clusters will be color coded. Isolated nodes will be white.
  V(net)$color <- sapply(membership(cls),
    function(x) {ifelse(cls_sizes[x]>1,
      colors[x], "white")})
  
  
  # Define output image file.
  outfile <- paste(outfile, "jpg", sep=".")
  # Image properties.
  jpeg(outfile, width = 5000, height = 5000, res = 300, quality = 100)
  par(oma = c(1, 1, 1, 1))
  
  # Customized layout to avoid nodes overlapping.
  e <- get.edgelist(net)
  class(e) <- "numeric"
  l <- qgraph.layout.fruchtermanreingold(e, vcount=vcount(net),
    area=8*(vcount(net)^2),
    repulse.rad=(vcount(net)^3.1))
  
  # Main plot function.
  plot(net, vertex.size = (scores)+2, vertex.label=NA,
    vertex.label.dist = 0.6,
    vertex.label.cex = 2,
    vertex.label.font = 2,
    #vertex.color=my_color,
    vertex.label.color = "black",
    vertex.frame.color = "black",
    # mark.border= my_color,
    mark.expand = 10,
    mark.shape = 1,
    layout=l,
    edge.width=E(net)$weight/2,
    edge.color=E(net)$color)
  title(title, cex.main=4)
  
  
  dev.off()
}
# Execute this command after running Function 3
plot.net.cls(igraph_net, net.deg, wt,
  outfile = "plasmid_clusters2", title = "")





##################### add cluster membership to phyloseq object 
##################### add cluster membership to phyloseq object 
##################### add cluster membership to phyloseq object 
##################### add cluster membership to phyloseq object 
##################### add cluster membership to phyloseq object 
##################### add cluster membership to phyloseq object 
library(expss)

head(nodes)

tax_table=as.data.frame(physeq_plasflow_50pc@tax_table@.Data)
head(tax_table)
names(tax_table)<-c("contig_id" ,"PredictedOrigin", "Class" , "Plasmid_ID" ,"Assigned_cluster")


#add cluster membership to atx table

tax_table$ClusterMembership<-vlookup(tax_table$contig_id, nodes, lookup_column = "label", result_column = "ClusterMembership")

head(tax_table)

tax_table<-tax_table[order(tax_table$ClusterMembership),]

unique(tax_table$ClusterMembership)

## need to manually put in clusters for the NA values

clusters<-subset(tax_table, is.na(ClusterMembership))
head(clusters)



clusters$ClusterMembership<-97:(nrow(clusters)+96) ### need to edit if you reanalyse clusters

tail(clusters)

clusters1<-subset(tax_table, !is.na(ClusterMembership))

head(clusters1)
tail(clusters1)

### rbind the two dataframes 

tax_table_new<-rbind(clusters1, clusters)

head(tax_table_new)
tail(tax_table_new)

freq<-data.frame(table(tax_table_new$ClusterMembership))

max(freq$Freq)

tax_table_new$ClusterMembership<-as.character(tax_table_new$ClusterMembership)


tax_table_new<-tax_table_new[,-5]


## add ID method

head(thalder_plasmid_metadata)

tax_table_new$ID_method<-tax_table_new$contig_id %in% thalder_plasmid_metadata$contig_id

table(tax_table_new$ID_method)

subset(tax_table_new,ID_method ==TRUE)

#plasmid cluster 10 and plasmid cluster 1044

#add back to physeq

TAX<-tax_table(tax_table_new)

head(TAX)

taxa_names(TAX)<-tax_table_new$contig_id


tax_table(physeq_plasflow_50pc)<-TAX

colnames(tax_table(physeq_plasflow_50pc)) <-c("contig_id" ,"PredictedOrigin", "Class" , "Plasmid_ID" ,"Assigned_genome_cluster", "ClusterMembership", "StalderPlasmid")


head(tax_table(physeq_plasflow_50pc))

saveRDS(physeq_plasflow_50pc, "plasmid_50pc_97pc_unmerged.RDS")


################################# merge by plasmid cluster ############
################################# merge by plasmid cluster ############
################################# merge by plasmid cluster ############
################################# merge by plasmid cluster ############


tax_table=as.data.frame(physeq_plasflow_50pc@tax_table@.Data)


head(tax_table)

merged_tax_table<-tax_table[,c(6,1)]

head(merged_tax_table)

##add back to phyloseq object temporarily to merge by cluster

TAX<-tax_table(merged_tax_table)

head(TAX)

taxa_names(TAX)<-merged_tax_table$contig_id


tax_table(physeq_plasflow_50pc)<-TAX

colnames(tax_table(physeq_plasflow_50pc)) <-c("PlasmidCluster","contig_id")


############## merge

merged_plasmidcluster_physeq<-tax_glom(physeq_plasflow_50pc, taxrank = "PlasmidCluster", NArm = FALSE)


#### now  put back tax table


tax_table_old=as.data.frame(physeq_merged@tax_table@.Data)
tax_table_merged=as.data.frame(merged_plasmidcluster_physeq@tax_table@.Data)


head(tax_table_old)
head(tax_table_merged)

tax_table_merged$contig_id<-row.names(tax_table_merged)

tax_table_merged$Origin<-vlookup(tax_table_merged$contig_id, tax_table_old, lookup_column = "ta1", result_column = "ta2")
tax_table_merged$GenomeCluster<-vlookup(tax_table_merged$contig_id, tax_table_old, lookup_column = "ta1", result_column = "ta6")

tax_table_merged<-tax_table_merged[,c(2,3,4,1)]

subset(tax_table_merged, PlasmidCluster == "10")
subset(tax_table_merged, PlasmidCluster == "1044")

tax_table_merged$Plasmid_ID<-NA
tax_table_merged$Plasmid_ID<-vlookup(tax_table_merged$PlasmidCluster, tax_table_new, lookup_column = "ClusterMembership", result_column = "Plasmid_ID")


##add back to physeq object

TAX<-tax_table(tax_table_merged)

head(TAX)

taxa_names(TAX)<-tax_table_merged$contig_id


tax_table(merged_plasmidcluster_physeq)<-TAX

colnames(tax_table(merged_plasmidcluster_physeq)) <-c("contig_id", "Origin", "GenomeCluster", "PlasmidCluster", "Plasmid_ID")

saveRDS(merged_plasmidcluster_physeq, "plasmid_50pc_97pc_merged.RDS")

### two final physeq objects

readRDS("plasmid_50pc_97pc_merged.RDS")
readRDS("plasmid_50pc_97pc_unmerged.RDS")
