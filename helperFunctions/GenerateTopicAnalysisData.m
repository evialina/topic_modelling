function [] = GenerateTopicAnalysisData(topicsTagsTab, resultingFilename)
    wordNormStyle = 'stem';
    % This contains top 15 model generated words for each topic
    tokenizedActualTopicTags = tokenizedDocument(topicsTagsTab.ActualTopicTags); 
    tokenizedActualTopicTags = ParseTextData(tokenizedActualTopicTags, ...
        wordNormStyle);
    
    % This contains human defined tags for each of the model generated
    % topic
    tokenizedIdentifiedTopicTags = tokenizedDocument(...
        topicsTagsTab.SubjectIdentifiedTopicTags);
    tokenizedIdentifiedTopicTags = ParseTextData(tokenizedIdentifiedTopicTags,...
        wordNormStyle);
    
    % True positives (TP): Number of correct (model defined) tags identified by a human
    % False positives (FP): Number of false tags selected by a human
    % False negatives (FN): Number of model defined tags that are not
    % identified by a human
    numTopics = size(topicsTagsTab, 1);
    TP = zeros(numTopics, 1);
    FP = zeros(numTopics, 1);
    FN = zeros(numTopics, 1);
    
    for topicIdx = 1:numTopics
        tagsActual = tokenizedActualTopicTags(topicIdx);
        tagsIdentified = tokenizedIdentifiedTopicTags(topicIdx);
    
        for tagIdent = 1:numel(tagsIdentified.Vocabulary)
           matching = sum(tagsActual.Vocabulary == tagsIdentified.Vocabulary(tagIdent));
           TP(topicIdx) = TP(topicIdx) + matching;
        end
        
        FP(topicIdx) = numel(tagsIdentified.Vocabulary) - TP(topicIdx);
        FN(topicIdx) = numel(tagsActual.Vocabulary) - TP(topicIdx);
    end
    
    Precision = TP ./ (TP + FP);
    Recall = TP ./ (TP + FN);
    FMeasure = 2 * (Precision .* Recall) ./ (Precision + Recall);
    
    % Replace all NaNs with zeros
    FMeasure(isnan(FMeasure)) = 0;
    
    % Store generated data
    TopicsAnalysisData = [topicsTagsTab, table(TP, FP, FN,...
        Precision, Recall, FMeasure)];
    
    writetable(TopicsAnalysisData, resultingFilename);
end