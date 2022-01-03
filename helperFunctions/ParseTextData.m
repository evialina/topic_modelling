function [parsedDocuments] = ParseTextData(tokenizedDocument, wordNormStyle)
    parsedDocuments = erasePunctuation(tokenizedDocument);
    parsedDocuments = addPartOfSpeechDetails(parsedDocuments);
    parsedDocuments = normalizeWords(parsedDocuments, 'Style', wordNormStyle);
    parsedDocuments = removeStopWords(parsedDocuments);
    parsedDocuments = removeShortWords(parsedDocuments, 2);
end