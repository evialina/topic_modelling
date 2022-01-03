ldaTopicsTags = readtable('./Data/lda-topics-tags.xlsx');

filename = './Data/out/lda-topics-analysis-data.xlsx';
GenerateTopicAnalysisData(ldaTopicsTags, filename);

fprintf(['Excel document with LDA analysis data ' ...
    'was generated and stored in the following location: \n', ...
    filename, '\n'])