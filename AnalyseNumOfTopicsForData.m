tokenizedDocumentsDescription = ImportDocumentDescriptionData();
parsedDocumentsDescriptions = ParseTextData(... 
     tokenizedDocumentsDescription, 'lemma');
[documentsDescriptionsTrain, documentsDescriptionsTest] = ...
    SplitDataIntoTrainAndTest(parsedDocumentsDescriptions);

descriptionsBag = GetBagOfWords(documentsDescriptionsTrain);

numOfTopics = [10 15 20 40 60 80 100 120 140 160 180];

for num = 1:size(numOfTopics, 2)
    lda = fitlda(descriptionsBag, numOfTopics(num));
    
    [~, testDataPerplexity(num)] = logp(lda, documentsDescriptionsTest);
    fittingTime(num) = lda.FitInfo.History.TimeSinceStart(end);
end

figure

yyaxis left
plot(numOfTopics, testDataPerplexity)
ylabel("Goodness-of-fit (Perplexity)")

yyaxis right
plot(numOfTopics, fittingTime)
ylabel("Fitting Time (s)")

xlabel("Number of Topics")
legend(["Goodness-of-fit (Perplexity)" "Fitting Time (s)"])

