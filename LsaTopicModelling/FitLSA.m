tokenizedDocumentsDescription = ImportDocumentDescriptionData();
parsedDocumentsDescriptions = ParseTextData(... 
     tokenizedDocumentsDescription, 'lemma');
descriptionsBag = GetBagOfWords(parsedDocumentsDescriptions); 

numOfTopics = 80;
lsa = fitlsa(descriptionsBag, numOfTopics);

save('lsaModel.mat', 'lsa');