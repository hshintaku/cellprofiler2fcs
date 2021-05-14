%addpath('W:\public\shintaku\github\MatlabCytofUtilities\fcs');
%data_path='/home/watson/pihome/2021/Kaneko/1_Data/2_Microscopy/20210316/20210421_Output/No1_Control';
%project='Fucci';
%experiment='Control';
function cellprofiler_xlsx2fcs(data_path,pattern,project,experiment)
filelist = dir(strcat(data_path,"/",pattern));
filelist
for icnt=1:length(filelist)
    cells=filelist(icnt).name;
    start_time=datetime('now','TimeZone','local','Format',' HH:mm:ss');
    variable=readtable(fullfile(data_path,filelist(icnt).name));
    end_time=datetime('now','TimeZone','local','Format',' HH:mm:ss');
    time = variable(:,10);
    variabledata = array2table(rescale(table2array(variable(:,39:40))));
    ObjNumdata = variable(:,67);
    TrackedObjNumdata = variable(:,72);
    TrackedObjIndx = variable(:,73);
    TraIndex = variable(:,1);
    variabledata = [time,variabledata,ObjNumdata,TrackedObjNumdata,TrackedObjIndx,TraIndex];
    fcsfilename=cat(2,fullfile(data_path,filelist(icnt).name),'.fcs');
    num_events=size(variable);
    [fcs_hdr]=flowjo_create_fcs_metadata(start_time,end_time,project,experiment,cells,...
            fcsfilename,data_path,num_events(1));
    flowjo_export_data2fcs(fcsfilename, variabledata, fcs_hdr)
end