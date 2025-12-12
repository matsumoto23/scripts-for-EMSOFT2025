for i = 1:1
    for j = 1:2
        status = rmdir('../Ext/ModelsData/Cache/*', 's')
        diary ("./log/stl" + int2str(i) + "/" + int2str(j) + ".txt")
        cpuStartTime = cputime
        realStartTime = tic
        run(i)
        realEndTime = toc(realStartTime)
        cpuTime = cputime - cpuStartTime
        diary off
    end
end