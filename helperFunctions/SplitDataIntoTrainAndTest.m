function [documentsTrain, documentsTest] = SplitDataIntoTrainAndTest(parsedDocuments)
    randPartition = cvpartition(numel(parsedDocuments), 'HoldOut', 0.1);
    documentsTrain = parsedDocuments(randPartition.training);
    documentsTest = parsedDocuments(randPartition.test);
end