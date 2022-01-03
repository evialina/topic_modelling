tokenizedDocumentsDescription = ImportDocumentDescriptionData();
parsedDocumentsDescriptions = ParseTextData(... 
    tokenizedDocumentsDescription, 'lemma');
descriptionsBag = GetBagOfWords(parsedDocumentsDescriptions); 

rng('default')
numOfTopics = 80;
lda = fitlda(descriptionsBag, numOfTopics);

save('ldaModel.mat', 'lda');