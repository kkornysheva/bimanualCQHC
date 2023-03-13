function rawFileName = bimanualCQHC_prepFileNames
% Defines the filenames for bimanualCQHC experiment.
% Edit accordingly
% RY 01/2023


participants = {...
    '26246'...
    '27386'...
    '27462'...
    '27219'...
    '27420'...
    '27831'...
    '27257'...
    '27638'...
    '27745'...
    '27227'...
    %     ''...
    %     ''...
    };

%     '27782'...
files = dir('*.csv'); files = {files.name};
rawFileName = cell(length(participants),3);

for i=1:length(participants)
    rawFileName(i,:) = files(contains(files, participants{i}));
end

%Name of psychoPy excel data files, subj x day matrix. Keep neat for your own sake
% rawFileName={...
%     '24425_bimanualCQ_HC_2022-11-10_15h28.34.605','','';
%     '26626_bimanualCQ_HC_2022-12-15_17h51.31.770','26626_bimanualCQ_HC_2022-12-17_13h59.36.712','26626_bimanualCQ_HC_2022-12-18_22h53.52.265';
%     %     '27055_bimanualCQ_HC_2022-09-08_12h40.12.919','','';
%     %     '27115_bimanualCQ_HC_2022-12-03_15h40.11.859',''.'';
%     %     '27127_bimanualCQ_HC_2022-09-23_15h26.34.409','27127_bimanualCQ_HC_2022-09-24_15h50.41.000','27127_bimanualCQ_HC_2022-09-25_21h49.16.770';...
%     '27129_bimanualCQ_HC_2022-11-28_16h48.31.565','27129_bimanualCQ_HC_2022-11-29_16h46.01.681','27129_bimanualCQ_HC_2022-12-01_08h32.53.280';
%     '27130_bimanualCQ_HC_2022-12-02_12h46.58.651','27130_bimanualCQ_HC_2022-12-03_12h03.02.619','27130_bimanualCQ_HC_2022-12-04_13h50.34.185';
%     %     '27131_bimanualCQ_HC_2022-12-02_17h41.48.560','','';
%     '27134_bimanualCQ_HC_2022-11-30_09h55.06.394','27134_bimanualCQ_HC_2022-12-09_12h16.19.700','27134_bimanualCQ_HC_2022-12-10_20h05.31.137';
%     %     '27135_bimanualCQ_HC_2022-12-05_10h49.50.695','27135_bimanualCQ_HC_2022-12-06_12h52.02.987','';
%     '27139_bimanualCQ_HC_2022-11-29_10h42.04.512','27139_bimanualCQ_HC_2022-11-30_10h03.18.632','27139_bimanualCQ_HC_2022-12-01_11h07.28.476';
%     '27150_bimanualCQ_HC_2022-11-17_13h48.50.509','27150_bimanualCQ_HC_2022-11-18_15h36.12.882','27150_bimanualCQ_HC_2022-11-19_18h32.07.965';...
%     %     '27151_bimanualCQ_HC_2022-12-16_21h05.46.227','','';
%     %     '27152_bimanualCQ_HC_2022-09-25_15h24.49.561','27152_bimanualCQ_HC_2022-09-26_18h38.15.499','27152_bimanualCQ_HC_2022-09-27_18h08.34.785';...
%     '27153_bimanualCQ_HC_2022-12-08_19h34.48.131','27153_bimanualCQ_HC_2022-12-09_22h10.33.282','27153_bimanualCQ_HC_2022-12-10_23h19.59.598';
%     %     '27157_bimanualCQ_HC_2022-11-29_22h34.55.767','','';
%     '27158_bimanualCQ_HC_2022-12-06_13h12.13.582','27158_bimanualCQ_HC_2022-12-07_17h44.52.434','27158_bimanualCQ_HC_2022-12-09_13h56.18.510';
%     '27163_bimanualCQ_HC_2022-12-08_15h26.34.110','27163_bimanualCQ_HC_2022-12-09_15h15.06.167','27163_bimanualCQ_HC_2022-12-10_17h37.59.961';
%     '27169_bimanualCQ_HC_2022-11-17_22h56.12.160','27169_bimanualCQ_HC_2022-11-19_00h27.45.135','27169_bimanualCQ_HC_2022-11-20_00h08.51.922';...
%     %     '27183_bimanualCQ_HC_2022-11-28_12h07.34.827','','';
%     '27184_bimanualCQ_HC_2022-11-10_17h56.03.205','27184_bimanualCQ_HC_2022-11-11_19h05.28.538','27184_bimanualCQ_HC_2022-11-12_18h44.13.237';...
%     %     '27186_bimanualCQ_HC_2022-11-21_16h02.53.623','','';
%     '27191_bimanualCQ_HC_2022-11-28_16h26.33.041','27191_bimanualCQ_HC_2022-11-29_15h47.31.158','27191_bimanualCQ_HC_2022-11-30_15h31.00.019';
%     '27192_bimanualCQ_HC_2022-11-17_13h26.03.074','27192_bimanualCQ_HC_2022-11-18_15h40.07.718','27192_bimanualCQ_HC_2022-11-19_14h58.08.968';...
%     %     '27205_bimanualCQ_HC_2022-09-24_16h19.12.889','27205_bimanualCQ_HC_2022-09-25_16h17.26.471','27205_bimanualCQ_HC_2022-09-26_16h28.52.077';...
%     '27208_bimanualCQ_HC_2022-11-11_12h36.38.516','27208_bimanualCQ_HC_2022-11-12_14h21.18.666','27208_bimanualCQ_HC_2022-11-13_16h22.23.437';...
%     '27210_bimanualCQ_HC_2022-11-29_10h38.13.275','27210_bimanualCQ_HC_2022-11-30_21h04.27.551','27210_bimanualCQ_HC_2022-12-01_21h25.48.279';
%     '27215_bimanualCQ_HC_2022-12-07_16h37.02.469','27215_bimanualCQ_HC_2022-12-08_16h36.28.758','27215_bimanualCQ_HC_2022-12-09_18h06.01.564';
%     '27223_bimanualCQ_HC_2022-12-01_16h47.58.647','27223_bimanualCQ_HC_2022-12-02_14h34.12.273','27223_bimanualCQ_HC_2022-12-03_15h25.11.922';
%     '27224_bimanualCQ_HC_2022-11-28_11h13.06.717','27224_bimanualCQ_HC_2022-11-29_20h12.17.432','27224_bimanualCQ_HC_2022-11-30_19h40.05.891';
%     %     '27232_bimanualCQ_HC_2022-12-09_09h20.40.401','','';
%     %     '27234_bimanualCQ_HC_2022-09-26_17h38.39.469','27234_bimanualCQ_HC_2022-09-27_18h18.07.440','';
%     %*CHECK, EXTRA DAY*   '27235_bimanualCQ_HC_2022-11-28_17h32.46.160','27235_bimanualCQ_HC_2022-11-30_16h05.46.521','27235_bimanualCQ_HC_2022-12-01_17h13.09.776';
%     '27246_bimanualCQ_HC_2022-11-29_23h45.26.242','27246_bimanualCQ_HC_2022-11-30_23h32.25.880','27246_bimanualCQ_HC_2022-12-01_23h10.05.178';
%     %     '27250_bimanualCQ_HC_2022-11-24_21h42.40.004','','';
%     '27251_bimanualCQ_HC_2022-11-17_18h23.45.715','27251_bimanualCQ_HC_2022-11-18_21h11.10.341','27251_bimanualCQ_HC_2022-11-19_20h27.52.639';...
%     '27255_bimanualCQ_HC_2022-11-28_09h51.35.366','27255_bimanualCQ_HC_2022-11-29_14h43.58.025','27255_bimanualCQ_HC_2022-11-30_20h15.51.713';
%     %     '27260_bimanualCQ_HC_2022-12-02_11h04.16.403','','';
%     '27265_bimanualCQ_HC_2022-11-11_19h47.09.501','27265_bimanualCQ_HC_2022-11-12_19h27.35.092','27265_bimanualCQ_HC_2022-11-13_19h13.08.695';...
%     '27266_bimanualCQ_HC_2022-12-01_20h29.12.283','27266_bimanualCQ_HC_2022-12-03_16h46.59.499','27266_bimanualCQ_HC_2022-12-04_22h08.41.814';
%     '27367_bimanualCQ_HC_2022-11-22_23h20.55.171','27367_bimanualCQ_HC_2022-11-28_15h21.48.908','27367_bimanualCQ_HC_2022-11-29_17h14.03.869';
%     '27377_bimanualCQ_HC_2022-11-24_17h32.03.751','27377_bimanualCQ_HC_2022-11-25_20h24.33.817','27377_bimanualCQ_HC_2022-11-26_21h18.37.226';
%     '27380_bimanualCQ_HC_2022-12-12_15h14.47.316','27380_bimanualCQ_HC_2022-12-13_17h14.50.140','27380_bimanualCQ_HC_2022-12-15_13h55.07.588';
%     '27395_bimanualCQ_HC_2022-12-02_23h55.22.397','27395_bimanualCQ_HC_2022-12-03_23h22.35.077','27395_bimanualCQ_HC_2022-12-05_19h11.22.733';
%     %     '27399_bimanualCQ_HC_2022-12-06_21h00.01.835','','';
%     %     '27413_bimanualCQ_HC_2022-11-25_10h13.11.612','','';
%     '27419_bimanualCQ_HC_2022-12-05_16h09.21.656','27419_bimanualCQ_HC_2022-12-06_22h18.38.356','27419_bimanualCQ_HC_2022-12-08_15h53.50.092';
%     '27427_bimanualCQ_HC_2022-12-01_14h09.47.613','27427_bimanualCQ_HC_2022-12-02_14h04.13.177','27427_bimanualCQ_HC_2022-12-03_16h09.31.429';
%     '27435_bimanualCQ_HC_2022-12-01_14h12.03.644','27435_bimanualCQ_HC_2022-12-03_12h24.15.600','27435_bimanualCQ_HC_2022-12-04_15h01.08.785';
%     '27438_bimanualCQ_HC_2022-12-10_14h58.35.070','27438_bimanualCQ_HC_2022-12-12_12h31.46.243','27438_bimanualCQ_HC_2022-12-13_11h50.27.948';
%     '27444_bimanualCQ_HC_2022-12-12_21h34.46.124','27444_bimanualCQ_HC_2022-12-13_21h06.12.346','27444_bimanualCQ_HC_2022-12-14_21h27.41.581';
%     '27445_bimanualCQ_HC_2022-11-30_10h53.18.705','27445_bimanualCQ_HC_2022-12-02_00h13.46.967','27445_bimanualCQ_HC_2022-12-07_13h17.48.884';
%     '27453_bimanualCQ_HC_2022-12-06_18h56.03.695','27453_bimanualCQ_HC_2022-12-07_19h54.05.482','27453_bimanualCQ_HC_2022-12-08_19h54.13.698';
%     %     '27454_bimanualCQ_HC_2022-12-12_15h28.50.313','27454_bimanualCQ_HC_2022-12-13_15h27.44.649','';
%     %     '27456_bimanualCQ_HC_2022-12-13_23h48.40.060','','';
%     %*CHECK, EXTRA DAY* '27479_bimanualCQ_HC_2022-12-01_19h05.21.255','27479_bimanualCQ_HC_2022-12-02_20h30.58.471','27479_bimanualCQ_HC_2022-12-03_22h55.41.485';
%     '27481_bimanualCQ_HC_2022-11-28_11h07.38.884','27481_bimanualCQ_HC_2022-11-29_11h58.02.517','27481_bimanualCQ_HC_2022-11-30_11h49.28.117';
%     %*CHECK, EXTRA DAY* '27483_bimanualCQ_HC_2022-12-05_19h06.08.299','27483_bimanualCQ_HC_2022-12-06_20h58.49.563','27483_bimanualCQ_HC_2022-12-08_03h05.42.332';
%     '27489_bimanualCQ_HC_2022-12-11_08h07.06.528','27489_bimanualCQ_HC_2022-12-12_08h17.38.397','27489_bimanualCQ_HC_2022-12-13_11h58.33.593';
%     '27499_bimanualCQ_HC_2022-11-24_21h58.13.198','27499_bimanualCQ_HC_2022-11-25_22h40.40.436','27499_bimanualCQ_HC_2022-11-26_22h27.42.764';
%     %     '27504_bimanualCQ_HC_2022-12-16_11h31.13.689','','';
%     '27509_bimanualCQ_HC_2022-11-22_21h32.20.730','27509_bimanualCQ_HC_2022-11-24_17h22.35.931','27509_bimanualCQ_HC_2022-11-25_19h25.00.123';
%     '27511_bimanualCQ_HC_2022-11-22_21h23.39.531','27511_bimanualCQ_HC_2022-11-24_17h21.48.800','27511_bimanualCQ_HC_2022-11-25_19h07.35.075';
%     '27526_bimanualCQ_HC_2022-12-02_12h25.05.921','27526_bimanualCQ_HC_2022-12-03_15h55.13.072','27526_bimanualCQ_HC_2022-12-04_15h39.27.967';
%     %*CHECK, EXTRA DAY* '27532_bimanualCQ_HC_2022-12-07_07h37.48.049','27532_bimanualCQ_HC_2022-12-07_16h10.10.700','27532_bimanualCQ_HC_2022-12-08_16h07.20.106';
%     '27536_bimanualCQ_HC_2022-12-02_19h41.55.084','27536_bimanualCQ_HC_2022-12-03_19h02.23.462','27536_bimanualCQ_HC_2022-12-04_21h46.26.895';
%     %     '27643_bimanualCQ_HC_2022-11-28_17h52.37.802','27643_bimanualCQ_HC_2022-12-19_02h32.51.431','';
%     '27645_bimanualCQ_HC_2022-11-17_13h55.40.948','27645_bimanualCQ_HC_2022-11-18_17h47.31.406','27645_bimanualCQ_HC_2022-11-19_17h37.26.565';...
%     '27652_bimanualCQ_HC_2022-11-15_11h47.20.001','27652_bimanualCQ_HC_2022-11-16_15h03.04.948','27652_bimanualCQ_HC_2022-11-17_14h34.26.494';...
%     '27666_bimanualCQ_HC_2022-12-14_20h44.04.369','27666_bimanualCQ_HC_2022-12-15_22h27.57.463','27666_bimanualCQ_HC_2022-12-16_23h45.52.404'


%     };
% rawFileName = strcat(rawFileName, '.csv');