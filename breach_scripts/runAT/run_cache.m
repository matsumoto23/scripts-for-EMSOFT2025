%% Falsify AT_M4-fixed using Breach

function run( stl_index )

InitBreach;
BrAT = BreachSimulinkSystem('Autotrans_shift');
InitAT(BrAT);

stl_list = STL_ReadFile("./stl" + int2str(stl_index) + ".stl");

numFalsified = 0;

total_time = 0;
for spec = stl_list
    % BrATSample = BrAT.copy();
    % if round > 0
    %     BrATSample.SetParam(params, res);
    % end
    falsif_pb = FalsificationProblem(BrAT, spec);
    % We use CMA-ES
    falsif_pb.max_time = max(20 * 60 - total_time, 1); % give the solver 20 minutes to falsify the property
    falsif_pb.max_obj_eval = inf;
    falsif_pb.setup_cmaes()
    tic;
    falsif_pb.SaveInCache();
    res = falsif_pb.solve();
    current_exec_time = toc;
    total_time = total_time + current_exec_time;
    if falsif_pb.obj_best >= 0
        fprintf("Faled to falsify %s\n", '!!');
    else
        fprintf("Falsified %s\n", '!!');
        numFalsified = numFalsified + 1;
    end
    if (total_time >= 1200)
        fprintf("Timeout: 600 seconds has passed!\n");
        break;
    end
    round = round + 1;
    res;
end

fprintf("%d specifications are falsified\n", numFalsified);
fprintf("The total time to falsify the falsifiable specifications is: %s [s]\n", total_time);
