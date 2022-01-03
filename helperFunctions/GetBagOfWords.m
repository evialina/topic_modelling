function [bow] = GetBagOfWords(documents) 
    bow = bagOfWords(documents);
    bow = removeInfrequentWords(bow, 2);
    bow = removeLongWords(bow, 15);
    bow = removeEmptyDocuments(bow);

    % Calculate IDF scores for each word in the bag-of-words
    numOfDocsWithWord = sum(bow.Counts(:, :) >= 1);
    idfScores = log(bow.NumDocuments./numOfDocsWithWord(:,:));

    PaintHistogramOfIdfScoreCounts(idfScores);

    % Remove all the words that have IDF score < 5
    lowIdfWordIdxs = idfScores(1, :) < 5;
    bow = removeWords(bow, lowIdfWordIdxs);
end

function [] = PaintHistogramOfIdfScoreCounts(idfScores) 
    [~, maxidx] = max(idfScores);
    maxScore = idfScores(:, maxidx);

    figure
    edges = 0:0.5:ceil(maxScore);
    histogram(idfScores, 'BinEdges', edges)

    title('Distribution of Words IDF Scores')
    xlabel('IDF Score')
    ylabel('Word Count')
end
