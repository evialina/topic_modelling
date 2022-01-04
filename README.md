# topic_modelling

## Repository Structure

### Data/

**doclab-documents-data.csv** - Raw Data Used to Perform Topic Modelling (extracted from DocLab system)

**lda-topics-tags.xlsx** - LDA Topic Labels - contains top 15 words defined by the LDA model and a human defined labels/tags for each topic.

**lsa-topics-tags.xlsx** - LSA Topic Labels - contains top 15 words defined by the LSA model and a human defined labels/tags for each topic.


### LdaTopicModelling/
  
**FitLDA.m** - MATLAB script that can be run to fit LDA model for the given (raw) data set and save the model as ldaModel.mat file.

**ldaModel.mat** - Originally fitted LDA model that is loaded into your MATLAB workspace by some of the MATLAB scripts in this directory.

**VisualiseLDATopics.m** - MATLAB script that loads the fitted LDA model (ldaModel.mat file) and visualise the model with 2 different figures:
1. Word clouds of 12 randonmly selected topics figure
2. t-SNE visualisation of documents clusters
      
**GenerateLdaTopicAnalysisData.m** - MATLAB Script that can be run to produce some analytical data (will be saved as /Data/out/lda-topics-analysis-data.xlsx) for the originally fitted LDA model using data from /Data/lda-topics-tags.xlsx.
    
**PredictTopicsForDocuments.m** - MATLAB Script that can be run to visualise successfull and unsuccessfull examples of topic assignment to some articles using the  fitted LDA model (ldaModel.mat file).

    
### LsaTopicModelling/

**FitLSA.m** - MATLAB script that can be run to fit LSA model for the given (raw) data set and save the model as lsaModel.mat file.

**lsaModel.mat** - Originally fitted LSA model that is loaded into your MATLAB workspace by some of the MATLAB scripts in this directory.

**VisualiseLSATopics.m** - MATLAB script that loads the fitted LSA model (lsaModel.mat file) and visualise the model with 2 different figures:
1. Word clouds of 12 randonmly selected topics figure
2. t-SNE visualisation of documents clusters
      
**GenerateLsaTopicAnalysisData.m** - MATLAB Script that can be run to produce some analytical data (will be saved as /Data/out/lsa-topics-analysis-data.xlsx) for the originally fitted LSA model using data from /Data/lsa-topics-tags.xlsx.


### helperFunctions/

This directory contains various MATLAB functions that were created (for reusability purposes) to be used by the main scripts within folders LdaTopicModelling and LsaTopicModelling.
