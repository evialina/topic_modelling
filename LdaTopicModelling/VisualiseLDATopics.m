load('ldaModel.mat');
numOfTopics = lda.NumTopics;

PaintTopicsWordClouds(lda, numOfTopics);

% Select 3 top words for each topic
for topic = 1:numOfTopics
    top = topkwords(lda, 3, topic);
    topWords(topic) = join(top.Word, ', ');
end

PaintDocumentClusters(lda, topWords);

% Paint 12 randomly selected topics as word coulds
function [] = PaintTopicsWordClouds(lda, numOfTopics)
    figure
    layout = tiledlayout('flow');
    title(layout, 'Randomly Selected LDA Topics')

    randomlySelectedTopicsIdxs = randperm(numOfTopics, 12);
    for i = 1:size(randomlySelectedTopicsIdxs, 2)
        topicIdx = randomlySelectedTopicsIdxs(i);
        nexttile
        wordcloud(lda, topicIdx);
        title("Topic " + topicIdx)
    end
end

function [] = PaintDocumentClusters(lda, topWords)
    figure

    XY = tsne(lda.DocumentTopicProbabilities);
    [~, topTopics] = max(lda.DocumentTopicProbabilities, [], 2);
    
    gscatter(XY(:,1), XY(:,2), topTopics)

    title('LDA Topic Mixtures')
    legend(topWords, 'NumColumns', 2)
end