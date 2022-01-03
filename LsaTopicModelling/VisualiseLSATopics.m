load('lsaModel.mat');
numOfTopics = lsa.NumComponents;

% Get absolute word score values
absoluteWordScores = abs(lsa.WordScores);

% Create a table with word scores for each topics
words = table(lsa.Vocabulary');
wordsScores = array2table(absoluteWordScores);
wordsScores(:, 'words') = words;

PaintTopicsWordClouds(wordsScores, numOfTopics);
PaintDocumentClusters(lsa, numOfTopics, wordsScores);

% Paint 12 randomly selected topics as word coulds
function [] = PaintTopicsWordClouds(wordsScores, numOfTopics)
    figure
    layout = tiledlayout('flow');
    title(layout, 'Randomly Selected LSA Topics')

    randomlySelectedTopicsIdxs = randperm(numOfTopics, 12);
    for i = 1:numel(randomlySelectedTopicsIdxs)
        topicIdx = randomlySelectedTopicsIdxs(i);
        nexttile
        wordcloud(wordsScores, 'words', ['absoluteWordScores', num2str(topicIdx)])
        title("Topic " + topicIdx)
    end
end

function [] = PaintDocumentClusters(lsa, numOfTopics, wordsScores)
    % Get 3 top words for each topic
    for topic = 1:numOfTopics
        sortedForTopic = sortrows(wordsScores, ['absoluteWordScores', num2str(topic)]);
        topWordsTb = sortedForTopic([end-2 end-1 end], numOfTopics + 1);
        topWords(topic) = join(topWordsTb.words, ', ');
    end
    
    figure

    XY = tsne(lsa.DocumentScores);
    [~, topTopics] = max(lsa.DocumentScores, [], 2);
    
    gscatter(XY(:,1), XY(:,2), topTopics)

    title('LSA Topic Mixtures')
    legend(topWords, 'NumColumns', 2)
end