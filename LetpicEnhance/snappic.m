function st = snappic(na, ns, picPath_mt)

%the values of aper is na ans that of shutter speed is ns.
command1_mt = ['echo ' num2str(na)];
dos(command1_mt);

command2_mt = ['echo ' picPath_mt];
dos(command2_mt);

%Proof it enters cmd prompt
dos('notepad &');

%% MT,
% dos(take a picture using that na and ns and save it where you want)
% just enter the command in place of echo, do change the format
% You can use it next!! :)
%picPath_mt is the image adress, where it should be stored

