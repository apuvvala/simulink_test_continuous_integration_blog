import matlab.unittest.TestRunner
import matlab.unittest.plugins.TAPPlugin
import matlab.unittest.plugins.ToFile

jenkins_workspace = getenv('WORKSPACE');
try
    % Pick up local tests
    suite = testsuite();
    
    tapResultsFile = fullfile(jenkins_workspace, 'TAPResults.tap');
    
    % Create and configure the runner
    runner = TestRunner.withTextOutput('Verbosity',3);
    runner.addPlugin(TAPPlugin.producingVersion13(ToFile(tapResultsFile)));

    % Run tests
    results = runner.run(suite);
    display(results);
catch e
    disp(getReport(e, 'extended'));
    exit(1);
end
exit