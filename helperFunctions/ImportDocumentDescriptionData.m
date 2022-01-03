function [tokenizedDocuments] = ImportDocumentDescriptionData()
    doclabDocumentsData = readtable('./Data/doclab-documents-data.csv');
    
    % Remove all rows where description is 'NULL'
    doclabDocumentsData(ismember(doclabDocumentsData.description, 'NULL'),:) = [];
    
    documentsDescriptions = doclabDocumentsData.description;
    tokenizedDocuments = tokenizedDocument(documentsDescriptions);
end