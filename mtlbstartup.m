% clear;clc

[DSSStartOK, DSSObj, DSSText] = DSSStartup;
if DSSStartOK
    DSSText.command='Compile (C:\Users\Lixue Zhang\Documents\opendssVSmatpower\opendss\3.4.1\dss3.4.1.dss)';
    % Set up the interface variables
    DSSCircuit=DSSObj.ActiveCircuit;
    DSSSolution=DSSCircuit.Solution;

    % DSSText.Command='RegControl.creg1a.maxtapchange=1  Delay=15  !Allow only one tap change per solution. This one moves first';
   % DSSText.Command='RegControl.creg2a.maxtapchange=1  Delay=30  !Allow only one tap change per solution';
    %DSSText.Command='RegControl.creg3a.maxtapchange=1  Delay=30  !Allow only one tap change per solution';
    %DSSText.Command='RegControl.creg4a.maxtapchange=1  Delay=30  !Allow only one tap change per solution';
    %DSSText.Command='RegControl.creg3c.maxtapchange=1  Delay=30  !Allow only one tap change per solution';
    %DSSText.Command='RegControl.creg4b.maxtapchange=1  Delay=30  !Allow only one tap change per solution';
    %DSSText.Command='RegControl.creg4c.maxtapchange=1  Delay=30  !Allow only one tap change per solution';

    %DSSText.Command='Set MaxControlIter=30';

    % Solve executes the solution for the present solution mode, which is "snapshot".

    DSSSolution.SolveNoControl;
    disp(['Result='  DSSText.Result])
    if DSSSolution.Converged 
       a = 'Solution Converged';
       disp(a)
    else
       a = 'Solution did not Converge';
       disp(a)    
    end
    
     DSSText.Command='Export Voltages';
     DSSText.Command='Export YPrims';
     DSSText.Command='Export Powers';
     DSSText.Command='Export currents';
%      
     DSSText.Command='vsource.source.enabled=no' ;
     DSSText.Command='vsource.source2.enabled=no' ;
     DSSText.Command='vsource.source3.enabled=no' ;
     DSSText.Command='load.loada.enabled=no' ;
     DSSText.Command='load.loadb.enabled=no' ;
     DSSText.Command='load.loadc.enabled=no' ;
     DSSText.Command='solve';
     DSSText.Command='export Y';
%      

     
     
%      DSSText.Command='Formedit vsource.source';
%      DSSText.Command='Formedit Transformer.SUB';
%      DSSText.Command='Formedit Line.LINE1';
%      DSSText.Command='Formedit Load.LOAD1';
    disp(DSSText.Result)

    %DSSSolution.SampleControlDevices;
    %DSSCircuit.CtrlQueue.Show;
    disp(DSSText.Result)
    %DSSSolution.DoControlActions;
    %DSSCircuit.CtrlQueue.Show;

     %DSSText.Command='Buscoords Buscoords.dat   ! load in bus coordinates';
else
    a = 'DSS Did Not Start'
    disp(a)
end

% ËãDSSµÄµ¼ÄÉ¾ØÕó
Y = DSSCircuit.SystemY;
R = reshape(Y(:,1:2:end),9,9);
X = reshape(Y(:,2:2:end),9,9);
Y_dss2 = R+i*X;