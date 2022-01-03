load('ldaModel.mat');

% Predict topics for all documents
tokenizedDocuments = ImportDocumentDescriptionData();
documents = ParseTextData(tokenizedDocuments, 'lemma');

[topicIdx, scores] = predict(lda, documents, ...
    'IterationLimit', 200);


% Generate successful and unsuccessful topic prediction examples
documentsEg = ['Case-Based Learning (CBL) has become an effective pedagogy for student-centered learning in medical education, which is founded on persistent patient …'; ...
    'Background Accurate assessment of dietary intake is important for planning, implementing of health promotion and when evaluating the effectiveness of public health interventions. However, measuring dietary intake is one of the most challenging aspects of public health research as no dietary method can measure dietary intake without error. Therefore, strategies that support researchers to choose the most appropriate dietary assessment method will help to strengthen research in this field. This study, undertaken for the Diet@net consortium aims to establish expert consensus on best practice guidelines (BPG) for carrying out dietary assessment in order to help non-experts in collecting dietary information. Methods The guidelines were developed through a Delphi consultation technique (Moher recommendations). Two Delphi rounds were conducted using self-administered questionnaires, asking for prioritisation of suggested guidelines. Twelve expert members of the BPG-working group reviewed findings from participants and finalised the guidelines. Results One hundred and thirty - experts were invited to take part, of whom 65 agreed to participate. Forty-eight completed Delphi-I and 51 Delphi-II. Overall, a total of 57 experts from different countries contributed feedback; these included nutritional epidemiologists, statisticians, and public health specialists. Initially, 47 statements were included in the guidelines. Following both Delphi rounds this was reduced to 43. The final consensus BPG includes four main stages with eight sub-sections. These stages are summarised as follows: Conclusion Delphi techniques allowed us to synthesise experts  consensus on best practice in assessing dietary intake. The BPG will help non-expert researchers to consider key factors when selecting a DAT. These guidelines will be included on the Nutritools website (). Nutritools will host interactive dietary assessment tools and guidance for nutrition researchers, healthcare practitioners and other scientists.'];

tokenizedDocumentsEg = tokenizedDocument(documentsEg);
tokenizedDocumentsEg = ParseTextData(tokenizedDocumentsEg, 'lemma');

[topicIdxEg, scoresEg] = predict(lda, tokenizedDocumentsEg, ... 
    'IterationLimit', 200);

% Display topic scores for a random document with a sucessful 
% topic assignment
figure
bar(scoresEg(2, :))
title('LDA Topic Prediction Scores (Successful Example)')
xlabel('Topic Index')
ylabel('Score')

% Display topic scores for a random document with a not so sucessful 
% topic assignment
figure
bar(scoresEg(1, :))
title('LDA Topic Prediction Scores (Unsuccessful Example)')
xlabel('Topic Index')
ylabel('Score')