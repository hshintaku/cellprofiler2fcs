%addpath('W:\public\shintaku\github\MatlabCytofUtilities\fcs');
%data_path='Z:\2021\Kaneko\1_Data\2_Microscopy\20210312\0311_HeLaFucci(CA)2_x10_4';
%pattern='H*COM*_ed.csv';
%project='Fucci';
%experiment='ELP';
function cellprofiler_xlsx2fcs(data_path,pattern,project,experiment)
filelist = dir(strcat(data_path,"/",pattern));
filelist
for icnt=1:length(filelist)
    cells=filelist(icnt).name;
    start_time=datetime('now','TimeZone','local','Format',' HH:mm:ss');
    variable=readtable(fullfile(data_path,filelist(icnt).name));
    % Extract numeric data
    variableNumeric = variable(:,vartype('numeric'));
    variableNames = variableNumeric.Properties.VariableNames;
    end_time=datetime('now','TimeZone','local','Format',' HH:mm:ss');
    variabledata = variableNumeric;
    fcsfilename=cat(2,fullfile(data_path,filelist(icnt).name),'.fcs');
    num_events=size(variableNumeric);
    [fcs_hdr]=flowjo_create_fcs_metadata(start_time,end_time,project,experiment,cells,...
            fcsfilename,data_path,num_events(1),variableNames);
    flowjo_export_data2fcs(fcsfilename, variabledata, fcs_hdr)
end