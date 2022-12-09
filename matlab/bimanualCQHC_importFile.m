function D=bimanualCQHC_importFile(fileIn)

%%% Import data from CSV file collected by psychoPy (bimanualCQ_probeUnused)
% called by cqPD_ana's 'loadData' case
%
% Foundation written by K. Kornysheva, September 2021
% Adjusted and expanded by R. Yewbrey, October 2022

% In tbl format
tbl = readtable(fileIn);

%%% Convert to output type
%data info
% participant = num2cell(tbl.participant);
participant = tbl.participant;
day = tbl.day;
date = tbl.date;
seqSet = tbl.seqSet;

%conditions
trialType = grp2idx(tbl.trialType); %1: InstructedB; 2: Probe 3: MemoryB
fractal = grp2idx(tbl.fractalIm); % 1: fractal_1, 2: Fractal_8
probeTargetPos=tbl.mapping; %% NOTE: this data is offset by one row!!!
corrKeys = {'y','u','i','l'; 'r','e','w','a'};

%response data
% RTs = tbl.RTs;
RTs = cellfun(@str2num, tbl.RTs, 'UniformOutput', false);%turns RTs from strings in cells to nums in cells
Digits = tbl.Digits;
yList = tbl.yList;
points=tbl.finalPoints;
respList=tbl.respList;
corAnsList=tbl.corAnsList;

%%% Write into the output structure D
% presets the variables to specific size, for later looping
maxpress=4;
% D.subjID=cell(size(day,1),1); %participant ID number
D.subjID=nan(size(day,1),1); %participant ID number
D.day=cell(size(day,1),1); %day 1/2/3
D.date=cell(size(RTs,1),1); %date completed
D.seqSet=cell(size(day,1),1); %seqSet = S01 or S02
D.trialType=nan(size(day,1),1); %1: InstructedB; 2: Probe 3: MemoryB
D.fractal=nan(size(day,1),1); %fractal number (1/2)
D.RT=nan(size(day,1),maxpress); %time of each press rel to go
D.press=nan(size(day,1),maxpress); %target presses
D.error=nan(size(day,1),maxpress); %errors = 1
D.probeTargetPos=nan(size(day,1),1); %probe position in sequence
D.points=nan(size(day,1),1); %points scored
D.response=nan(size(day,1),maxpress); %actual presses
D.targetResp=nan(size(day,1),maxpress); %target presses
D.responseKey=cell(size(day,1),maxpress); %actual presses
D.targetRespKey=cell(size(day,1),maxpress); %target presses

for i=1:size(D.RT,1) %for trials, adding data as it goes
    
    if i == 810
        D;
    end
    
    if ~isnan(points(i,1)) %if not empty (filled with values or characters)
        %Write out variables with length of 1:
        %         D.subjID{i}= convertCharsToStrings(participant{i});
        D.subjID(i)= participant(i);
        D.day{i}= convertCharsToStrings(day{i});
        D.date{i}=date(i);
        D.seqSet{i,1}=seqSet{i};
        D.trialType(i,:)=trialType(i);
        D.fractal(i,:)=fractal(i);
        D.points(i,1)=points(i);
        D.probeTargetPos(i)=probeTargetPos(i-1); %NOTE: this data is offset by one row!!!
        
        %Write out data values from strings for vectors of different length:
        try %sequence
            %             D.RT(i,:)=str2num(RTs{i,1});
            D.RT(i,:)=RTs{i,1};
            D.press(i,:)=str2num(Digits{i,1});
            D.responseKey(i,:)=extractBetween(respList{i},'"','"')';
            D.targetRespKey(i,:)=extractBetween(corAnsList{i},'"','"')';
            [~, D.response(i,:)]=ismember(D.responseKey(i,:), corrKeys(D.fractal(i,:),:));
            [~, D.targetResp(i,:)]=ismember(D.targetRespKey(i,:), corrKeys(D.fractal(i,:),:));
            D.error(i,:)=D.response(i,:) ~= D.press(i,:);
            %             D.error(i,:)=str2num(yList{i,1});
            
        catch % < 4 presses or single press
            D.RT(i,1:numel(RTs{i,1}))=str2double(RTs{i,1});
            D.press(i,1:numel(Digits(i,1)))=str2double(Digits(i,1));
            D.probeTargetPos(i,1)=NaN; %if no value, write out NaN
            D.responseKey(i,1:numel(RTs{i,1}))=extractBetween(respList{i},'"','"')';
            D.targetRespKey(i,1:numel(extractBetween(corAnsList{i},'"','"')'))=extractBetween(corAnsList{i},'"','"')';
            
            try %if there's no response to the trial, the below will error...
                D.response(i,1:numel(cellstr(str2double(respList{i,1}))))=cellstr(str2double(respList{i,1}));
            catch %so fill with NaNs
                D.response(i,1) = NaN;
            end%try if no response
            
            D.error(i,:)=D.response(i,:) ~= D.press(i,:);
        end%try sequence
    end%if not empty
    
    
end%for trials

%%% Clean-up:
% Remove rows without trial response data

% D.subjID = [D.subjID(:)]'; D.subjID = num2cell(D.subjID);
D.day = [D.day{:}]';

numrow=(isnan(D.points)); %1: no trial data; 0: trial data


% D.subjID = D.subjID(~cellfun(@isempty, D.subjID(:,1)), :);
D.subjID(numrow==1,:)=[];
D.day = D.day(~cellfun(@isempty, D.day(:,1)), :);
D.date = D.date(~cellfun(@isempty, D.day(:,1)), :);
D.seqSet(numrow==1,:)=[];
D.trialType(numrow==1,:)=[];
D.fractal(numrow==1,:)=[];
D.RT(numrow==1,:)=[];
D.press(numrow==1,:)=[];
D.response(numrow==1,:)=[];
D.error(numrow==1,:)=[];
D.points(numrow==1,:)=[];
D.probeTargetPos(numrow==1,:)=[];
D.targetResp(numrow==1,:)=[];
D.responseKey(numrow==1,:)=[];
D.targetRespKey(numrow==1,:)=[];

%%% Remove copies of 1st press in col 2-4 (Probe trials)
cond=2;
D.RT(D.trialType==cond,2:4)=NaN;
D.press(D.trialType==cond,2:4)=NaN;
D.error(D.trialType==cond,2:4)=NaN;

% Determine the target sequence
targetSequence = NaN(2,4);
D.targetSeq = NaN(size(D.press,1),maxpress);
for i=1:2%for two sequences
    targetSequence(i,:) = unique(D.press(D.fractal == i & D.trialType == 1,:),'stable')';
    D.targetSeq(D.fractal == i,:) = repmat(targetSequence(i,:),length(D.press(D.fractal == i)),1);
end



disp(D)