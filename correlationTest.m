function tests = correlationTest
% Function based MATLAB Unit test to test the correlation of the output

tests = functiontests(localfunctions);

function testCorrelationWithDesiredSignal(testCase)
model = 'audioanc_mabdemo';

% Simulate the model
simout = sim(model, 'StopTime', '5');

% Capture signal reference and desired signal
signalReference = simout.yout.getElement(2).Values.Data;
desiredSignal   = simout.yout.getElement(3).Values.Data;

% Compute the correlation
r = corrcoef(signalReference(1,:), desiredSignal(1,:));

% Ensure that they are stronly correlated
verifyEqual(testCase, r(2,1), single(0.9404), 'RelTol', single(0.01));
