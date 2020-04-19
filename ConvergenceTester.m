%%Convergence Analysis script

    %Load data up first manually

    xmeans = [CMAES_struct.x_mean];
    newmeans = [CMAES_struct.New_x_mean];
    bounds = CMAES_struct.Bounds;
    ranges = bounds(:,2)- bounds(:,1);
    percentChangeArray = 100* abs((newmeans-xmeans)./ranges);
    [n, gen] = size(xmeans);

    avgPercentChange = sum(percentChangeArray)/n;

    convergeGen = 0;
    tolerance = 5;  %In percent
    for i = 1:length(avgPercentChange)
        if (convergeGen ==0) && (avgPercentChange(i) <= tolerance)
            convergeGen = i;
        end
    end

    if convergeGen == 0
        fprintf('The data did not converge within %d generations\n', gen);  
    else
        fprintf('The data converges at generations %d\n', convergeGen);
    end

    figure(1);
    plot(1:gen,percentChangeArray)
    title('Percent Change for each parameter');
    xlabel('Generations')
    ylabel('Change in means (%)');
    legend();

    figure(2);
    plot(1:gen,avgPercentChange)
    title('Average Percent Change across parameters');
    xlabel('Generations')
    ylabel('Change in means (%)')

    clear


