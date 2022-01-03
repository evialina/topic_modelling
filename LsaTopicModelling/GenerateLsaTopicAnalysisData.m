lsaTopicsTags = readtable('./Data/lsa-topics-tags.xlsx');

filename = './Data/out/lsa-topics-analysis-data.xlsx';
GenerateTopicAnalysisData(lsaTopicsTags, filename);

fprintf(['Excel document with LSA analysis data ' ...
    'was generated and stored in the following location: \n', ...
    filename, '\n'])