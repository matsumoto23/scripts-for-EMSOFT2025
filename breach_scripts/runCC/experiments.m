for i = 10:12
    for j = 1:30
        diary ("./log/stl" + int2str(i) + "/" + int2str(j) + ".txt")
        cpuStartTime = cputime
        realStartTime = tic
        run(i)
        realEndTime = toc(realStartTime)
        cpuTime = cputime - cpuStartTime
        diary off
    end
end