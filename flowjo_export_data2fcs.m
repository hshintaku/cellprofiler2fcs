function flowjo_export_data2fcs(filename, variable, hdr)
%listpar={'FSC-A','SSC-A','Venus-A','Pacific Blue-A','mCherry-A'};;
data=variable(:,1:3);
data=data{:,:};
marker_names={hdr.par.name2};
channel_names={hdr.par.name};
fca_writefcs(filename, data, marker_names,channel_names,hdr)
end