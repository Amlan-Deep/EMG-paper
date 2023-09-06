clear all
close all
clc

fs = 2000; % sampling rate "Hz"

% Replace 'your_file_path' with the path to the specific CSV file you want to process.
file_path = 'C:\Users\USER\Downloads\csv\11_filtered.csv';

% Check if the file exists
if exist(file_path, 'file') ~= 2
    error('File not found.');
end

% Load the CSV data
data = csvread(file_path);

% Define the desired segment start and end times
signal_segment_starting = 0; % indicate the desired beginning of segment as sec (usually 0 or 1)
signal_segment_ending = 6;   % indicate the desired ending of segment as sec (usually 5 or 6)

for rep = 0:4
    for gesture = 0:9
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%USE THE CODE BELOW FOR YOUR MULTI-CHANNEL ANALYSIS%%%
        start_sample = (signal_segment_starting + rep * 134 + gesture * 10) * fs + 1;
        end_sample = (signal_segment_starting + rep * 134 + gesture * 10 + signal_segment_ending) * fs;
        
        multi_channel_sEMG_data = data(start_sample:end_sample, :);
        % It provides 6 seconds sEMG data of a single gesture belonging to 4-channel sEMG data.
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%                 USE HERE "multi_channel_sEMG_data" TO ANALYZE               %%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        % Save the processed data as a CSV file
        file_name = sprintf('Participant11_Rep%d_Gesture%d.csv', rep, gesture);
        csvwrite(file_name, multi_channel_sEMG_data);
    end % gesture for
end % rep for

