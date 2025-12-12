%% Initialize the chasing cars model
function InitCC( BrCC )

%% Describes and generate driving scenarios
% We create an input generator that will alternates between acceleration and braking

BrCC.Sys.tspan =0:.01:101;
input_gen.type = 'UniStep';
input_gen.cp = 20;
BrCC.SetInputGen(input_gen);

% enable caching
strct.UseDiskCaching = true;
BrCC.SetupOptions(strct);

for cpi = 0:input_gen.cp -1
    throttle_sig = strcat('In1_u',num2str(cpi));
    BrCC.SetParamRanges({throttle_sig},[0.0 1.0]);
    brake_sig = strcat('In2_u',num2str(cpi));
    BrCC.SetParamRanges({brake_sig},[0.0 1.0]);
end

CC_Falsify = BrCC.copy();
end